def menu_product
  puts `clear`
    i = 0
    while i != 5
      print_options([
                      '1. Crear producto',
                      '2. Leer producto',
                      '3. Actualizar producto',
                      '4. Eliminar producto',
                      '5. Atras'
                    ])
      i = gets.chomp.to_i
  
      case i
      when 1
        create_product
      when 2
        read_product
      when 3
        update_product
      when 4
        delete_product
      when 5
        main_menu
      else
        puts 'Seleccione una opcion correcta'
      end
    end
end
  
def create_product
  puts `clear`
  puts 'Ingrese el Nombre:'
  name = gets.strip
  puts "ingrese el tipo"
  category = gets.strip
  puts 'Ingrese el costo:'
  cost = gets.to_i
  Product.new(name,category,cost).save
end

def read_product
  puts `clear`
  Product.print_products
  puts 'DIGITE EL ID DEL PRODUCTO:'
  id = gets.chomp.to_i
  Product.find(id).descrip
end

def update_product
  puts `clear`
  Product.print_products
  puts 'DIGITE EL ID DEL PRODUCTO:'
  id = gets.chomp.to_i
  puts "Ingrese Los Nuevos Datos"
  puts 'Ingrese el Nombre:'
  Product.find(id).name = gets.strip
  puts "ingrese la categoria"
  Product.find(id).category = gets.strip
  puts 'Ingrese el costo:'
  Product.find(id).cost = gets.to_i

end

def delete_product
  puts `clear`
  Product.print_products
  puts 'DIGITE EL ID DEL PRODUCTO:'
  id = gets.chomp.to_i
  Product.find(id).delete
end



