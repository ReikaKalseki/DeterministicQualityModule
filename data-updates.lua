local function changeQualityModule(name, property, amount)
	if not data.raw.module[name] then
		error("No such module '" .. name .. "'!")
	end
    if data.raw.module[name].effect then
        data.raw.module[name].effect[property] = amount
	else
		log("Module '" .. name .. "' has no such effect property '" .. property .. "', so it will be added anew:\n" .. serpent.block(data.raw.module[name]))
    end
end

local function reduceSpeedQuality(name, amount)
	if not data.raw.module[name] then
		error("No such module '" .. name .. "'!")
	end
    if data.raw.module[name].effect and data.raw.module[name].effect.quality then
        data.raw.module[name].effect.quality = amount
	else
		log("Module '" .. name .. "' has no quality effect to modify:\n" .. serpent.block(data.raw.module[name]))
    end
end

--these are all 0 in vanilla
changeQualityModule("quality-module", "consumption", 0.1) -- +10% --1
changeQualityModule("quality-module-2", "consumption", 0.2) -- +20% --2

if settings.startup["rebalance-t3-quality"].value then --vanilla is 1,2,2.5
	changeQualityModule("quality-module-3", "quality", 0.4) -- +4%; 2.5% in vanilla
	
	reduceSpeedQuality("speed-module", -0.05) -- -5%; 1% in vanilla
	reduceSpeedQuality("speed-module-2", -0.2) -- -20%; 1.5% in vanilla
	reduceSpeedQuality("speed-module-3", -0.4) -- -40%; 2.5% in vanilla
	
	changeQualityModule("quality-module-3", "consumption", 0.5) -- +50% --4
else
	reduceSpeedQuality("speed-module", -0.05) -- -5%; 1% in vanilla
	reduceSpeedQuality("speed-module-2", -0.1) -- -10%; 1.5% in vanilla
	reduceSpeedQuality("speed-module-3", -0.25) -- -25%; 2.5% in vanilla
	
	changeQualityModule("quality-module-3", "consumption", 0.4) -- +40% --4
end

