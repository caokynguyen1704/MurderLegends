function self:onOpen(packet)
  self.bg.BtnYes.onMouseClick = function()
    PackageHandlers.sendClientHandler("addReady")
    UI:closeWindow("main/readyUI")
  end
  PackageHandlers.registerClientHandler("isStart", function(player, packet)
      if(packet.isStart==true) then
        UI:closeWindow("main/readyUI")
        self:setVisible(false)
      else
        self:setVisible(true)
      end
  end)
end