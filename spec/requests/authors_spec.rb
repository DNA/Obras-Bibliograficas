require 'rails_helper'

RSpec.describe "Authors", type: :request do
  describe "GET /authors" do
    before { get authors_path }

    it { expect(response).to have_http_status(:ok) }
  end

  describe "GET /authors/load" do
    before { get load_authors_path }

    it { expect(response).to have_http_status(:ok) }
  end

  describe "POST /authors/preview" do
    context "With a name list" do
      before { post preview_authors_path, { params: { name_list: "Fulano" } } }

      it { expect(response).to have_http_status(:ok) }
    end

    context "With an empty name list" do
      before { post preview_authors_path }

      it { expect(response).to have_http_status(:ok) }
      it { expect(response.body).to include('Nenhum nome fornecido') }
    end
  end

  describe "POST /authors/import" do
    let(:params) do
      { params: { name_list: %w[Fulano Cicrano] } }
    end

    it do
      post import_authors_path, params
      expect(response).to redirect_to(authors_path)
    end

    it do
      expect { post import_authors_path, params }.to change { Author.count }.by(2)
    end
  end

  describe "DELETE /authors/:id" do
    let!(:author) { Author.create!(name: 'Fulano') }

    it do
      delete author_path(author.id)
      expect(response).to redirect_to(authors_path)
    end

    it do
      expect { delete author_path(author.id) }.to change { Author.count }.by(-1)
    end
  end
end
