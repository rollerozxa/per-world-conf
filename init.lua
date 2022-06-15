
-- Grab current minetest.settings
global_conf = minetest.settings

-- Grab settings from (world)/minetest.conf and overlay it on top of
-- the 'conf' settings variable
per_world_conf = Settings(minetest.get_worldpath()..'/minetest.conf')

-- Merge them onto a new throwaway config. First the global config
-- then the per-world config overriding any potential overlap.
conf = Settings(minetest.get_worldpath()..'/blackhole') -- Just anything to please sandboxer
for k,v in pairs(global_conf:to_table()) do
	conf:set(k,v)
end
for k,v in pairs(per_world_conf:to_table()) do
	conf:set(k,v)
end

-- Replace minetest.settings with the throwaway config settings object
minetest.settings = conf

local test = false
if test then
	-- Let's test if this works.
	-- Put `does_this_work = false` in global conf, `-||- = true` in world conf.
	local does_this_work = minetest.settings:get_bool('does_this_work')
	if does_this_work then
		minetest.log("Hooray, it does work! Per-world settings for everyone!")
	else
		minetest.log("Oh no, it does not work... Depression ensues.")
	end
end
