local lv={100,200,400,800}
local mapName={"map1","map2","map3","map4","map5"}--,"map3","map4","map 3 - Mansion","Map 5 - Workshop"}
local spawnArea={
 {
    {x1=3,y1=53,z1=11,x2=5,y2=53,z2=46},
    {x1=16,y1=53,z1=15,x2=18,y2=53,z2=29},
    {x1=38,y1=53,z1=17,x2=41,y2=53,z2=57},
    {x1=26,y1=53,z1=32,x2=34,y2=53,z2=48},
    {x1=32,y1=53,z1=18,x2=35,y2=53,z2=19},
    {x1=45,y1=53,z1=37,x2=47,y2=53,z2=52},
    {x1=20,y1=53,z1=52,x2=33,y2=53,z2=54}
  },
  {
    {x1=48,y1=53,z1=12,x2=50,y2=53,z2=28},
     {x1=8,y1=53,z1=12,x2=50,y2=53,z2=14},
     {x1=76,y1=59,z1=18,x2=79,y2=59,z2=40},
     {x1=65,y1=66,z1=36,x2=72,y2=66,z2=54},
     {x1=54,y1=53,z1=21,x2=61,y2=66,z2=27},
     {x1=86,y1=59,z1=23,x2=95,y2=59,z2=79},
     {x1=59,y1=59,z1=44,x2=62,y2=59,z2=61},
  },
  {
    {x1=37,y1=52,z1=9,x2=50,y2=52,z2=16},
    {x1=34,y1=54,z1=20,x2=49,y2=54,z2=29},
    {x1=53,y1=53,z1=20,x2=60,y2=53,z2=29},
    {x1=65,y1=42,z1=10,x2=73,y2=42,z2=22},
    {x1=76,y1=55,z1=7,x2=88,y2=55,z2=17},
    
    {x1=35,y1=53,z1=35,x2=80,y2=53,z2=43},
    {x1=53,y1=53,z1=20,x2=60,y2=53,z2=29}
  },
  {{x1=33,y1=55,z1=15,x2=52,y2=55,z2=48},{x1=-7,y1=55,z1=2,x2=48,y2=55,z2=21},{x1=6,y1=56,z1=23,x2=31,y2=56,z2=26},{x1=6,y1=56,z1=27,x2=8,y2=56,z2=31},{x1=-5,y1=56,z1=32,x2=8,y2=56,z2=34},{x1=-5,y1=56,z1=35,x2=-2,y2=56,z2=54},{x1=-10,y1=56,z1=49,x2=-6,y2=56,z2=55},{x1=11,y1=56,z1=28,x2=22,y2=56,z2=34},{x1=14,y1=56,z1=35,x2=21,y2=56,z2=40},{x1=24,y1=56,z1=28,x2=30,y2=56,z2=41},{x1=1,y1=56,z1=37,x2=10,y2=56,z2=53},{x1=11,y1=56,z1=45,x2=30,y2=56,z2=52},{x1=19,y1=56,z1=53,x2=29,y2=56,z2=64},{x1=7,y1=46,z1=47,x2=18,y2=46,z2=55},{x1=10,y1=46,z1=29,x2=14,y2=46,z2=43},{x1=7,y1=46,z1=26,x2=36,y2=46,z2=28},{x1=30,y1=46,z1=29,x2=33,y2=46,z2=39},{x1=25,y1=46,z1=34,x2=29,y2=46,z2=36},{x1=23,y1=46,z1=31,x2=26,y2=46,z2=33},{x1=30,y1=47,z1=40,x2=31,y2=47,z2=44},{x1=13,y1=62,z1=43,x2=14,y2=62,z2=55},{x1=15,y1=62,z1=54,x2=19,y2=62,z2=59},{x1=21,y1=62,z1=56,x2=25,y2=62,z2=62},{x1=13,y1=62,z1=41,x2=25,y2=62,z2=42},{x1=17,y1=62,z1=28,x2=24,y2=62,z2=40},{x1=18,y1=62,z1=23,x2=22,y2=62,z2=26},{x1=10,y1=56,z1=61,x2=18,y2=56,z2=64},{x1=10,y1=49,z1=56,x2=13,y2=49,z2=60},{x1=34,y1=51,z1=31,x2=41,y2=51,z2=34},{x1=9,y1=58,z1=53,x2=11,y2=58,z2=59},{x1=12,y1=60,z1=57,x2=14,y2=60,z2=59}},
  {{x1=-42,y1=64,z1=-87,x2=-6,y2=64,z2=-72},{x1=-58,y1=65,z1=-87,x2=-2,y2=65,z2=-57},{x1=-50,y1=65,z1=-87,x2=-46,y2=65,z2=-58},{x1=-49,y1=67,z1=-95,x2=-39,y2=67,z2=-91},{x1=-37,y1=69,z1=-100,x2=-11,y2=69,z2=-91},{x1=-9,y1=67,z1=-95,x2=2,y2=67,z2=-91},{x1=-9,y1=67,z1=-95,x2=2,y2=67,z2=-91},{x1=-59,y1=62,z1=-79,x2=-52,y2=62,z2=-75},{x1=-58,y1=53,z1=-64,x2=-53,y2=53,z2=-62},{x1=-51,y1=53,z1=-66,x2=-47,y2=53,z2=-59},{x1=-50,y1=53,z1=-107,x2=-48,y2=53,z2=-70},{x1=-68,y1=53,z1=-106,x2=-54,y2=53,z2=-100},{x1=-45,y1=53,z1=-92,x2=-3,y2=53,z2=-90},{x1=-37,y1=50,z1=-113,x2=-31,y2=50,z2=-93},{x1=-30,y1=50,z1=-96,x2=-17,y2=50,z2=-93},{x1=-30,y1=47,z1=-113,x2=-17,y2=50,z2=-110},{x1=-30,y1=51,z1=-108,x2=-17,y2=51,z2=-107},{x1=-30,y1=51,z1=-100,x2=-17,y2=51,z2=-98},{x1=-24,y1=54,z1=-124,x2=-23,y2=54,z2=-105},{x1=-29,y1=54,z1=-103,x2=-26,y2=54,z2=-97},{x1=-25,y1=54,z1=-99,x2=-21,y2=54,z2=-97},{x1=8,y1=54,z1=-99,x2=13,y2=54,z2=-90},{x1=15,y1=54,z1=-107,x2=22,y2=54,z2=-89},{x1=-1,y1=54,z1=-71,x2=3,y2=54,z2=-60},{x1=-1,y1=54,z1=-93,x2=1,y2=54,z2=-72},{x1=-1,y1=54,z1=-93,x2=1,y2=54,z2=-72},{x1=4,y1=54,z1=-64,x2=11,y2=54,z2=-62},{x1=6,y1=61,z1=-79,x2=10,y2=61,z2=-68},{x1=13,y1=52,z1=-77,x2=14,y2=52,z2=-61}},
  {{x1=39,y1=53,z1=-1,x2=41,y2=53,z2=9},{x1=29,y1=54,z1=-2,x2=37,y2=54,z2=9},{x1=34,y1=54,z1=10,x2=36,y2=54,z2=14},{x1=23,y1=54,z1=15,x2=37,y2=54,z2=17},{x1=20,y1=54,z1=18,x2=30,y2=54,z2=20},{x1=30,y1=54,z1=21,x2=36,y2=54,z2=35},{x1=18,y1=54,z1=25,x2=29,y2=54,z2=32},{x1=20,y1=54,z1=36,x2=30,y2=54,z2=38},{x1=23,y1=54,z1=39,x2=37,y2=54,z2=41},{x1=38,y1=54,z1=21,x2=43,y2=54,z2=35},{x1=46,y1=54,z1=28,x2=48,y2=54,z2=30},{x1=33,y1=54,z1=43,x2=37,y2=54,z2=46},{x1=28,y1=54,z1=48,x2=46,y2=54,z2=51},{x1=47,y1=54,z1=49,x2=49,y2=54,z2=79},{x1=25,y1=54,z1=49,x2=27,y2=54,z2=79},{x1=24,y1=55,z1=80,x2=50,y2=55,z2=95},{x1=29,y1=63,z1=60,x2=45,y2=63,z2=79},{x1=31,y1=63,z1=56,x2=43,y2=63,z2=58},{x1=39,y1=61,z1=1,x2=43,y2=61,z2=50},{x1=46,y1=61,z1=43,x2=48,y2=61,z2=50},{x1=24,y1=61,z1=44,x2=34,y2=61,z2=52},{x1=28,y1=60,z1=38,x2=38,y2=60,z2=40},{x1=28,y1=60,z1=16,x2=38,y2=60,z2=18},{x1=27,y1=61,z1=20,x2=28,y2=61,z2=36},{x1=34,y1=61,z1=-12,x2=45,y2=61,z2=-1},{x1=21,y1=60,z1=7,x2=35,y2=60,z2=12},{x1=18,y1=62,z1=0,x2=26,y2=62,z2=6},{x1=30,y1=60,z1=0,x2=32,y2=60,z2=5},{x1=40,y1=67,z1=12,x2=42,y2=67,z2=37},{x1=37,y1=67,z1=-1,x2=44,y2=67,z2=11},{x1=46,y1=68,z1=-1,x2=49,y2=68,z2=9},{x1=51,y1=68,z1=-1,x2=56,y2=68,z2=9},{x1=33,y1=68,z1=-5,x2=50,y2=68,z2=-3},{x1=30,y1=66,z1=-7,x2=31,y2=68,z2=-3},{x1=28,y1=68,z1=8,x2=36,y2=68,z2=14},{x1=28,y1=68,z1=1,x2=36,y2=68,z2=6},{x1=32,y1=67,z1=16,x2=38,y2=67,z2=18},{x1=32,y1=67,z1=38,x2=38,y2=67,z2=40},{x1=28,y1=67,z1=42,x2=38,y2=67,z2=45},{x1=26,y1=68,z1=48,x2=32,y2=68,z2=60},{x1=36,y1=68,z1=50,x2=40,y2=68,z2=59},{x1=44,y1=68,z1=53,x2=54,y2=68,z2=57},{x1=50,y1=68,z1=46,x2=54,y2=68,z2=52},{x1=45,y1=67,z1=47,x2=48,y2=67,z2=51},{x1=50,y1=65,z1=23,x2=52,y2=65,z2=35},{x1=50,y1=58,z1=24,x2=52,y2=58,z2=35},{x1=45,y1=55,z1=24,x2=48,y2=55,z2=26},{x1=45,y1=60,z1=33,x2=49,y2=60,z2=35},{x1=45,y1=62,z1=23,x2=48,y2=62,z2=26},{x1=45,y1=67,z1=33,x2=49,y2=67,z2=35}},
}
--------------------------------
local numMap
local playMap
local dynamicMap
--------------------------------
local timer
local once=true
local readyPlayerList={}
local GameStart=false
local isStart=false
local maxTimer=240
local teamName={"murder","sheriff","survivor"}
local numPlayerInTeam={1,1}

