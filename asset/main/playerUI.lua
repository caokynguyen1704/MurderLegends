
function self:onOpen(packet)
  self.BG.ActorWindow:setActorName(Me:getActorName())
  if(packet.packet)then
    self.BG.numCoin:setText(packet.packet.data.totalCoin)
    self.BG.numLevel:setText(packet.packet.data.lv)
  end
  self.ShopBtn.onMouseClick=function()
    closeAll()
    PackageHandlers.sendClientHandler("openShop")
  end
  self.BaloBtn.onMouseClick=function()
    closeAll()
    PackageHandlers.sendClientHandler("openBalo")
  end
  self.sevendayloginBtn.onMouseClick=function()
    closeAll()
    PackageHandlers.sendClientHandler("open7day")
  end
  self._28dayloginBtn.onMouseClick=function()
    closeAll()
    PackageHandlers.sendClientHandler("open28day")
  end
  self.Achievement.onMouseClick=function()
    closeAll()
    PackageHandlers.sendClientHandler("openThanhTuu")
  end
  self.PetBtn.onMouseClick=function()
    closeAll()
    PackageHandlers.sendClientHandler("openPet")
  end
  
end
function closeAll()
  UI:closeWindow("main/Achievement")
  UI:closeWindow("main/petHouse")
    UI:closeWindow("main/28dayslogin")
   UI:closeWindow("main/7dayslogin")
   UI:closeWindow("main/balo")
   UI:closeWindow("main/shop")
end