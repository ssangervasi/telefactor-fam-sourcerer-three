# frozen_string_literal: true

require 'fam/family/serialization/family_deserializer'

module Fam::Family::IO
  module TreeReader
    def load_from_file(input_path)
      load_tree(read_hash_from_input_path(input_path))
    end

    private

    def read_hash_from_input_path(input_path)
      Fam::File::Reader.create(path: input_path).read
    end

    def load_tree(input_hash)
      Fam::Family::Serialization::FamilyDeserializer.deserialize(input_hash: input_hash)
    end
  end
end