local endGame=function()
  numMap=nil
  playMap=nil
  dynamicMap=nil
  timer=maxTimer
  readyPlayerList={}
  isStart=false
  PackageHandlers.sendServerHandlerToAll("UI",{nameUI="main/timer",status="close"})
  PackageHandlers.sendServerHandlerToAll("UI",{nameUI="main/pickUpCoin",status="close"})
  PackageHandlers.sendServerHandlerToAll("UI",{nameUI="main/playUI",status="close"})
  local players = Game.GetAllPlayers()
  for kk, v in pairs(players) do
    PackageHandlers.sendServerHandler(v,"playSoundLobby")
    local team= v:getTeam()
    if team~=nil then
      local map = World.CurWorld:getMap("lobby2")
      v:setMapPos(map, Lib.v3(23,55,34))
      v:setRebirthPos(Lib.v3(23,55,34),map)
      team:leaveEntity(v)
      local entityTrays = v:tray()
      local filterTB = {
        Define.TRAY_TYPE.HAND_BAG
      }
      local trayTb = entityTrays:query_trays(filterTB)
      for tid, _tray in pairs(trayTb) do
        local count=_tray.tray:count_item_num_by_fullname("myplugin/ad69ecbc-9f7e-4797-af2d-de9d802b6220")
        local db = v:getValue("profile")
        local profile = v:getValue("profile")
        profile.totalCoin = db.totalCoin+count
        profile.lv=db.lv
        profile.exp=db.exp
        v:setValue('profile',profile) 
        for i=1,9 do
        _tray.tray:remove_item(i)
        end
      end
    end
  end
