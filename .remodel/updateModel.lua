local game = remodel.readPlaceFile("test.rbxlx")
local subModel = game.Workspace.Submarine
subModel.SubmarineScript:Destroy()
remodel.writeModelFile(subModel, "sub.rbxmx")