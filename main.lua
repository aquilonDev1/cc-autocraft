-- get all invetory peripheral
local inventories = {}
for key, name in pairs(peripheral.getNames()) do
  local p = peripheral.wrap(name)
  if p.size then
    inventories[#inventories + 1] = p
  end
end

local handle = fs.open("./items.json", "w")
for key, inv in pairs(inventories) do
  for i = 1, inv.size() do
    local item = inv.getItemDetail(i)
    print(textutils.serialiseJSON(item))
    handle.write(textutils.serialiseJSON({ count = item.count, displayName = item.displayName, slot = slot }))
  end
end
handle.close()
