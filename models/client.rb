class Client
  attr_accessor :id, :name, :last_name, :dni
  @@number_of_clients = 0

  def initialize(name, last_name, dni)
    @@number_of_clients += 1
    @id = @@number_of_clients
    @name = name
    @last_name = last_name
    @dni = dni
  end

  def descrip
    puts "Datos Del Cliente:",
         "Id: #{@id}",
         "Nombre: #{@name.upcase}",
         "Apellido: #{@last_name.upcase}",
         "Dni: #{@dni}"
  end

  def save
    Management.add(self, Management.clients)
  end

  def delete
    Management.clients = Management.delete(@id, Management.clients)
  end

  def self.find(id)
    Management.find(id, Management.clients)
  end

  def self.print_clients
    Management.print(Management.clients)
  end
end
