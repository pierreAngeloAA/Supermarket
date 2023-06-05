def menu_client()
  puts `clear`
    i = 0
    while i != 5
      print_options([
                      '1. Crear Cliente',
                      '2. Leer Cliente',
                      '3. Actualizar Cliente',
                      '4. Eliminar Cliente',
                      '5. Atras'
                    ])
      i = gets.chomp.to_i
  
      case i
      when 1
        create_client
      when 2
        read_client
      when 3
        update_client
      when 4
        delete_client
      else
        puts 'Seleccione una opcion correcta'
      end
    end
  end
  
  def create_client
    puts `clear`
    puts 'Ingrese el Nombre:'
    name = gets.strip
    puts 'Ingrese el Apellido:'
    last_name = gets.strip
    puts 'Ingrese el Dni:'
    dni = gets.to_i
    puts "="*40
    Client.new(name, last_name,dni).save
  end
  
  def read_client
    puts `clear`
    Client.print_clients
    puts 'Digite el id del cliente:'
    id = gets.chomp.to_i
  
    client = Client.find(id)
  
    return puts 'Cliente no encontrado!!' if client.nil?
    puts 'Cliente encontrado:'
    client.descrip
  end
  
  def update_client
    puts `clear`
    Client.print_clients
    puts 'Digite el id del cliente:'
    id = gets.chomp.to_i
    client = Client.find(id)
    return puts "cliente no encontrado" if client.nil?
    puts 'Datos del Cliente:'
    client.descrip
    puts 'Ingrese el Nombre:'
    name = gets.strip
    puts 'Ingrese el Apellido:'
    last_name = gets.strip
    puts 'Ingrese el Dni:'
    dni = gets.to_i
    client.name = name
    client.last_name = last_name
    client.dni = dni
  end
  
  def delete_client
    puts `clear`
    Client.print_clients
    puts "digite el id:"
    id = gets.to_i
    Client.find(id).delete
    puts "Cliente Eliminado."
  end