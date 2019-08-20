# frozen_string_literal: true

module Fam::Family::Serialization
  class FamilySerializer
    def self.serialize(family:)
      {}.tap do |mutating_hash|
        family.members.each do |member|
          name = member.first.to_s
          parents_names = member.last.parents.map { |p| p.name.to_s }

          mutating_hash[name] = parents_names
        end
      end
    end
  end
end
