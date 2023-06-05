
def menu_statistic
  puts `clear`
    i = 0
    while i != 3
        print_options([
                        "1. Datos Generales:",
                        "2. Datos Por Periodo:"
          
                      ])
        i = gets.chomp.to_i
  
          case i
          when 1
            Management.show_statistics()
          when 2
            show_statistic(bills_period)
          else
            puts 'SELECCIONE UNA OPCCION CORRECTA'
          end
     end
  end
  
  

  
  def bills_period
      puts `clear`
      bills_period = []
    puts "DESDE:"
      puts 'Ingrese el Dia:'
      start_day = gets.to_i
      puts 'Ingrese el Mes:'
      start_month = gets.to_i
      puts 'Ingrese el año:'
      start_year = gets.to_i
    puts "HASTA:"
      puts 'Ingrese el Dia:'
      end_day = gets.to_i
      puts 'Ingrese el Mes:'
      end_month = gets.to_i
      puts 'Ingrese el año:'
      end_year = gets.to_i
      puts "FECHA INICIO DE PERIODO: #{start_day} / mes #{start_month} / año: #{start_year}"
      puts "FECHA FIN DE PERIODO: #{end_day} / mes #{end_month} / año: #{end_year}"
      list_period = Management.bills_period(start_day, start_month, start_year, end_day, end_month, end_year)
  end
  
