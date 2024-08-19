-- get all invetory peripheral
local inventories = {}
for key, name in pairs(peripheral.getNames()) do
  local p = peripheral.wrap(name)
  if p.size then
    inventories[#inventories + 1] = p
  end
end

print(inventories)
