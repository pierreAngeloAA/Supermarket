def menu_bill
  puts `clear`
    i = 0
    while i != 5
      print_options([
                      '1. Crear factura',
                      '2. Leer factura',
                      '3. Actualizar factura',
                      '4. Eliminar factura',
                      '5. Atras'
                    ])
      i = gets.chomp.to_i
  
      case i
      when 1
        create_bill
      when 2
        read_bill
      when 3
        update_bill
      when 4
        delete_bill
      else
        puts 'SELECCIONE UNA OPCCION CORRECTA'
      end
    end
end
  
def create_bill
  puts `clear`
  bill_items = []
  Client.print_clients
  puts "Ingrese El Id:"
  id = gets.chomp.to_i
  client = Client.find(id)

  i = 0
  while i != 3
    print_options([
                    '1. agregar producto',
                    '2. guardar factura',
                    '3. atras'
                  ])
    i = gets.chomp.to_i

    case i
    when 1
      bill_items.push(create_bill_item) 
    when 2
      Bill.new(client, bill_items).tap do |bill|
        bill.save
        bill.descrip
      end      
    else
      puts 'SELECCIONE UNA OPCCION CORRECTA'
    end
  end
end


# _________________ACTUALIZAR FACTURA_______________________

def update_bill
  system 'clear'
  puts 'Eliminar producto de una factura'
  Bill.print_bills
  puts 'Digite el ID de la factura:'
  id = gets.chomp.to_i
  bill = Bill.find(id)

  if bill.nil?
    puts 'La factura no existe'
    return
  end

  bill.print_bill_items
  puts 'Digite el ID del producto a eliminar:'
  item_id = gets.chomp.to_i
  success = bill.delete_bill_item(item_id)

  if success
    puts 'Producto eliminado de la factura correctamente'
  else
    puts 'No se pudo eliminar el producto de la factura'
  end
end


# _____FUNCIONES__________________________________
def create_bill_item
  puts `clear`
  bill_item = nil
  Inventory.print_inventories
  puts 'Ingrese el id del producto'
  id = gets.chomp.to_i
  inventory = Inventory.find(id)
  puts 'Ingrese el numero de unidades que va a comprar'
  quantity = gets.chomp.to_i
  
  Inventory.find(id).stock -= quantity
  
  return if inventory.nil?
  if (inventory.stock - quantity) >= 0
    bill_item = BillItem.new(inventory, quantity)
  else
    puts "cantidad de producto no valida"
  end
  bill_item 
end

def read_bill
  puts `clear`
  Bill.print_bills
  puts "digite el id de la factura"
  id = gets.chomp.to_i
  Bill.find(id).descrip
end

def delete_bill
  puts `clear`
  Bill.print_bills
  puts 'Digite El Id De La Factura'
  id = gets.chomp.to_i
  Bill.find(id).delete
end
  