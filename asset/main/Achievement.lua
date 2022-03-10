
function self:onOpen(packet)

    if (packet.packet.thanhtuu)then
      self.Background.CoinCollect.Text:setText(packet.packet.thanhtuu.coin)
      self.Background.KillCollect.Text:setText(packet.packet.thanhtuu.kill)
        if packet.packet.thanhtuu.isReCoin==true then
          self.Background.taskCoin:setVisible(false)
        end
        if packet.packet.thanhtuu.isReKill==true then
          self.Background.taskKill:setVisible(false)
        end
      if packet.packet.thanhtuu.coin>=500 then
        if packet.packet.thanhtuu.isReCoin==false then
          self.Background.taskCoin.Button:setVisible(true)
        end
      end
      if packet.packet.thanhtuu.kill>=50 then
        if packet.packet.thanhtuu.isReKill==false then
          self.Background.taskKill.Button:setVisible(true)
        end
      end
    end
  self.Background.taskCoin.Button.onMouseClick=function()
    PackageHandlers.sendClientHandler("addEXPPlayer",{exp=100})
    PackageHandlers.sendClientHandler("editThanhTuu",{reCoin=1})
    PackageHandlers.sendClientHandler("openThanhTuu")
  end
  self.Background.taskKill.Button.onMouseClick=function()
    PackageHandlers.sendClientHandler("addEXPPlayer",{exp=500})
    PackageHandlers.sendClientHandler("editThanhTuu",{reKill=1})
    PackageHandlers.sendClientHandler("openThanhTuu")
  end
  self.Background.CloseButton.onMouseClick=function()
    UI:closeWindow("main/Achievement")
  end
end