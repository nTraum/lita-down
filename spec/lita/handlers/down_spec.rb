require 'spec_helper'

describe Lita::Handlers::Down, lita_handler: true do
  it { is_expected.to route_command('Is example.com down?').to(:down) }
  it { is_expected.to route_command('is example.com down?').to(:down) }

  describe 'Checking availability of a site' do
    context 'when Faraday returns any object' do
      before do
        faraday_double = double('faraday')
        expect(Faraday::Connection).to receive(:new).and_return(faraday_double)
        expect(faraday_double).to receive(:head).and_return(Object.new)
      end

      it 'responds that the site is up' do
        send_message('Is example.com down?')
        expect(replies.last).to eq("It's just you. example.com is up.")
      end
    end

    context 'when Faraday raises' do
      let(:expected_message) do
        "It's not just you! example.com looks down from here."
      end

      before do
        faraday_double = double('faraday')
        expect(Faraday::Connection).to receive(:new).and_return(faraday_double)
        expect(faraday_double).to receive(:head).and_raise
      end

      it 'responds that the site is down' do
        send_message('Is example.com down?')
        expect(replies.last).to eq(expected_message)
      end
    end
  end
end
