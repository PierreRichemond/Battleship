require_relative "../models/player.rb"
require_relative "players_controller.rb"

RSpec.describe PlayersController do
  describe '#win?' do
    subject { controller.win? }

    let(:player) do
      Player.new
    end
    let(:opponent) do
      Player.new
    end
    let(:controller) do
      PlayersController.new(player, opponent)
    end

    context 'doesn\'t win' do
      context 'player only shot 2 times and missed' do
        let(:opponent) do
          Player.new(
          boats: [[[0, 0], [0, 1], [0, 2]], [[4, 4], [3, 4], [2, 4], [1, 4]]]
        )
        end
        it { expect(subject).to be_falsy }
      end

      context 'player only shot 2 times only and hit both' do
        let(:opponent) do
          Player.new(
          boats: [[[0, 0], "Hit!", "Hit!"], [[4, 4], [3, 4], [2, 4], [1, 4]]]
        )
        end
        it { expect(subject).to be_falsy }
      end

      context 'player sunk only one boat' do
        let(:opponent) do
          Player.new(
          boats: [["Hit!", "Hit!", "Hit!"], [[4, 4], [3, 4], [2, 4], [1, 4]]]
        )
        end
        it { expect(subject).to be_falsy }
      end

      context 'player sunk one boat and hit the second one' do
        let(:opponent) do
          Player.new(
          boats: [["Hit!", "Hit!", "Hit!"], ["Hit!", "Hit!", [2, 4], [1, 4]]]
        )
        end
        it { expect(subject).to be_falsy }
      end
    end

    context 'wins' do
      context 'Hits all the opponent\'s boat' do
        let(:opponent) do
          Player.new(
          boats: [["Hit!", "Hit!", "Hit!"], ["Hit!", "Hit!", "Hit!", "Hit!"]]
        )
        end
        it { expect(subject).to be_truthy }
      end
    end
  end
end
