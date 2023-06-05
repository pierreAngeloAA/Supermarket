class Bill
  attr_accessor :id, :client, :total, :cost, :bill_items, :date
  @@number_of_bills = 0
  
  def initialize(client,bill_items)
    @@number_of_bills += 1
    @id = @@number_of_bills
    @date = Time.new
    @client = client
    @bill_items = bill_items
    @total = 0
    
    
    @bill_items.each do |bi| 
      @total += bi.total
    end
  end
  
  def descrip 
    puts  "="*40,
          "Factura Numero: #{id}"
          "Fecha Y Hora: #{@date}"
          client_descrip()
          print_bill_items()
          puts "****************** TOTAL = $#{@total}"
  end

  def self.number_of_bills
    @@number_of_bills
  end

  #METODOS DE INSTANCIA PARA ACCEDER A LOS BILL_ITEMS
  def find_bill_item(id)
    @bill_items.find { |bi| bi.id == id }  
  end

  def delete_bill_item(id)
    @bill_items = @bill_items.select { |i| i.id != id }
  end
  
  def add_bill_items(bill_item)
    @bill_items.push(bill_item)
  end

  def print_bill_items()
    @bill_items.each {|i| i.descrip}
  end

  def client_descrip()
     @client.descrip
  end

  def client_name()
    @client.name
  end

  def sales_total()
    sales_total = 0
    @bill_items.each { |i| sales_total += i.quantity }
    sales_total
  end
  

  def quantity()
    quantity = 0
    @bill_items.each { |bi| quantity += bi.quantity }
    quantity
  end

  def save
    Management.add(self,Management.bills)
  end

  def delete
    Management.clients = Management.delete(@id, Management.bills)
  end

  def self.find(id)
    Management.find(id, Management.bills)
  end

  def self.print_bills
    Management.print(Management.bills)
  end
end
