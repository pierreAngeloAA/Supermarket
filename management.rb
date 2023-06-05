class Management
    @@inventories = []
    @@clients = []
    @@products = []
    @@bills = []
    @@income = 0
  
    # GETTERS DE CLASE
    def self.inventories
      @@inventories
    end
  
    def self.clients
      @@clients
    end
  
    def self.products
      @@products
    end
  
    def self.bills
      @@bills
    end
  
    def self.income
      @@income
    end
  
    # SETTERS DE CLASE
    def self.inventories=(list)
      @@inventories = list
    end
  
    def self.clients=(list)
      @@clients = list
    end
  
    def self.products=(list)
      @@products = list
    end
  
    def self.bills=(list)
      @@bills = list
    end
  
    def self.income=(list)
      @@income = list
    end
  
    # MÉTODOS DE CLASE
    def self.add(item, list)
      list.push(item)
    end
  
    def self.find(id, list)
      list.find { |r| r.id == id }
    end
  
    def self.delete(id, list)
      list.select { |i| i.id != id }
    end
  
    def self.print(list)
      list.each { |i| i.descrip }
    end
#_______________FILTROS: CATEGORIA, PERIODO___________________
    def self.bills_period(start_day, start_month, start_year, 
                            end_day, end_month, end_year)
      bills_period = @@bills.select do |bill|
        (start_day..end_day).include?(bill.date.day) &&
          (start_month..end_month).include?(bill.date.month) &&
          (start_year..end_year).include?(bill.date.year)
      end
    end

 

    def self.best_selling_product
      max_sales = 0
      product_name = ""
    
      @@inventories.each do |inventory|
        if inventory.sales > max_sales
          max_sales = inventory.sales
          product_name = inventory.product_name
        end
      end
    
      [max_sales, product_name]  # Se retorna una matriz con los valores max_sales y product_name
    end
    
    
    def self.show_statistics()
      best_selling_product = Management.best_selling_product()
      total_amount = 0
      total_bills = Bill.number_of_bills
      product_name = ""
     
      @@bills.each do |bill|
        total_amount += bill.total
      end
      average_amount = total_amount / total_bills
      puts  "Datos Generales",
            "Producto Más Vendido: #{best_selling_product[1]}",
            "Cantidad De Unidades Vendidas: #{best_selling_product[0]}",
            "Facturas Generadas #{total_bills}",
            "Total De Monto: $#{total_amount}",
            "Monto Promedio: #{average_amount}",
            "Cliente mas frecuente: #{Management.find_most_frequent_client()}"

    end

    def self.find_most_frequent_client()
      client_counts = Hash.new(0)
      
      # Contar la frecuencia de cada cliente
      @@bills.each do |bill|
        client_name = bill.client_name
        client_counts[client_name] += 1
      end
      
      max_count = 0
      max_client = nil
      
      # Encontrar el cliente con el recuento más alto
      client_counts.each do |client, count|
        if count > max_count
          max_count = count
          max_client = client
        end
      end
      
      max_client
    end 
end
  