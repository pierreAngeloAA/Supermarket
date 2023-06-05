class Product
    attr_accessor :id, :name, :category, :cost
    @@number_of_products = 0
  
    def initialize(name, category, cost)
      @@number_of_products += 1
      @id = @@number_of_products
      @name = name
      @category = category
      @cost = cost
    end
  
    def descrip
        puts  "Id: #{@id}",
              "Nombre: #{@name}",
              "categoria: #{@category}",
              "precio: #{@cost}"
    end
    
    def save
      Management.add(self, Management.products)
    end
  
    def delete
      Management.products = Management.delete(@id, Management.products)
    end
  
    def self.find(id)
      Management.find(id, Management.products)
    end
  
    def self.print_products
      Management.print(Management.products)
    end
end