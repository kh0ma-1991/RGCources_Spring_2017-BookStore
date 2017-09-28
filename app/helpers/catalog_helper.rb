module CatalogHelper
  def current_page
    return 1 unless params[:page]
    params[:page].to_i
  end

  def next_page
    return 2 unless params[:page]
    params[:page].to_i + 1
  end

  def current_category
    params[:category]
  end

  def books_paged
    categorized_books.page(1).per(current_page*8).decorate
  end

  def last_page?
    categorized_books.page(current_page).last_page?
  end

  def anchor
    categorized_books.page(next_page).first.id
  end

  def count_books(category_id)
    return Book.all.count unless category_id
    Category.find(category_id).books.count
  end

  private

  def categorized_books
    return Book.all unless current_category
    Category.find(current_category).books
  end
end
