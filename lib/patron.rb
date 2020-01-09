class Patron
  attr_accessor :name, :id


  def initialize(attributes)
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id)
  end

  def self.all
    returned_patrons = DB.exec("SELECT * FROM patrons;")
    patrons = []
    returned_patrons.each() do |patron|
      name = patron.fetch("name")
      id = patron.fetch("id").to_i
      patrons.push(Patron.new({:name => name, :id => id}))
    end
    patrons.sort_by { |patron| [patron.name] }
  end

  def self.search(query)
    returned_patrons = DB.exec("SELECT * FROM patrons WHERE name LIKE '%#{query}%';")
    patrons = []
    returned_patrons.each() do |patron|
      name = patron.fetch("name")
      id = patron.fetch("id").to_i
      patrons.push(Patron.new({:name => name, :id => id}))
    end
    patrons.sort_by { |patron| [patron.name] }
  end



  def save
    result = DB.exec("INSERT INTO patrons (name) VALUES ('#{@name}') RETURNING id;")
    @id = result.first().fetch("id").to_i
  end

  def ==(patron_to_compare)
    if patron_to_compare != nil
      self.name() == patron_to_compare.name()
    else
      false
    end
  end

  def self.clear
    DB.exec("DELETE FROM patrons *;")
  end

  def self.find(id)
    patron = DB.exec("SELECT * FROM patrons WHERE id = #{id};").first
    if patron
      name = patron.fetch("name")
      id = patron.fetch("id").to_i
      Patron.new({:name => name, :id => id})
    else
      nil
    end
  end

  def update(attributes)
    if (attributes.is_a? String)
      @name = attributes
      DB.exec("UPDATE patrons SET name = '#{@name}' WHERE id = #{@id};")
    else
      book_name = attributes.fetch(:book_name)
      if book_name != nil
        book = DB.exec("SELECT * FROM books WHERE lower(name)='#{book_name.downcase}';").first
        if book != nil
          DB.exec("INSERT INTO books_patrons (book_id, patron_id) VALUES (#{book['id'].to_i}, #{@id});")
        end
      end
    end
  end

  def delete
    DB.exec("DELETE FROM books_patrons WHERE patron_id = #{@id};")
    DB.exec("DELETE FROM patrons WHERE id = #{@id};")
  end

  def return_book(book_id)
    DB.exec("DELETE FROM books_patrons WHERE book_id = #{book_id} AND patron_id = #{@id};")
  end

  def books
    books = []
    results = DB.exec("SELECT book_id FROM books_patrons WHERE patron_id = #{@id};")
    result_id_array = []
    results.each() do |result|
      result_id_array.push(result.values)
    end
    if result_id_array != []
      query_of_ids =  DB.exec("SELECT * FROM books WHERE id IN (#{result_id_array.join(", ")});")
      query_of_ids.each() do |query|
        book_id = query.fetch("id").to_i()
        name = query.fetch("name")
        books.push(Book.new({:name => name, :id => book_id}))
      end
      books
    else
      puts "NOVA error in patron.books"
      NIL
    end
  end

end
