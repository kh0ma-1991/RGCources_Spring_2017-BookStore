module CatalogHelper
  def filters
    %w(newest_first popular_first price_asc
       price_desc title_asc title_desc)
  end

  def current_filter
    filter = params[:filter]
    return filters.first unless filter
    return filters.first unless filters.include? filter
    filter
  end

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

  def current_category_name
    category = Category.find_by_id(current_category)
    return category.name if category
    t('all')
  end

  def books_paged
    ordered_books.page(1).per(current_page*8).decorate
  end

  def last_page?
    page = ordered_books.page(current_page)
    page.last_page? || page.out_of_range?
  end

  def anchor
     book = ordered_books.page(next_page).first
     book.id if book
  end

  def count_books(category_id)
    return Book.all.count unless category_id
    Category.find(category_id).books.count
  end

  private

  def categorized_books
    return Book.all unless current_category
    return Book.all unless a = Category.find_by_id(current_category)
    a.books
  end

  def ordered_books
    send(current_filter)
  end

  def newest_first
    categorized_books.order(year: :desc)
  end

  def popular_first
    categorized_books #TODO
  end

  def price_asc
    categorized_books.order(price: :asc)
  end

  def price_desc
    categorized_books.order(price: :desc)
  end

  def title_asc
    categorized_books.order(title: :asc)
  end

  def title_desc
    categorized_books.order(title: :desc)
  end
end
