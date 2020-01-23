require 'rails_helper'

RSpec.describe Name do
  describe '#bibliography' do
    subject { described_class.new(test_string).bibliography }

    context 'with a single name' do
      let(:test_string) { 'Guimaraes' }
      it { is_expected.to be_eql('GUIMARAES') }
    end

    context 'with a simple name' do
      let(:test_string) { 'Andre Guimaraes Rosa' }
      it { is_expected.to be_eql('ROSA, Andre Guimaraes') }
    end

    context 'with a parental name' do
      let(:test_string) { 'Luis Rosa Neto' }
      it { is_expected.to be_eql('ROSA NETO, Luis') }
    end

    context 'with a non-capitalizable name' do
      let(:test_string) { 'LUIS DA SILVA DOS SANTOS' }
      it { is_expected.to be_eql('SANTOS, Luis da Silva dos') }
    end
  end

  describe '#titleize' do
    subject { described_class.new(test_string).titleize }

    context 'with a simple name' do
      let(:test_string) { 'LEONARDO PRADO' }
      it { is_expected.to be_eql('Leonardo Prado') }
    end

    context 'with a non-capitalizable name' do
      let(:test_string) { 'LEONARDO MARQUES DO PRADO' }
      it { is_expected.to be_eql('Leonardo Marques do Prado') }
    end
  end
end
