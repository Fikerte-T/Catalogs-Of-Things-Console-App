require 'date'
require 'json'

class Item
  attr_accessor :id, :publish_date, :archived
  attr_reader :label, :genre, :author

  def initialize(publish_date, archived: true)
    @id = Random.rand(1..100)
    @publish_date = publish_date
    @archived = archived
  end

  # setter methods
  def label=(label)
    @label = label
    label.items.push(self) unless label.items.include?(self)
  end

  def genre=(genre)
    @genre = genre
    genre.items.push(self) unless genre.items.include?(self)
  end

  def author=(author)
    @author = author
    author.items.push(self) unless author.items.include?(self)
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end

  private

  def can_be_archived?
    year = Time.now.year - @publish_date.year

    year > 10
  end
  # rubocop:enable Lint/DuplicateMethods
end
