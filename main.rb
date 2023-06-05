
#SYSTEM
require_relative './management.rb'


#MODELS
require_relative './models/client.rb'
require_relative './models/inventory.rb'
require_relative './models/promotion.rb'
require_relative './models/product.rb'
require_relative './models/bill.rb'
require_relative './models/bill_item.rb'

#MENUS
require_relative './menus/menu_bill.rb'
require_relative './menus/menu_inventory.rb'
require_relative './menus/menu_product.rb'
require_relative './menus/menu_promotion.rb'
require_relative './menus/menu_client.rb'
require_relative './menus/menu_statistic.rb'
require_relative './crud.rb'


require_relative './seed.rb'


crud
