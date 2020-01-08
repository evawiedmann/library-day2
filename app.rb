require('sinatra')
require('sinatra/reloader')
require('./lib/book')
require('./lib/patron')
# require('./lib/song')
require('pry')
require ('pg')
also_reload('lib/**/*.rb')

DB = PG.connect({:dbname => "nova_library"})

get('/') do
  redirect to('/books')
end

# ALBUM ROUTING:

get('/books') do
  if params["search"]
    @books = Book.search(params[:search])
  elsif params["sort"]
    @books = Book.sort()
  else
    @books = Book.all
  end
  erb(:books)
end

get ('/books/new') do
  erb(:new_book)
end

post ('/books') do
  name = params[:book_name]
  book = Book.new({:name => name, :id => nil})
  book.save()
  redirect to('/books')
end

get ('/books/:id') do
  @book = Book.find(params[:id].to_i())
  if @book != nil
    erb(:book)
  else
    erb(:book_error)
  end
end

get ('/books/:id/edit') do
  @book = Book.find(params[:id].to_i())
  erb(:edit_book)
end

patch ('/books/:id') do
  @book = Book.find(params[:id].to_i())
  @book.update(params[:name])
  redirect to('/books')
end

delete ('/books/:id') do
  @book = Book.find(params[:id].to_i())
  @book.delete()
  redirect to('/books')
end

# get ('/books/:id/songs/:song_id') do
#   @song = Song.find(params[:song_id].to_i())
#   if @song != nil
#     erb(:song)
#   else
#     @book = Book.find(params[:id].to_i())
#     erb(:book_error)
#   end
# end
#
# post ('/books/:id/songs') do
#   @book = Book.find(params[:id].to_i())
#   song = Song.new({:name => params[:song_name], :book_id => @book.id, :id => nil})
#   song.save()
#   erb(:book)
# end
#
# patch ('/books/:id/songs/:song_id') do
#   @book = Book.find(params[:id].to_i())
#   song = Song.find(params[:song_id].to_i())
#   song.update(params[:name], @book.id)
#   erb(:book)
# end
#
# delete ('/books/:id/songs/:song_id') do
#   song = Song.find(params[:song_id].to_i())
#   song.delete
#   @book = Book.find(params[:id].to_i())
#   erb(:book)
# end

# ARTIST ROUTING:

get('/patrons') do
  if params["search"]
    @patron = Patron.search(params[:search])
  elsif params["sort"]
    @patron = Patron.sort()
  else
    @patron = Patron.all
  end
  erb(:patrons)
end

get ('/patrons/:id') do
  @patron = Patron.find(params[:id].to_i())
  if @patron != nil
    erb(:patron)
  else
    erb(:book_error)
  end
end

get ('/patron/new') do
  erb(:new_patron)
end

post ('/patrons') do
  name = params[:patron_name]
  @patron = Patron.new({:name => name, :id => nil})
  @patron.save()
  redirect to('/patrons')
end

# post ('/patrons/:id') do
#   name = params[:patron_name]
#   @patron = Patron.new({:name => name, :id => nil})
#   @patron.save()
#   redirect to('/patrons')
# end


post ('/patrons/:id') do
  name = params[:book_name]
  id = params[:id]
  @patron = Patron.find(params[:id].to_i())
  book = Book.new({:name => name, :id => id})
  book.save()
  @patron.update({:book_name => name})
  redirect to('/patrons')
end


patch ('/patrons/:id') do
  @patron = Patron.find(params[:id].to_i())
  @patron.update(params[:name])
  redirect to('/patrons')
end

delete ('/patrons/:id') do
  @patron = Patron.find(params[:id].to_i())
  @patron.delete()
  redirect to('/patrons')
end
