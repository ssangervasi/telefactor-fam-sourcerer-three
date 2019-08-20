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
      Success(self)
    end

    def add_parents(child:, parents:)
      child_person = members[child]
      return Failure("No such person '#{child}' in family") if child_person.nil?

      parent_persons = parents.map do |parent_name|
        members[parent_name].tap do |parent|
          return Failure("No such person '#{parent_name}' in family") if parent.nil?
        end
      end

      child_person.add_parents(parent_list: parent_persons).fmap { self }
    end
  end
end
