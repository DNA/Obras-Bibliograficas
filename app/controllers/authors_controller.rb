class AuthorsController < ApplicationController
  def index
    @authors = Author.order(:name)
  end

  def load; end

  def preview
    if params[:name_list].blank?
      flash.now.alert = 'Nenhum nome fornecido!'
      render :load
    else
      names = params[:name_list].lines.map(&:squish).uniq

      @authors = names.map { |name| Author.new(name: name) }
    end
  end

  def import
    params[:name_list].each { |name| Author.create(name: name) }

    redirect_to authors_path, notice: 'Autores importados com sucesso!'
  end

  def destroy
    Author.find(params[:id]).destroy!

    redirect_to authors_path, notice: 'Autor removido com sucesso!'
  end
end
