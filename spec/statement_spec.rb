require 'statement'

describe Statement do
  let(:statement) { described_class.new}

  describe 'Statement initalization' do
    it 'starts with a blank history' do
      expect(statement.history.length).to eq 0 
    end
  end
end
