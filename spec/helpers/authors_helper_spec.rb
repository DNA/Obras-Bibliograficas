require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the AuthorsHelper. For example:
#
# describe AuthorsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe AuthorsHelper, type: :helper do
  describe '#validation_status' do
    let(:model) { Author.new(name: name) }

    context 'when the model is invalid' do
      let(:name) { nil }

      it { expect(helper.validation_status(model)).to include('text-red') }
      it { expect(helper.validation_status(model)).to include('não pode ficar em branco') }
    end

    context 'when the model is valid' do
      let(:name) { 'Fulano' }

      it { expect(helper.validation_status(model)).to include('text-green') }
      it { expect(helper.validation_status(model)).to include('válido!') }
    end
  end
end
