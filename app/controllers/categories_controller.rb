class CategoriesController < ApplicationController
  def show
    @articles = Article.where(category: params[:id]).paginate(page: params[:page], per_page: 2)
    render file: Rails.root.join('public/404.html'), layout: false, status: :not_found if @articles.blank?
  end
end
