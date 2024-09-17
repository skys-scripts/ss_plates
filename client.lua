local plates = { -- DO NOT TOUCH. NATIVE PLATE NAMES
	"plate01",
	"plate02",
	"plate03",
	"plate04",
	"plate05",
	"yankton_plate",
}

if GetGameBuildNumber() >= 3094 then
	local newPlates = {  -- DO NOT TOUCH. GAME BUILD 3095+ NATIVE PLATE NAMES
		"plate_mod_01",
		"plate_mod_02",
		"plate_mod_03",
		"plate_mod_04",
		"plate_mod_05",
		"plate_mod_06",
		"plate_mod_07"
	}
	for _ , v in ipairs(newPlates) do
		plates[#plates+1] = v
	end
end

local runtimeTxd = "ss_plates"
local txn = "defaultNormalTexture"
local origTxd = "vehshare"
local txd = CreateRuntimeTxd(runtimeTxd)
CreateRuntimeTextureFromImage(txd, txn, "images/"..Config.NomralUV)
for k, v in pairs(Config.Plates) do
	if v ~= nil and plates[k] ~= nil then
		if v.type == "image" and v.file ~= Config.NomralUV then
			if v.file ~= nil then
				CreateRuntimeTextureFromImage(txd, plates[k], "images/"..v.file)
				AddReplaceTexture(origTxd, plates[k], runtimeTxd, plates[k])
			end
		elseif v.type == "url" then
			local object = CreateDui(v.file, 512, 256)
			local handle = GetDuiHandle(object)
			CreateRuntimeTextureFromDuiHandle(txd,plates[k], handle)
			AddReplaceTexture(origTxd, plates[k], runtimeTxd, plates[k])
		end
		if k == 1 then
			CreateRuntimeTextureFromImage(txd, plates[k].."_n", Config.NomralUV)
		end
		AddReplaceTexture(origTxd, plates[k].."_n", runtimeTxd, txn)
	end
end