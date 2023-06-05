class Inventory
    attr_accessor :id, :product, :stock, :promotion, :initial_Stock
    @@number_of_inventory = 0
  
    def initialize(product, stock, promotion)
      @@number_of_inventory += 1
      @id = @@number_of_inventory
      @product = product 
      @stock = stock
      @promotion = promotion
      @initial_Stock = stock
    end

    def descrip
      puts "="*40
      if @promotion.nil?
        puts 'Este artículo no tiene promoción'
      else
        case @promotion.type
        when 'nxm'
          puts "Este artículo tiene una promoción de #{@promotion.n}x#{@promotion.m}"
        when 'percentage'
          puts "Este artículo tiene un descuento del #{@promotion.n}%"
        end
      end
    
      puts "== Artículo =="
      puts "ID: #{@id}, Nombre: #{@product.name}, Disponibilidad: #{@stock}, Costo unitario: #{@product.cost}"
    end

    def product_name
      @product.name
    end

    def sales
      @initial_Stock - stock
    end
    
    def save
      Management.add(self,Management.inventories)
    end

    def delete
      Management.inventories = Management.delete(@id, Management.inventories)
    end
  
    def self.find(id)
      Management.find(id, Management.inventories)
    end
  
    def self.print_inventories
      Management.print(Management.inventories)
    end
end