class BillItem
    attr_accessor :id, :inventory, :quantity
    @@number_of_item = 0
  
    def initialize(inventory, quantity)
      @@number_of_item += 1
      @id = @@number_of_item
      @inventory = inventory
      @quantity = quantity
    end
  
    def descrip
      puts '== id == product == quantity == costo und == costo total'
      puts "== #{@id} == #{product_name} == #{@quantity} == #{product_cost} == #{total}"
    end
  
    def total
      total = product_cost * @quantity
      if @inventory.promotion != nil
        total = @inventory.promotion.apply(product_cost, @quantity)
      end
      total
    end
  
    def product_cost
      @inventory.product.cost
    end
  
    def product_name
      @inventory.product.name
    end
    
    def product_type
      @inventory.product.category
    end
    
  end
  