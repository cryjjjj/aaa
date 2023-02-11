require"natives-1651208000"
  get_id=PLAYER.PLAYER_PED_ID
 force=ENTITY.APPLY_FORCE_TO_ENTITY
pad_is=PAD.IS_CONTROL_PRESSED

util.toast("hello ^-^")
float=0
      self11 = PLAYER.PLAYER_PED_ID()
      selfpos = ENTITY.GET_ENTITY_COORDS(self11,true)

      menu.slider(menu.my_root(),"Speed: [PARACHUTE] ",{"speedcom"},"",0,1000000,100,100,function(value)
        float=value
      end)

 menu.toggle_loop(menu.my_root(),"PARACHUTE",{},"keyboard=Z\nController=R3",function()

 
 if ENTITY.IS_ENTITY_IN_AIR(get_id()) then
 TASK.SET_PARACHUTE_TASK_THRUST(get_id(),float)
   
  if pad_is(0,20) or pad_is(0,R3)  then
    force(get_id(), 1, 0, 1, 10, 0, 0, 0, 1, 1, 1, 1, 0, 1)
   TASK.TASK_PARACHUTE_TO_TARGET(get_id(),selfpos.x,selfpos.y,selfpos.z)
  end 
 end

  end)
  Weird=menu.list(menu.my_root(),"Weird")
menu.toggle_loop(Weird,"cant move stairs and ladder",{},"",function()
       
    force(get_id(),1, 0.3 , 0.3 ,-14 ,0.3, 0.3, 0.3, 0.3, 0.3, 0.3, 0, 0, 0)
    force(get_id(),1, -0.3 , -0.3 ,12.5 ,-0.3, -0.3, -0.3, -0.3, -0.3, -0.3, 0, 0, 0)

    
  end)
  menu.toggle_loop(Weird,"V27 When?",{},"",function()
        GRAPHICS.DRAW_RECT(0.001, 5, 0.999, 0.085, 0, 0, 0, 0)
        HUD.SET_TEXT_COLOUR(125,127,133, 200)
        HUD.SET_TEXT_SCALE(1.0,0.5)
        HUD.SET_TEXT_FONT(2)
        HUD.SET_TEXT_CENTRE(true)
        HUD.SET_TEXT_OUTLINE(true)
        util.BEGIN_TEXT_COMMAND_DISPLAY_TEXT("F4")
        HUD.END_TEXT_COMMAND_DISPLAY_TEXT(0.5,0.125,0)
        GRAPHICS.DRAW_RECT(0.001, 0.999, 4.5, 0.085, 0, 0, 0, 0)
        HUD.SET_TEXT_SCALE(1.0,0.53)
        HUD.SET_TEXT_COLOUR(57,20,55,200)
        HUD.SET_TEXT_FONT(2)
        HUD.SET_TEXT_CENTRE(true)
        HUD.SET_TEXT_OUTLINE(true)
        util.BEGIN_TEXT_COMMAND_DISPLAY_TEXT("Ozark V26")
        HUD.END_TEXT_COMMAND_DISPLAY_TEXT(0.5,0.1,0)
      end)
  max=10
Shit=menu.list(menu.my_root(),"Bypass Moneyloop")

  menu.slider(Shit,"Amount",{"pppooop"},"",0,100000000,10,100,function(Value)
   max=Value
  end)
  menu.toggle_loop(Shit,"Real Bypass Moneyloop^-^",{},"",function(on)
    HUD._SET_PLAYER_CASH_CHANGE(0,0)
  HUD._SET_PLAYER_CASH_CHANGE(0,max)
        HUD.BEGIN_TEXT_COMMAND_BUSYSPINNER_ON('STRING')
    HUD.ADD_TEXT_COMPONENT_SUBSTRING_PLAYER_NAME("Bypass...")

  HUD.END_TEXT_COMMAND_BUSYSPINNER_ON(1)
  end )
  menu.action(menu.my_root(),"clean",{},"",function()
    util.stop_script(HUD.BUSYSPINNER_OFF())
 end)
 --online
 function request_model_load(hash)
  request_time = os.time()
  if not STREAMING.IS_MODEL_VALID(hash) then
      return
  end
  STREAMING.REQUEST_MODEL(hash)
  while not STREAMING.HAS_MODEL_LOADED(hash) do
      if os.time() - request_time >= 10 then
          break
      end
      util.yield()
  end
end
 function playerActionsSetup(pid)
  menu.divider(menu.player_root(pid), "Im Regular User")
  online= menu.list(menu.player_root(pid), "get_edition() >= 2")
  menu.action(online, "soon", {""}, "", function()
  
  end)
end players.on_join(playerActionsSetup)players.dispatch_on_join()

