# frozen_string_literal: true

require 'fam/family/serialization/family_serializer'

module Fam::Family::IO
  module TreeWriter
    def save_to_file(tree, output_path)
      write_hash_to_file(serialize_tree(tree), output_path)
    end

    private

    def serialize_tree(tree)
      Fam::Family::Serialization::FamilySerializer.serialize(family: tree)
    end

    def write_hash_to_file(output_hash, output_path)
      Fam::File::Writer.create(path: output_path).write(json_hash: output_hash)
    end
  end
end
