local RunService = game:GetService("RunService")
local subModel: Model = script.Parent
local prompt: ProximityPrompt = subModel.Prompt
local seat: VehicleSeat = subModel.Seat
local base: Part = subModel.Base
local prop: VectorForce = base.Prop
local gyro: Torque = base.Gyro
local CharacterUtil = require(script.Util.CharacterUtil)

local currentPlayer = nil

local function SetModelMassless(model: Model, isMassless)
  for _, inst in pairs(model:GetDescendants()) do
    if inst:IsA("BasePart") then
      inst.Massless = isMassless
    end
  end
end

local function enter(player)
  local humanoid = CharacterUtil.GetHumanoid(player)
  if humanoid then
    SetModelMassless(player.Character, true)
    seat:Sit(humanoid)
    currentPlayer = player
  end
end

local function exit()
  -- Without this statment, this function would fire
  -- if they got IN or OUT of the seat, not just out
  if not seat.Occupant then
    if currentPlayer.Character then
      SetModelMassless(currentPlayer.Character, false)
    end
  end
end

local function update(et, dt)
  
end

prompt.Triggered:Connect(enter)
seat:GetPropertyChangedSignal("Occupant"):Connect(exit)
RunService.Stepped:Connect(update)