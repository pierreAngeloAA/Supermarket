
def crud
  puts `clear`
    i = 0
    while i != 6
      print_options([
                      '1. CRUD de Client',
                      '2. CRUD de Producto',
                      '3. CRUD de Inventario',
                      '4. CRUD de Factura',
                      '5. Informacion',
                      '6. Salir'
                    ])
      i = gets.chomp.to_i
  
      case i
      when 1
        menu_client
      when 2
        menu_product
      when 3
        menu_inventory
      when 4
        menu_bill
      when 5
        menu_statistic
      when 6
        exit
      else
        puts 'SELECCIONE UNA OPCIÓN CORRECTA'
      end
    end
  end
  
  def print_options(options)
    puts 'Seleccione una opcion:'
    options.each { |option| puts option }
  end