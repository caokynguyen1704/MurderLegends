
function self:onOpen(packet)

    if (packet.packet.thanhtuu)then
      self.Background.CoinCollect.Text:setText(packet.packet.thanhtuu.coin)
      self.Background.KillCollect.Text:setText(packet.packet.thanhtuu.kill)
      if packet.packet.thanhtuu.coin>=50 then
        self.Background.taskCoin.Button:setVisible(true)
      end
      if packet.packet.thanhtuu.kill>=50 then
        self.Background.taskKill.Button:setVisible(true)
      end
    end
  self.Background.taskCoin.Button.onMouseClick=function()
    PackageHandlers.sendClientHandler("addCoinPlayer",{coin=1000})
    PackageHandlers.sendClientHandler("openThanhTuu")
  end
  self.Background.taskKill.Button.onMouseClick=function()
    PackageHandlers.sendClientHandler("addCoinPlayer",{coin=1000})
    PackageHandlers.sendClientHandler("openThanhTuu")
  end
  self.Background.CloseButton.onMouseClick=function()
    UI:closeWindow("main/Achievement")
  end
end