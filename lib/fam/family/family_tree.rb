# frozen_string_literal: true

require 'dry/monads'
require 'fam/family/person'

module Fam::Family
  class FamilyTree < Dry::Struct
    include Dry::Monads[:result]

    attribute :members, Types::Hash.map(Types::Strict::Symbol, Fam::Family::Person)

    def add_person(name:)
      return Failure("Person '#{name}' already in family") if members.key?(name.to_sym)

      person = Fam::Family::Person.new(name: name, parents: [])
      members[name] = person
      Success("Added person: #{name}")
    end

    def add_parents(child:, parents:)
      child_person = members[child]
      return person_not_found(child) if child_person.nil?

      parent_persons = parents.map do |parent_name|
        members[parent_name].tap do |parent|
          return person_not_found(parent_name) if parent.nil?
        end
      end

      child_person.add_parents(parent_list: parent_persons)
    end

    def get_person(person_name:)
      return person_not_found(person_name) if members[person_name].nil?

      Success(person_name.to_s)
    end

    def get_parents(person_name:)
      person = members[person_name]
      return person_not_found(person_name) if person.nil?

      Success(person.parents.map(&:name).join("\n"))
    end

    def get_grandparents(person_name:, greatness:)
      person = members[person_name]
      return person_not_found(person_name) if person.nil?

      grand_parents = person.parents.flat_map(&:parents)

      (0...greatness.to_i).each do
        grand_parents = grand_parents.flat_map(&:parents)
      end

      Success(grand_parents.map(&:name).map(&:to_s).join("\n"))
    end

    private

    def person_not_found(person_name)
      Failure("No such person '#{person_name}' in family")
    end
  end
end
