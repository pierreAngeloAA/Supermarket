
# LISTA DE CLIENTES AGREGADOS
Client.new('c1', 'a2',rand(111..999)).save
Client.new('c2', 'a3',rand(111..999)).save
Client.new('c3', 'a4',rand(111..999)).save
Client.new('c4', 'a5',rand(111..999)).save
Client.new('c5', 'a6',rand(111..999)).save
Client.new('c6', 'a7',rand(111..999)).save

# LISTA DE PRODUCTOS AGREGADOS
Product.new('p1', 'k1', 100).save
Product.new('p2', 't2', 200).save
Product.new('p3', 't3', 300).save
Product.new('p4', 'k4', 1100).save
Product.new('p5', 't5', 2400).save
Product.new('p6', 't6', 3000).save

# INVENTARIO AGREGADO
Inventory.new(Product.find(1), 10000, Promotion.new(3,2,'nxm')).save
Inventory.new(Product.find(2), 10000, nil).save
Inventory.new(Product.find(3), 10000, Promotion.new(30,10,'percentage')).save
Inventory.new(Product.find(4), 10000, Promotion.new(3,2,'nxm')).save
Inventory.new(Product.find(5), 10000, nil).save
Inventory.new(Product.find(6), 10000, Promotion.new(30,10,'percentage')).save

def create_bill_random(n)
  (1..n).each do |i|
    Bill.new(
      Client.find(rand(1..6)),
      [
        BillItem.new(Inventory.find(rand(1..6)), rand(1..30)),
        BillItem.new(Inventory.find(rand(1..6)), rand(1..40)),
        BillItem.new(Inventory.find(rand(1..6)), rand(1..70))
      ]
  ).save
  end
end

create_bill_random(100)



