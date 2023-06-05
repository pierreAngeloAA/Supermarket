
def menu_promotion
  puts `clear`
  promotion = nil
  i = 0
  while i != 4
    print_options([
                    '1. promocion N X M',
                    '2. promocion por %',
                    '3. guardar sin promocion',
                    '4. atras'
                  ])
    i = gets.chomp.to_i

    case i
    when 1
      puts 'cantidad de productos a llevar'
      n = gets.chomp.to_i
      puts 'cantidad de productos a pagar'
      m = gets.chomp.to_i
      promotion = Promotion.new(n, m, 'nxm')
      break
    when 2
      puts 'ingrese el % de descuento del producto'
      n = gets.chomp.to_i
      puts 'ingrese el monto max de productos a llevar'
      m = gets.chomp.to_i
      promotion = Promotion.new(n, m, 'percentage')
      break
    when 3
      promotion
      break
    else
    puts 'SELECCIONE UNA OPCCION CORRECTA'
    end
  end
    promotion
end
  