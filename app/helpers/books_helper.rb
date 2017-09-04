module BooksHelper
  def large_pictures
    return fake_images if @book.pictures.count == 0
    @book.pictures
  end

  private
  def fake_images
    ['/images/bookstore1.jpg',
     '/images/bookstore2.jpg',
     '/images/bookstore3.jpg',
     '/images/bookstore4.jpg']
  end
end
