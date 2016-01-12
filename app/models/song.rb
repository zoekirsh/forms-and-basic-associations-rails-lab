class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def genre_name=(name)
    genre = Genre.find_or_create_by(name: name)
    self.genre = genre
  end

  def note_contents=(notes)
    notes.each do |content|
      self.notes.build(content: content)
    end
  end
end
