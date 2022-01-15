require_relative "player.rb"

RSpec.describe Player do
  describe '#does_boat_can_be_placed?' do

    subject { player.does_boat_can_be_placed?(point_of_origin, direction, length) }

    # direction :
    # 1 ==>   Up
    # 2 ==>   Bot
    # 3 ==>   Right
    # 4 ==>   Left

    let(:player) do
      Player.new(grid: grid_content)
    end

    context 'when place first boat' do
      context 'when a boat of length 3 vertically out the board limit' do
        let(:grid_content) do
          [
            [false, false, false, false, false],
            [false, false, false, false, false],
            [false, false, false, false, false],
            [false, false, false, false, false],
            [false, false, false, false, false]
          ]
        end
        let(:point_of_origin) { [0, 0] }
        let(:direction) { 1 }
        let(:length) { 3 }

        it { expect(subject).to be_falsy }
      end

      context 'when a boat of length 3 vertically within the board limit' do
        let(:grid_content) do
          [
            [false, false, false, false, false],
            [false, false, false, false, false],
            [false, false, false, false, false],
            [false, false, false, false, false],
            [false, false, false, false, false]
          ]
        end
        let(:point_of_origin) { [0, 0] }
        let(:direction) { 2 }
        let(:length) { 3 }
          # 1 ==>   Up
    # 2 ==>   Bot
    # 3 ==>   Right
    # 4 ==>   Left

        it { expect(subject).to be_truthy }
      end

      context 'when point of origin negative' do
        let(:grid_content) do
          [
            [false, false, false, false, false],
            [false, false, false, false, false],
            [false, false, false, false, false],
            [false, false, false, false, false],
            [false, false, false, false, false]
          ]
        end
        let(:point_of_origin) { [-1, 0] }
        let(:direction) { 3 }
        let(:length) { 3 }

        it { expect(subject).to be_falsy }
      end

      context 'when point of origin nil' do
        let(:grid_content) do
          [
            [false, false, false, false, false],
            [false, false, false, false, false],
            [false, false, false, false, false],
            [false, false, false, false, false],
            [false, false, false, false, false]
          ]
        end
        let(:point_of_origin) { [-1, 0] }
        let(:direction) { 3 }
        let(:length) { 3 }

        it { expect(subject).to be_falsy }
      end

    end
    context 'when place the second boat' do
      context 'when a boat of length 4 vertically in limit and on a free spot' do
        let(:grid_content) do
          [
            [true, true, true, false, false],
            [false, false, false, false, false],
            [false, false, false, false, false],
            [false, false, false, false, false],
            [false, false, false, false, false]
          ]
        end
        let(:point_of_origin) { [1, 0] }
        let(:direction) { 3 }
        let(:length) { 4 }
            # 1 ==>   Up
    # 2 ==>   Bot
    # 3 ==>   Right
    # 4 ==>   Left

        it { expect(subject).to be_truthy }
      end

      context 'when a boat of length 4 horizontally in limit and on a free spot' do
        let(:grid_content) do
          [
            [true, true, true, false, false],
            [false, false, false, false, false],
            [false, false, false, false, false],
            [false, false, false, false, false],
            [false, false, false, false, false]
          ]
        end
        let(:point_of_origin) { [1, 4] }
        let(:direction) { 2 }
        let(:length) { 4 }
            # 1 ==>   Up
    # 2 ==>   Bot
    # 3 ==>   Right
    # 4 ==>   Left

        it { expect(subject).to be_truthy }
      end

      context 'when a boat of length 4 out of band' do
        let(:grid_content) do
          [
            [true, true, true, false, false],
            [false, false, false, false, false],
            [false, false, false, false, false],
            [false, false, false, false, false],
            [false, false, false, false, false]
          ]
        end
        let(:point_of_origin) { [1, 4] }
        let(:direction) { 1 }
        let(:length) { 4 }
            # 1 ==>   Up
    # 2 ==>   Bot
    # 3 ==>   Right
    # 4 ==>   Left

        it { expect(subject).to be_falsy }
      end

      context 'when a boat of length 4 origin is nil' do
        let(:grid_content) do
          [
            [true, true, true, false, false],
            [false, false, false, false, false],
            [false, false, false, false, false],
            [false, false, false, false, false],
            [false, false, false, false, false]
          ]
        end
        let(:point_of_origin) { [6, 4] }
        let(:direction) { 1 }
        let(:length) { 4 }
            # 1 ==>   Up
    # 2 ==>   Bot
    # 3 ==>   Right
    # 4 ==>   Left

        it { expect(subject).to be_falsy }
      end

      context 'when a boat of length 4 origin out of band' do
        let(:grid_content) do
          [
            [true, true, true, false, false],
            [false, false, false, false, false],
            [false, false, false, false, false],
            [false, false, false, false, false],
            [false, false, false, false, false]
          ]
        end
        let(:point_of_origin) { [-1, 4] }
        let(:direction) { 1 }
        let(:length) { 4 }
            # 1 ==>   Up
    # 2 ==>   Bot
    # 3 ==>   Right
    # 4 ==>   Left

        it { expect(subject).to be_falsy }
      end

      context 'when a second boat overlap the first horizontally' do
        let(:grid_content) do
          [
            [true, true, true, false, false],
            [false, false, false, false, false],
            [false, false, false, false, false],
            [false, false, false, false, false],
            [false, false, false, false, false]
          ]
        end
        let(:point_of_origin) { [0, 4] }
        let(:direction) { 4 }
        let(:length) { 4 }
            # 1 ==>   Up
    # 2 ==>   Bot
    # 3 ==>   Right
    # 4 ==>   Left

        it { expect(subject).to be_falsy }
      end

      context 'when a second boat overlap the first vertically' do
        let(:grid_content) do
          [
            [true, true, true, false, false],
            [false, false, false, false, false],
            [false, false, false, false, false],
            [false, false, false, false, false],
            [false, false, false, false, false]
          ]
        end
        let(:point_of_origin) { [3, 1] }
        let(:direction) { 1 }
        let(:length) { 4 }
            # 1 ==>   Up
    # 2 ==>   Bot
    # 3 ==>   Right
    # 4 ==>   Left

        it { expect(subject).to be_falsy }
      end
    end
  end


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
