# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Fam do
  include_context 'tempdir'

  let(:input_pathname) { tempdir_pathname.join('family-in.json') }
  let(:output_pathname) { tempdir_pathname.join('family-out.json') }

  let(:input_state) { {} }

  before do
    write(path: input_pathname, json_hash: input_state)
  end

  describe '.add_person' do
    subject do
      described_class.add_person(
        input_path: input_pathname,
        output_path: output_pathname,
        person_name: 'Adam'
      )
    end

    context 'with a new person' do
      it_behaves_like 'a successful response', 'Added person: Adam'

      it 'persists the person' do
        subject

        expect(read(path: output_pathname)).to eq(Adam: [])
      end
    end

    context 'with an existing person' do
      let(:input_state) { { 'Adam' => [] } }

      it_behaves_like 'a failed response', "Person 'Adam' already in family"
      it_behaves_like 'does not persist any state'
    end
  end

  describe '.add_parents' do
    subject do
      described_class.add_parents(
        input_path: input_pathname,
        output_path: output_pathname,
        child_name: 'Adam',
        parent_names: parent_names
      )
    end

    context 'with an existing child' do
      let(:input_state) { { 'Adam' => [] } }

      context 'when child has no parents' do
        context 'adding one parent' do
          let(:parent_names) { ['Bob'] }
          let(:input_state) { super().merge('Bob' => []) }

          it_behaves_like 'a successful response', 'Added Bob as parents of Adam'
          it_behaves_like 'a child-parent relationship', 'Adam', 'Bob'
        end

        context 'adding two parents' do
          let(:parent_names) { ['Bob', 'Betsy'] }
          let(:input_state) { super().merge('Bob' => [], 'Betsy' => []) }

          it_behaves_like 'a successful response', 'Added Bob & Betsy as parents of Adam'
          it_behaves_like 'a child-parent relationship', 'Adam', ['Bob', 'Betsy']
        end
      end

      context 'when child has one parent' do
        let(:input_state) { { 'Adam' => ['Bob'], 'Bob' => [], 'Betsy' => [] } }

        context 'adding one parent' do
          let(:parent_names) { ['Betsy'] }

          it_behaves_like 'a successful response', 'Added Betsy as parents of Adam'
          it_behaves_like 'a child-parent relationship', 'Adam', ['Bob', 'Betsy']
        end

        context 'adding two parents' do
          let(:parent_names) { ['Betsy', 'Brian'] }
          let(:input_state) { super().merge('Brian' => []) }

          it_behaves_like 'a failed response', "Child 'Adam' can't have more than 2 parents!"
          it_behaves_like 'does not persist any state'
        end
      end

      context 'when child has two parents' do
        let(:parent_names) { ['Brian'] }
        let(:input_state) { { 'Adam' => ['Bob', 'Betsy'], 'Bob' => [], 'Betsy' => [], 'Brian' => [] } }

        it_behaves_like 'a failed response', "Child 'Adam' can't have more than 2 parents!"
        it_behaves_like 'does not persist any state'
      end

      context 'adding a non-existent parent' do
        let(:parent_names) { ['Bob'] }

        it_behaves_like 'a failed response', "No such person 'Bob' in family"
        it_behaves_like 'does not persist any state'
      end
    end

    context 'with a non-existent child' do
      let(:parent_names) { ['Bob', 'Betsy'] }

      it_behaves_like 'a failed response', "No such person 'Adam' in family"
    end
  end

  describe '.get_person' do
    subject do
      described_class.get_person(
        input_path: input_pathname,
        person_name: 'Adam'
      )
    end

    context 'with an existing person' do
      let(:input_state) { { 'Adam' => [] } }

      it_behaves_like 'a successful response', 'Adam'
    end

    context 'with a non-existent person' do
      it_behaves_like 'a failed response', "No such person 'Adam' in family"
    end
  end

  describe '.get_parents' do
    subject do
      described_class.get_parents(
        input_path: input_pathname,
        child_name: 'Adam'
      )
    end

    context 'with an existing child' do
      context 'with parents' do
        let(:input_state) { { 'Adam' => ['Bob', 'Betsy'], 'Bob' => [], 'Betsy' => [] } }

        it_behaves_like 'a successful response', "Bob\nBetsy"
      end

      context 'with no parents' do
        let(:input_state) { { 'Adam' => [] } }

        it_behaves_like 'a successful response', ''
      end
    end

    context 'with a non-existent child' do
      it_behaves_like 'a failed response', "No such person 'Adam' in family"
    end
  end

  describe '.get_grandparents' do
    let(:greatness) { 0 }

    subject do
      described_class.get_grandparents(
        input_path: input_pathname,
        child_name: 'Adam',
        greatness: greatness
      )
    end

    context 'with an existing child' do
      context 'with greatness 0' do
        context 'with a full tree' do
          let(:input_state) do
            {
              'Adam' => ['Bob', 'Betsy'],
              'Bob' => ['Chris', 'Carol'],
              'Betsy' => ['Carl', 'Chrystal'],
              'Chris' => [],
              'Carol' => [],
              'Carl' => [],
              'Chrystal' => []
            }
          end

          it_behaves_like 'a successful response', "Chris\nCarol\nCarl\nChrystal"
        end

        context 'with no grandparents' do
          let(:input_state) do
            {
              'Adam' => ['Bob', 'Betsy'],
              'Bob' => [],
              'Betsy' => [],
            }
          end

          it_behaves_like 'a successful response', ''
        end
      end

      context 'with greatness 1' do
        let(:greatness) { '1' }

        context 'with a full tree' do
          let(:input_state) do
            {
              'Adam' => ['Bob', 'Betsy'],
              'Bob' => ['Chris', 'Carol'],
              'Betsy' => ['Carl', 'Chrystal'],
              'Chris' => ['Don', 'Diane'],
              'Carol' => ['Dave', 'Dasha'],
              'Carl' => ['Dude', 'Daisy'],
              'Chrystal' => ['Dan', 'Destiny'],
              'Don' => [],
              'Diane' => [],
              'Dave' => [],
              'Dasha' => [],
              'Dude' => [],
              'Daisy' => [],
              'Dan' => [],
              'Destiny' => [],
            }
          end

          it_behaves_like 'a successful response', "Don\nDiane\nDave\nDasha\nDude\nDaisy\nDan\nDestiny"
        end
      end

      context 'with greatness 2' do
        let(:greatness) { '2' }

        context 'with a full tree' do
          let(:input_state) do
            {
              'Adam' => ['Bob', 'Betsy'],
              'Bob' => ['Chris', 'Carol'],
              'Betsy' => ['Carl', 'Chrystal'],
              'Chris' => ['Don', 'Diane'],
              'Carol' => ['Dave', 'Dasha'],
              'Carl' => ['Dude', 'Daisy'],
              'Chrystal' => ['Dan', 'Destiny'],
              'Don' => ['Ed', 'Emma'],
              'Diane' => ['Edd', 'Emily'],
              'Dave' => ['Eddy', 'Elizabeth'],
              'Dasha' => ['Eddie', 'Ella'],
              'Dude' => ['Edward', 'Eleanore'],
              'Daisy' => ['Eggbert', 'Ellie'],
              'Dan' => ['Easports', 'Eliana'],
              'Destiny' => ['Einstein', 'Elena'],
              'Ed' => [],
              'Emma' => [],
              'Edd' => [],
              'Emily' => [],
              'Eddy' => [],
              'Elizabeth' => [],
              'Eddie' => [],
              'Ella' => [],
              'Edward' => [],
              'Eleanore' => [],
              'Eggbert' => [],
              'Ellie' => [],
              'Easports' => [],
              'Eliana' => [],
              'Einstein' => [],
              'Elena' => [],
            }
          end

          it_behaves_like 'a successful response', "Ed\nEmma\nEdd\nEmily\nEddy\nElizabeth\nEddie\nElla\nEdward\nEleanore\nEggbert\nEllie\nEasports\nEliana\nEinstein\nElena"
        end
      end
    end

    context 'with a non-existent child' do
      it_behaves_like 'a failed response', "No such person 'Adam' in family"
    end
  end
end
