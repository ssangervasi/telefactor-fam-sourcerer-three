# frozen_string_literal: true

require 'dry/monads'
require 'types'

module Fam::Family
  class Person < Dry::Struct
    include Dry::Monads[:result]

    attribute :name, Types::Strict::Symbol
    attribute :parents, Types::Array.of(Person)

    def add_parents(parent_list:)
      return Failure("Child '#{name}' can't have more than 2 parents!") \
        if parents.size + parent_list.size > 2

      @attributes[:parents] += parent_list
      Success()
    end
  end
end
