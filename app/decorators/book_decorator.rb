class BookDecorator < Draper::Decorator
  delegate_all

  def authors_decorated
    authors.map { | author | author.name }.join(', ')
  end
end
