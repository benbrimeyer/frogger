print("Hello world (client)")

-- import global space
local Hippo = game:GetService("ReplicatedStorage").Packages.Hippo
require(Hippo._G.GlobalSpace)
_G.RegisterResource("World", require(Hippo.World))

local World = _G.GetResource("World")
local core = World.core

core:registerComponentsInInstance(Hippo.Components)
core:registerSystemsInInstance(Hippo.Systems)

core:registerStepper(World.event(game:GetService("RunService").Stepped, {
	require(Hippo.Systems.Collision),
	require(Hippo.Systems.Solver),
}))

core:start()

--[[
-- Could have some test code here that creates a ball entity.
local ballEntity = core.createEntity()
core:batchAddComponents(ballEntity, "Transform", "Motion", "CanCollide")
local motion = core:getComponent(ballEntity, "Motion")
motion.acceleration = Vector3.new(1, 0, 0)
]]