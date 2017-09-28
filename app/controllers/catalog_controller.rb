class CatalogController < ApplicationController
  def index
  end

  private

  def catalog_params
    params.require(:catalog).permit(:category, :page)
  end
end
