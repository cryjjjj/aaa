require"natives-1651208000"
local status, auto_updater = pcall(require, "auto-updater")
if not status then
    local auto_update_complete = nil util.toast("Installing auto-updater...", TOAST_ALL)
    async_http.init("raw.githubusercontent.com", "/hexarobi/stand-lua-auto-updater/main/auto-updater.lua",
        function(result, headers, status_code)
            local function parse_auto_update_result(result, headers, status_code)
                local error_prefix = "Error downloading auto-updater: "
                if status_code ~= 200 then util.toast(error_prefix..status_code, TOAST_ALL) return false end
                if not result or result == "" then util.toast(error_prefix.."Found empty file.", TOAST_ALL) return false end
                filesystem.mkdir(filesystem.scripts_dir() .. "lib")
                local file = io.open(filesystem.scripts_dir() .. "lib\\auto-updater.lua", "wb")
                if file == nil then util.toast(error_prefix.."Could not open file for writing.", TOAST_ALL) return false end
                file:write(result) file:close() util.toast("Successfully installed auto-updater lib", TOAST_ALL) return true
            end
            auto_update_complete = parse_auto_update_result(result, headers, status_code)
        end, function() util.toast("Error downloading auto-updater lib. Update failed to download.", TOAST_ALL) end)
    async_http.dispatch() local i = 1 while (auto_update_complete == nil and i < 40) do util.yield(250) i = i + 1 end
    if auto_update_complete == nil then error("Error downloading auto-updater lib. HTTP Request timeout") end
    auto_updater = require("auto-updater")
end
if auto_updater == true then error("Invalid auto-updater lib. Please delete your Stand/Lua Scripts/lib/auto-updater.lua and try again") end


auto_updater.run_auto_update({
  source_url="https://raw.githubusercontent.com/cryjjjj/aaa/main/para.lua",
  script_relpath=SCRIPT_RELPATH,
  verify_file_begins_with=""
})

floatt=0
      self11 = PLAYER.PLAYER_PED_ID()
      selfpos = ENTITY.GET_ENTITY_COORDS(self11,true)


      menu.slider(menu.my_root(),"Speed: [PARACHUTE] ",{"speedcom"},"",0,1000000,100,100,function(value)
       floatt=value
      end)

 menu.toggle_loop(menu.my_root(),"PARACHUTE",{},"keyboard=Z\nController=R3",function()

 
 if ENTITY.IS_ENTITY_IN_AIR(PLAYER.PLAYER_PED_ID()) then
 TASK.SET_PARACHUTE_TASK_THRUST(PLAYER.PLAYER_PED_ID(),floatt)
   
  if PAD.IS_CONTROL_PRESSED(0,20) or PAD.IS_CONTROL_PRESSED(0,R3)  then
   ENTITY.APPLY_FORCE_TO_ENTITY(PLAYER.PLAYER_PED_ID(), 1, 0, 1, 10, 0, 0, 0, 1, 1, 1, 1, 0, 1)
   TASK.TASK_PARACHUTE_TO_TARGET(self11,selfpos.x,selfpos.y,selfpos.z)
  end 
 end

  end)


ragdoll_type=0

function control()
if PAD.IS_CONTROL_PRESSED(0,9)  then--D
  ENTITY.APPLY_FORCE_TO_ENTITY(PLAYER.PLAYER_PED_ID(), 1, -1, 0, -1, 0, 0, 0, 1,true,true,true,false,true)
elseif  PAD.IS_CONTROL_PRESSED(0,34) then --A
  ENTITY.APPLY_FORCE_TO_ENTITY(PLAYER.PLAYER_PED_ID(), 1, -1, 0, -1, 0, 0, 1, 1, 1, 1, 1, 0, 1)
elseif  PAD.IS_CONTROL_PRESSED(0,32) then--W
  ENTITY.APPLY_FORCE_TO_ENTITY(PLAYER.PLAYER_PED_ID(), 1, 0, -1, -1, 0, 0, 4, 1, 1, 1, 1, 0, 1) 
elseif  PAD.IS_CONTROL_PRESSED(0,31) then--S
  ENTITY.APPLY_FORCE_TO_ENTITY(PLAYER.PLAYER_PED_ID(), 1, 0, -1, -1, 0, 0, -4, 1, 1, 1, 1, 0, 1) 
elseif PAD.IS_CONTROL_PRESSED(0,61)  then --shi
  ENTITY.APPLY_FORCE_TO_ENTITY(PLAYER.PLAYER_PED_ID(), 1, 0, 0, -1, -1, 1, -10, 1, 1, 1, 1, 0, 1) 
 end
end


menu.slider(menu.my_root(),"ragdoll type: [force ragdoll] ",{"ragty"},"",0,3,1,1,function(value_two)
  ragdoll_type=value_two
 end)

 menu.toggle_loop(menu.my_root(),"force ragdoll",{},"",function(on)



  util.toast("Gracefulness off")
  menu.trigger_commands("grace off")
  control()
  PED.SET_PED_TO_RAGDOLL(PLAYER.PLAYER_PED_ID(), 2000, 2000, ragdoll_type,true , true , true )

 end)

 
 












 
 












 
 










