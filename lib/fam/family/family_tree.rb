# frozen_string_literal: true

require 'fam/family/person'

module Fam::Family
  class FamilyTree < Dry::Struct
    attribute :members, Types::Hash.map(Types::Strict::Symbol, Fam::Family::Person)

    def add_person(name:)
      person = Fam::Family::Person.new(name: name, parents: [])

      Fam::Family::FamilyTree.new(members: members.merge(name => person))
    end
  end
end
