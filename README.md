# Supermarket

Console app in plain Ruby that manages a small supermarket: clients, products, inventory, promotions, bills and sales statistics. Built while learning object-oriented Ruby.

## Run

```bash
ruby main.rb
```

`seed.rb` loads sample data at startup. Everything lives in memory, so nothing is saved between runs.

## Structure

| Folder | Content |
|---|---|
| `models/` | `Client`, `Product`, `Inventory`, `Promotion`, `Bill`, `BillItem` |
| `menus/` | One console menu per area (bills, clients, inventory, products, promotions, statistics) |
| `crud.rb`, `management.rb` | Shared create/read/update/delete helpers and the main loop |
