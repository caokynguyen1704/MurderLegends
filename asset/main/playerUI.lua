
function self:onOpen(packet)
  self.avtBg.ActorWindow:setActorName(Me:getActorName())
  if(packet.packet)then
    self.coinBg.numCoin:setText(packet.packet.data.totalCoin)
    self.lvBg.numLevel:setText(packet.packet.data.lv)
  end
  self.ShopBtn.onMouseClick=function()
    PackageHandlers.sendClientHandler("openShop")
  end
  self.BaloBtn.onMouseClick=function()
    PackageHandlers.sendClientHandler("openBalo")
  end
  self.sevendayloginBtn.onMouseClick=function()
    PackageHandlers.sendClientHandler("open7day")
  end
  self._28dayloginBtn.onMouseClick=function()
    PackageHandlers.sendClientHandler("open28day")
  end
  
end