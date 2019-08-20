# frozen_string_literal: true

module Fam::Family::Serialization
  class FamilyDeserializer
    class << self
      def deserialize(input_hash:)
        mutating_member_hash = {}

        input_hash.keys.reverse_each do |person_name|
          create_person(mutating_member_hash, input_hash, person_name)
        end

        Fam::Family::FamilyTree.new(members: mutating_member_hash.to_a.reverse.to_h)
      end

      private

      def create_person(mutating_member_hash, input_hash, person_name)
        raise "Person '#{person_name}' Found Twice in input" if mutating_member_hash.key?(person_name)

        parents = input_hash[person_name].map { |parent_name| find_parent(mutating_member_hash, parent_name, person_name) }

        mutating_member_hash[person_name] = Fam::Family::Person.new(name: person_name, parents: parents)
      end

      def find_parent(mutating_member_hash, parent_name, person_name)
        mutating_member_hash[parent_name.to_sym].tap do |parent|
          raise "Parent '#{parent_name}' not found for '#{person_name}'" if parent.nil?
        end
      end
    end
  end
end
