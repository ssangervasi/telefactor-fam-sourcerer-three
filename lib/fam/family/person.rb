# frozen_string_literal: true

require 'types'

module Fam::Family
  class Person < Dry::Struct
    attribute :name, Types::Strict::Symbol
    attribute :parents, Types::Array.of(Person)

    def add_parents(parent_list:)
      new(parents: parents + parent_list)
    end
  end
end
