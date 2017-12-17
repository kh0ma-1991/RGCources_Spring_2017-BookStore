class BookDecorator < Draper::Decorator
  delegate_all

  def authors_decorated
    authors.map { | author | author.name }.join(', ')
  end

  def dimensions_decorated
    "H: #{dimensions['H']}” x W: #{dimensions['W']}” x D: #{dimensions['D']}”"
  end

  def short_description
    description.truncate(150)
  end
end
