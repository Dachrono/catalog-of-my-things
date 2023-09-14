require_relative '../logic/entities/music_album'
require_relative '../logic/entities/genre'
require_relative '../logic/user_interact'

class App
  attr_accessor :albums, :genre

  def initialize
    @books = []
    @albums = []
    @genre = []
    @u_interact = UserInteract.new
  end

  def list_books
    puts 'Book List:'
    if @books.empty?
      puts 'No books available'
      return nil
    end

    @books.each_with_index do |idx, book|
      puts "#{idx}) " \
           "ID: #{book.id}, " \
           "Title: #{book.label.title}, " \
           "Publish Date: #{book.publish_date}, " \
           "Publisher: #{book.publisher}, " \
           "Cover State: #{book.cover_state}"
    end
  end

  def add_album
    id = Random.rand(1..10_000).to_s
    publish_date = @u_interact.publish_date
    on_spotify = @u_interact.on_spotify?

    album = MusicAlbum.new(id, publish_date, genre, on_spotify)
    @albums.push(album)
  end
end
