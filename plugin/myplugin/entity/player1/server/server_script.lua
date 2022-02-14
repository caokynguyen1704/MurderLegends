Trigger.RegisterHandler(this:cfg(), "ENTITY_HITTED", function(context)
    local entity = context.obj1 
    local enemy = context.obj2 
    local thanhtuu = enemy:getValue("thanhtuu")
    thanhtuu.kill=thanhtuu.kill+1
    enemy:setValue("thanhtuu",thanhtuu)
    if (entity:getTeam().id==3)and(enemy:getTeam().id==2) then
      local pos = enemy:getFrontPos(3, true, true) + Lib.v3(0, 0.2, 0)
      local params = {
        item = Item.CreateItem("myplugin/ff9513ee-8d9b-4f3f-bac8-d6bc050700ea", 1),
        map = enemy.map,
        pos = pos
      }
      local dropItem = DropItemServer.Create(params)
      enemy:kill(enemy,'bad police')
    end
    if (entity:getTeam().id==2) then
      local pos = entity:getFrontPos(3, true, true) + Lib.v3(0, 0.2, 0)
      local params = {
        item = Item.CreateItem("myplugin/ff9513ee-8d9b-4f3f-bac8-d6bc050700ea", 1),
        map = entity.map,
        pos = pos
      }
      local dropItem = DropItemServer.Create(params)
    end
end)

Trigger.RegisterHandler(this:cfg(), "PRE_CHECK_PICK_ITEM", function(context)
    local it=context.item
    
     local player = context.obj1
     if (player:getTeam().id==1)or(player:getTeam().id==2) then
      context.canPick = false
    else
      
      context.canPick = true
      local team_1= player:getTeam()
      team_1:leaveEntity(player)
      local team = Game.GetTeam(2,true)
      team:joinEntity(player)
      
    end
end)

Trigger.RegisterHandler(this:cfg(), "SETTLE_ITEM", function(context)
  local entity = context.obj1
  local itemFullName = context.item:full_name() --Get the cfg fullname of the item
  if itemFullName == "myplugin/ff9513ee-8d9b-4f3f-bac8-d6bc050700ea" then
        local tray = context.tray
        local item = tray:remove_item(context.slot)
        local wp=entity:getValue("weapon")
        entity:addItem("myplugin/"..wp.selectWeapon.sheriff.idItem, 1, nil, "enter")
  end
end)