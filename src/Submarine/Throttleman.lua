local Throttleman = {}
Throttleman.__index = Throttleman

function Throttleman.new()
  local self = setmetatable({}, Throttleman)
  return self
end

function Throttleman:Destroy()
  
end

return Throttleman