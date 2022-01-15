require_relative "player.rb"

RSpec.describe Player do
  describe '#can_place_boat?' do

    subject { player.can_place_boat?(boat_pins) }

    let(:player) do
      Player.new(grid: grid_content)
    end


    context 'when place first boat' do
      context 'when a boat of lenght 3 horizontally within the board limit' do
        let(:grid_content) do
          [
            [false, false, false, false, false],
            [false, false, false, false, false],
            [false, false, false, false, false],
            [false, false, false, false, false],
            [false, false, false, false, false]
          ]
        end
        let(:boat_pins) { [[0, 1], [0, 2], [0, 3]] }

        it { expect(subject).to be_truthy }
      end

      context 'when a boat of lenght 3 vertically within the board limit' do
        let(:grid_content) do
          [
            [false, false, false, false, false],
            [false, false, false, false, false],
            [false, false, false, false, false],
            [false, false, false, false, false],
            [false, false, false, false, false]
          ]
        end

        let(:boat_pins) { [[0, 1], [1, 1], [2, 1]] }

        it { expect(subject).to be_truthy }
      end

      context 'when a boat of lenght 3 horizontally out of bounds' do
        let(:grid_content) do
          [
            [false, false, false, false, false],
            [false, false, false, false, false],
            [false, false, false, false, false],
            [false, false, false, false, false],
            [false, false, false, false, false]
          ]
        end

        let(:boat_pins) { [[0, 1], [0, 0], [0, -1]] }

        it { expect(subject).to be_falsy }
      end

      context 'when a boat of lenght 3 vertically out of bounds' do
        let(:grid_content) do
          [
            [false, false, false, false, false],
            [false, false, false, false, false],
            [false, false, false, false, false],
            [false, false, false, false, false],
            [false, false, false, false, false]
          ]
        end

        let(:boat_pins) { [[3, 0], [4, 0], [5, 0]] }

        it { expect(subject).to be_falsy }
      end
    end
    context 'when place second boat' do
      context 'when a boat of lenght 4 horizontally within the board limit does not overlap the first boat' do
        let(:grid_content) do
          [
            [true, true, true, false, false],
            [false, false, false, false, false],
            [false, false, false, false, false],
            [false, false, false, false, false],
            [false, false, false, false, false]
          ]
        end
        let(:boat_pins) { [[1, 1], [1, 2], [1, 3], [1, 4]] }

        it { expect(subject).to be_truthy }
      end

      context 'when a boat of lenght 4 vertically within the board limit does not overlap the first boat' do
        let(:grid_content) do
          [
            [true, true, true, false, false],
            [false, false, false, false, false],
            [false, false, false, false, false],
            [false, false, false, false, false],
            [false, false, false, false, false]
          ]
        end

        let(:boat_pins) { [[4, 4], [3, 4], [2, 4], [1, 4]] }

        it { expect(subject).to be_truthy }
      end

      context 'when a boat of lenght 4 horizontally within the board limit does not overlap the first boat' do
        let(:grid_content) do
          [
            [true, true, true, false, false],
            [false, false, false, false, false],
            [false, false, false, false, false],
            [false, false, false, false, false],
            [false, false, false, false, false]
          ]
        end

        let(:boat_pins) { [[0, 4], [0, 3], [0, 2], [0, 1]] }
        it {
          expect(subject).to be_falsy }
      end

      context 'when a boat of lenght 4 vertically within the board limit overlap the first boat' do
        let(:grid_content) do
          [
            [true, true, true, false, false],
            [false, false, false, false, false],
            [false, false, false, false, false],
            [false, false, false, false, false],
            [false, false, false, false, false]
          ]
        end

        let(:boat_pins) { [[3, 2], [2, 2], [1, 2], [0, 2]] }

        it { expect(subject).to be_falsy }
      end
    end
  end
end
