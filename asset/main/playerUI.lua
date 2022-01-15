
function self:onOpen(packet)
  self.avtBg.ActorWindow:setActorName(Me:getActorName())
  if(packet.packet)then
    self.coinBg.numCoin:setText(packet.packet.data.totalCoin)
    self.lvBg.numLevel:setText(packet.packet.data.lv)
  end
  self.ShopBtn.onMouseClick=function()
    PackageHandlers.sendClientHandler("openShop")
  end
end