end

Entity.addValueDef('profile',{
    totalCoin=1500,
    lv=0,
    exp=0
}
,false,false,true)

Entity.addValueDef('weapon',{
    listWeapon={},
    selectWeapon={sheriff={idItem="ff9513ee-8d9b-4f3f-bac8-d6bc050700ea"},murder={idItem="8e0f0017-70da-4efa-a4e8-cdca4b317c09"}}
}
,false,false,true)
Entity.addValueDef('sevenday',{
    day=0,
    month=0,
    year=0,
    loginCount=0,
}
,false,false,true)
Entity.addValueDef('_28day',{
    day=0,
    month=0,
    year=0,
    loginCount=0,
}
,false,false,true)
local isAirBlock=function (mapstr,x1,y1,z1)
  local pos={x=x1,y=y1,z=z1}
  local map = World.CurWorld:getMap(mapstr)
  local block = map:getBlock(pos)
  if(block.fullName=="/air") then return true end
  return false
end
PackageHandlers.registerServerHandler("addItem", function(player, packet)
    local wp=player:getValue("weapon")
    wp.listWeapon[#wp.listWeapon+1]=packet.item
    player:setValue("weapon",wp)
end)

PackageHandlers.registerServerHandler("addReady", function(player, packet)
    readyPlayerList[#readyPlayerList+1]=player
end)
Entity.addValueDef('thanhtuu',{
    coin=0,
    kill=0
}
,false,false,true)

PackageHandlers.registerServerHandler("addCoinThanhTuu", function(player, packet)
    local thanhtuu = player:getValue("thanhtuu")
    thanhtuu.coin=thanhtuu.coin+1
    player:setValue("thanhtuu",thanhtuu)
end)
PackageHandlers.registerServerHandler("addKillThanhTuu", function(player, packet)
    local thanhtuu = player:getValue("thanhtuu")
    thanhtuu.kill=thanhtuu.kill+1
    player:setValue("thanhtuu",thanhtuu)
end)
PackageHandlers.registerServerHandler("addCoinPlayer", function(player, packet)
    local profile = player:getValue("profile")
    profile.totalCoin=profile.totalCoin+packet.coin
    player:setValue("profile",profile)
end)
PackageHandlers.registerServerHandler("addEXPPlayer", function(player, packet)
    if lv[profile.lv+1]>=profile.exp+packet.exp then
        profile.lv=profile.lv+1
        profile.exp=profile.exp+packet.exp-lv[profile.lv+1]
      else
        profile.exp=profile.exp+packet.exp
      end
      
      player:setValue('profile',profile)
end)
PackageHandlers.registerServerHandler("openThanhTuu", function(player, packet)
    local thanhtuu = player:getValue("thanhtuu")
    PackageHandlers.sendServerHandler(player,"UI",{nameUI="main/Achievement",status="open",thanhtuu=thanhtuu})
end)
PackageHandlers.registerServerHandler("buyItem", function(player, packet)
    player:setValue('profile',packet.profile) 
    player:setValue('weapon',packet.weapon) 
    local db = player:getValue("weapon")
    local profile = player:getValue("profile")
    PackageHandlers.sendServerHandler(player,"UI",{nameUI="main/shop",status="open",db=db,profile=profile})
end)
PackageHandlers.registerServerHandler("updateDay7daylogin", function(player, packet)
    player:setValue('sevenday',packet.day) 
    local day = player:getValue("sevenday")
    local profile = player:getValue("profile")
    if (day.loginCount==1) then
      profile.totalCoin=profile.totalCoin+50
      player:setValue('profile',profile)
    elseif (day.loginCount==3) then
      if lv[profile.lv+1]>=profile.exp+100 then
        profile.lv=profile.lv+1
        profile.exp=profile.exp+100-lv[profile.lv+1]
      else
        profile.exp=profile.exp+100
      end
      
      player:setValue('profile',profile)
    elseif (day.loginCount==2)or(day.loginCount==5)or(day.loginCount==6) then
      profile.totalCoin=profile.totalCoin+100
      player:setValue('profile',profile)
    elseif (day.loginCount==4) then
      local wp=player:getValue("weapon")
      wp.listWeapon[#wp.listWeapon+1]={
        name="Green Talled Pickaxe",
        price="3000",
        img="gameres|asset/Texture/Gui/GreenTalledPickaxe.png",
        idItem="5029fb61-d4fe-428f-85e1-3413f909a014",
        i=3,
        type="knife",
      }
      player:setValue("weapon",wp)
    elseif (day.loginCount==7) then
      local wp=player:getValue("weapon")
      wp.listWeapon[#wp.listWeapon+1]={
        name="Battle Golden Bow",
        price="4000",
        img="gameres|asset/Texture/Gui/BattleGoldenBow.png",
        idItem="51628cca-71b9-4ad3-aeb3-8da9a933d8db",
        i=5,
        type="gun",
      }
      player:setValue("weapon",wp)
    end
    PackageHandlers.sendServerHandler(player,"UI",{nameUI="main/7dayslogin",status="open",day=day})
end)
PackageHandlers.registerServerHandler("updateEquip", function(player, packet)
    player:setValue('weapon',packet.weapon)
      local db = player:getValue("weapon")
    local profile = player:getValue("profile")
    PackageHandlers.sendServerHandler(player,"UI",{nameUI="main/balo",status="open",db=db,profile=profile})
end)
PackageHandlers.registerServerHandler("updateDay28daylogin", function(player, packet)
    player:setValue('_28day',packet.day) 
    local day = player:getValue("_28day")
    local profile = player:getValue("profile")
    if day.loginCount==5 then
      
      profile.totalCoin=profile.totalCoin+1000
    elseif day.loginCount==10 then
      profile.totalCoin=profile.totalCoin+2000
      elseif day.loginCount==15 then
      profile.totalCoin=profile.totalCoin+3000
      elseif day.loginCount==20 then
      profile.totalCoin=profile.totalCoin+4000
    else
      profile.totalCoin=profile.totalCoin+100
    end
    
    player:setValue('profile',profile) 
    PackageHandlers.sendServerHandler(player,"UI",{nameUI="main/28dayslogin",status="open",day=day})
end)
PackageHandlers.registerServerHandler("openShop", function(player, packet)
    local db = player:getValue("weapon")
    local profile = player:getValue("profile")
    PackageHandlers.sendServerHandler(player,"UI",{nameUI="main/shop",status="open",db=db,profile=profile})
end)
PackageHandlers.registerServerHandler("open7day", function(player, packet)
    local day = player:getValue("sevenday")
    PackageHandlers.sendServerHandler(player,"UI",{nameUI="main/7dayslogin",status="open",day=day})
end)
PackageHandlers.registerServerHandler("open28day", function(player, packet)
    local day = player:getValue("_28day")
    PackageHandlers.sendServerHandler(player,"UI",{nameUI="main/28dayslogin",status="open",day=day})
end)
PackageHandlers.registerServerHandler("openBalo", function(player, packet)
    local db = player:getValue("weapon")
    local profile = player:getValue("profile")
    PackageHandlers.sendServerHandler(player,"UI",{nameUI="main/balo",status="open",db=db,profile=profile})
end)
Trigger.RegisterHandler(World.cfg, "GAME_START", function()
    --PackageHandlers.sendServerHandlerToAll("playSoundLobby")
    PackageHandlers.sendServerHandlerToAll("UI",{nameUI="main/readyUI",status="open"})
    GameStart=true
end)
Trigger.RegisterHandler(Entity.GetCfg("myplugin/player1"), "ENTITY_DIE", function(context)
    local v = context.obj1
    PackageHandlers.sendServerHandler(v,"playSoundLobby")
    local enemy = context.obj2 
    local teams= v:getTeam()
    local team2 = Game.GetTeam(2, true)
    local team3 = Game.GetTeam(3, true)
    if(teams.playerCount==1)and(teams.id==1)then
      local teamLose = Game.GetTeam(1, true)
      local teamWin = Game.GetTeam(2, true)
      local loseActor
      local winActor
      for k,v in pairs(teamLose:getEntityList()) do
        loseActor=v.name
      end
      for k,v in pairs(teamWin:getEntityList()) do
        winActor=v.name
      end
      PackageHandlers.sendServerHandlerToAll("UI",{nameUI="main/lastResult",status="open",win=2,winActor=winActor,loseActor=loseActor})
      endGame()
    elseif((teams.id==2)or(teams.id==3))and(team2.playerCount+team3.playerCount==1)then
      local teamLose = Game.GetTeam(1, true)
      local teamWin = Game.GetTeam(2, true)
      local loseActor
      local winActor
      for k,v in pairs(teamLose:getEntityList()) do
        loseActor=v.name
      end
      for k,v in pairs(teamWin:getEntityList()) do
        winActor=v.name
      end
      PackageHandlers.sendServerHandlerToAll("UI",{nameUI="main/lastResult",status="open",win=1,winActor=loseActor,loseActor=winActor})
      endGame()
    else
      local map = World.CurWorld:getMap("lobby2")
      PackageHandlers.sendServerHandler(v,"UI",{nameUI="main/timer",status="close"})
      PackageHandlers.sendServerHandler(v,"UI",{nameUI="main/pickUpCoin",status="close"})
      PackageHandlers.sendServerHandler(v,"UI",{nameUI="main/playUI",status="close"})
      v:setMapPos(map, Lib.v3(23,55,34))
      v:setRebirthPos(Lib.v3(23,55,34),map)
      teams:leaveEntity(v)
      local entityTrays = v:tray()
      local filterTB = {
        Define.TRAY_TYPE.HAND_BAG
      }
      local trayTb = entityTrays:query_trays(filterTB)
      for tid, _tray in pairs(trayTb) do
      local count=_tray.tray:count_item_num_by_fullname("myplugin/ad69ecbc-9f7e-4797-af2d-de9d802b6220")
      local db = v:getValue("profile")
      local profile = v:getValue("profile")
      profile.totalCoin = db.totalCoin+count
      profile.lv=db.lv
      profile.exp=db.exp
      v:setValue('profile',profile) 
      for i=1,9 do
        _tray.tray:remove_item(i)
      end
    end
  end
end)

World.Timer(20, 
  function()
    local playerNum=Game.GetAllPlayersCount()
    local players=Game.GetAllPlayers()
    for i,v in pairs(players) do
      local data=v:getValue("profile")
      PackageHandlers.sendServerHandler(v,"UI",{nameUI="main/playerUI",status="open",data=data})
    end
    if(isStart==false)and(GameStart) then
      if(once) then
        PackageHandlers.sendServerHandlerToAll("UI",{nameUI="main/readyUI",status="open"})
        once=false
      end
      if(#readyPlayerList==playerNum)then
        PackageHandlers.sendServerHandlerToAll("playSoundIngame")
        isStart=true
        playMap=nil
        once=true
      end
    elseif(isStart and GameStart)then
      local players = Game.GetAllPlayers()
      
      if playMap==nil then
        timer=maxTimer
        numMap=math.random(1,#mapName)
        playMap=mapName[numMap]
        dynamicMap = World.CurWorld:createDynamicMap(playMap, true)
        for i,v in pairs(players) do
          local team = Game.GetTeam(3,true)
          team:joinEntity(v)
          local getPos=spawnArea[numMap][math.random(1,#spawnArea[numMap])]
          local x=math.random(getPos.x1,getPos.x2)
          local y=math.random(getPos.y1,getPos.y2)
          local z=math.random(getPos.z1,getPos.z2)
          while isAirBlock(playMap,x,y,z)==false do
            x=math.random(getPos.x1,getPos.x2)
            y=math.random(getPos.y1,getPos.y2)
            z=math.random(getPos.z1,getPos.z2)
          end
          v:setMapPos(dynamicMap, Lib.v3(x,y,z))
        end
        for index=1,2 do
          local team = Game.GetTeam(index,true)
          local teamNum=0
          for kkk,vvv in pairs(team:getEntityList()) do
            teamNum=teamNum+1
          end
          while (teamNum<numPlayerInTeam[index])and(numPlayerInTeam[1]+numPlayerInTeam[2]<playerNum) do
            local player=players[math.random(1,#players)]
            local team_1= player:getTeam()
            while team_1.id~=3 do
              player=players[math.random(1,#players)]
              team_1= player:getTeam()
            end
            team_1:leaveEntity(player)
            team:joinEntity(player)
            local idItem=player:getValue("weapon")
            if (index==1) then
              
              player:addItem("myplugin/"..idItem.selectWeapon.murder.idItem, 1, nil, "enter")
            elseif index==2 then
              player:addItem("myplugin/"..idItem.selectWeapon.sheriff.idItem, 1, nil, "enter")
            end
            teamNum=0
            for kkk,vvv in pairs(team:getEntityList()) do
              teamNum=teamNum+1
            end
          end
        end
        for i,v in pairs(players) do
          PackageHandlers.sendServerHandler(v,"UI",{nameUI="main/showTeam",status="open",team=v:getTeam().id})
        end
        PackageHandlers.sendServerHandlerToAll("UI",{nameUI="main/pickUpCoin",status="open"})
      end
      for i,v in pairs(players) do
        if(v:getTeam()~=nil) then
          PackageHandlers.sendServerHandler(v,"getTeam",{teamID=v:getTeam().id})
        end
      end
      PackageHandlers.sendServerHandlerToAll("UI",{nameUI="main/timer",status="open",timer=timer})
      if timer==maxTimer-3 then
        PackageHandlers.sendServerHandlerToAll("UI",{nameUI="main/showTeam",status="close"})
      end
      if (timer%10==0) then
        for i=1,10 do
          local getPos=spawnArea[numMap][math.random(1,#spawnArea[numMap])]
          local x=math.random(getPos.x1,getPos.x2)
          local y=math.random(getPos.y1,getPos.y2)
          local z=math.random(getPos.z1,getPos.z2)
          while isAirBlock(playMap,x,y,z)==false do
            x=math.random(getPos.x1,getPos.x2)
            y=math.random(getPos.y1,getPos.y2)
            z=math.random(getPos.z1,getPos.z2)
          end
          EntityServer.Create({cfgName = "myplugin/d5e881ee-c53e-4d4a-9235-4b98d5dae561", map = dynamicMap, pos =  Lib.v3(x,y,z), name = "" })
        end
      end
      timer=timer-1
      if (timer==0) then
          local teamLose = Game.GetTeam(1, true)
          local teamWin = Game.GetTeam(2, true)
          local loseActor
          local winActor
          for k,v in pairs(teamLose:getEntityList()) do
            loseActor=v.name
          end
          for k,v in pairs(teamWin:getEntityList()) do
            winActor=v.name
          end
          PackageHandlers.sendServerHandlerToAll("UI",{nameUI="main/lastResult",status="open",win=2,winActor=winActor,loseActor=loseActor})
          endGame()
      else
        
      end
    end
  return true
end )
