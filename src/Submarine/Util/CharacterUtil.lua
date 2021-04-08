local CharacterUtil = {}

function CharacterUtil.GetHumanoid(player)
  return player.Character and player.Character:FindFirstChildWhichIsA("Humanoid")
end

return CharacterUtil

