# frozen_string_literal: true

# This is the application library code!
require 'fam'

# Here are some helpers that were handy from the start!
require 'spec_helpers/hatchery'
require 'spec_helpers/tempdir'

include Fam::File::Helpers

RSpec.shared_examples 'a successful response' do |output|
  it('has the expected output') { expect(subject.output).to eq(output) }
  it('does not have an error') { expect(subject.error).to be_empty }
  it('has a status of 0') { expect(subject.status).to eq(0) }
end

RSpec.shared_examples 'a failed response' do |error|
  it('does not have any output') { expect(subject.output).to be_empty }
  it('has the expected error') { expect(subject.error).to eq(error) }
  it('has a non-zero status') { expect(subject.status).not_to eq(0) }
end

RSpec.shared_examples 'does not persist any state' do
  it 'does not write to the output file' do
    subject

    expect(read(path: output_pathname)).to eq({})
  end
end

RSpec.shared_examples 'a child-parent relationship' do |child, parents|
  it 'persists the relationship' do
    subject

    expect(read(path: output_pathname)[child.to_sym]).to eq([*parents])
  end
end
