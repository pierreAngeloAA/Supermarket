def menu_inventory
  puts `clear`
  i = 0
  while i != 5
    print_options([
                    '1. Crear inventario',
                    '2. Leer inventario',
                    '3. Actualizar inventario',
                    '4. Eliminar iventario',
                    '5. Atras'
                  ])
    i = gets.chomp.to_i

    case i
    when 1
      create_inventory
    when 2
      read_inventory
    when 3
      update_inventory
    when 4
      delete_inventory
    else
      puts 'Seleccione una opcion correcta'
    end
  end
end
#________________________________________________

def create_inventory
  puts `clear`
  Product.print_products
  puts "Digite El Id:"
  id = gets.chomp.to_i
  product = Product.find(id)

  promotion = menu_promotion

  puts "Digite La Cantidad De Productos A Ingresar"
  stock = gets.chomp.to_i
  Inventory.new(product,stock,promotion).save
  puts " Guardado!"
end

def read_inventory
  puts `clear`
  Inventory.print_inventories
  puts "Digite El Id:"
  id = gets.chomp.to_i
  Inventory.find(id).descrip
end

def update_inventory
  puts `clear`
  Inventory.print_inventories
  puts "Digite El Id:"
  id = gets.chomp.to_i
  inventory = Inventory.find(id)

  return puts "Inventario No Encontrado" if inventory.nil?
  
  puts "Digite La Nueva Cantidad:"
  stock_new = gets.chomp.to_i  
  inventory.stock = stock_new
  
  puts 'Nuevos Datos:'
  inventory.descrip  
end


def delete_inventory
  puts `clear`
  Inventory.print_inventories
  puts "Digite El Id:"
  id = gets.chomp.to_i
  Inventory.find(id).delete
end


def menu_product_inventory
  puts `clear`
  product = nil
  i = 0
  while i != 3
    print_options([
                    '1. Ingresar nuevo producto',
                    '2. Buscar producto',
                    '3. atras'
                  ])
    i = gets.chomp.to_i

    case i
    when 1
      product = create_product
      break
    when 2
      product = Product.find(id)
      break
    when 3
      break
    else
      puts 'SELECCIONE UNA OPCCION CORRECTA'
    end
  end
  product
end
