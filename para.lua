require"natives-1651208000"
util.toast("test")
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
 
 


















 
 












 
 










