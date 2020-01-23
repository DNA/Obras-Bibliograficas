require 'rails_helper'

RSpec.describe Author, type: :model do
  let(:name) { 'Leonardo Prado' }

  subject { described_class.new(name: name) }
  
  describe 'Uniqueness name validation' do
    before do
      described_class.create!(name: name)
      subject.valid?
    end

    it { expect(subject.valid?).to be_falsy }
    it { expect(subject.errors.messages).to include(name: ['já está em uso']) }
  end

  describe '#name' do
    it { expect(subject.name).to be_a Name }
  end

  describe '#name=' do
    let(:name) { '  Fulano  ' }

    it { expect(subject.name).to be_eql 'Fulano' }
  end
end
