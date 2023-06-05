class Promotion
    attr_accessor :n, :m, :type
  
    def initialize(n, m, type)
      @n = n
      @m = m
      @type = type
    end
  
    def apply(product_cost, quantity)
      total = product_cost * quantity
      case @type
      when 'nxm'
        total = product_cost * prom_nXm(quantity)
      when 'percentage' && quantity <= @m
        total *= prom_percentage 
      else
        total
      end
    end
  
    def prom_nXm(quantity)
      counter = 0
      quantity_p = 0
      (1..quantity).each do |_i|
        counter += 1
        if counter == @n
          counter = 0
          quantity_p += @m
        end
        counter
      end
      quantity_p += counter
      quantity_p
    end
  
    def prom_percentage
      prom_2 = ((100.0 - @n) / 100.0)
      prom_2
    end
  end
  