local mapName={"map2","map3","map4"}--,"map3","map4","map 3 - Mansion","Map 5 - Workshop"}
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
    {x1=-7,y1=53,z1=9,x2=46,y2=53,z2=18},
    {x1=14,y1=54,z1=30,x2=21,y2=54,z2=39},
    {x1=20,y1=58,z1=30,x2=29,y2=58,z2=62},
    {x1=0,y1=58,z1=47,x2=30,y2=58,z2=51},
  },
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
    totalCoin=4000,
    lv=0,
    exp=0
}
,false,false,true)
Entity.addValueDef('weapon',{
    listWeapon={},
    selectWeapon={sheriff=nil,murder=nil}
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
PackageHandlers.registerServerHandler("addReady", function(player, packet)
    readyPlayerList[#readyPlayerList+1]=player
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
    profile.totalCoin=profile.totalCoin+100
    player:setValue('profile',profile)
    PackageHandlers.sendServerHandler(player,"UI",{nameUI="main/7dayslogin",status="open",day=day})
end)
PackageHandlers.registerServerHandler("updateDay28daylogin", function(player, packet)
    player:setValue('_28day',packet.day) 
    local day = player:getValue("_28day")
    local profile = player:getValue("profile")
    profile.totalCoin=profile.totalCoin+100
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
    PackageHandlers.sendServerHandlerToAll("UI",{nameUI="main/readyUI",status="open"})
    GameStart=true
end)
Trigger.RegisterHandler(Entity.GetCfg("myplugin/player1"), "ENTITY_DIE", function(context)
    local v = context.obj1
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
            if (index==1) then
              player:addItem("myplugin/8e0f0017-70da-4efa-a4e8-cdca4b317c09", 1, nil, "enter")
            elseif index==2 then
              player:addItem("myplugin/ff9513ee-8d9b-4f3f-bac8-d6bc050700ea", 1, nil, "enter")
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
