Trigger.RegisterHandler(this:cfg(), "ENTITY_TOUCH_ALL", function(context)
    local from = context.obj1
    local to =context.obj2
    if from.baseSpawnInfo.cfgName=="myplugin/d5e881ee-c53e-4d4a-9235-4b98d5dae561" then
      if to.className=="EntityServerPlayer" then
        --PackageHandlers.sendServerHandler(to, "playSoundCoin", {pos = from.baseSpawnInfo.pos})
        from:destroy()
        to:addItem("myplugin/ad69ecbc-9f7e-4797-af2d-de9d802b6220", 1, nil, "pickup")
        PackageHandlers.sendServerHandler(to, "playSoundCoin", {pos = from.baseSpawnInfo.pos})
        local thanhtuu = to:getValue("thanhtuu")
        thanhtuu.coin=thanhtuu.coin+1
        to:setValue("thanhtuu",thanhtuu)
        local entityTrays = to:tray()
        local filterTB = {
          Define.TRAY_TYPE.HAND_BAG
        }
        local trayTb = entityTrays:query_trays(filterTB)
        for tid, _tray in pairs(trayTb) do
          local count=_tray.tray:count_item_num_by_fullname("myplugin/ad69ecbc-9f7e-4797-af2d-de9d802b6220")
          PackageHandlers.sendServerHandler(to,"UI",{nameUI="main/pickUpCoin",status="open",coin=count})
        end
      end
    end
end)