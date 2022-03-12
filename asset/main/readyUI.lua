function self:onOpen(packet)
  self.bg.BtnYes.onMouseClick = function()
    PackageHandlers.sendClientHandler("addReady")
    UI:closeWindow("main/readyUI")
  end
  local data=packet.packet
  PackageHandlers.registerClientHandler("isStart", function(player, packet)
      if(packet.isStart==true) then
        UI:closeWindow("main/readyUI")
        self:setVisible(false)
        if data.isLogin==1 then
          if data.playerId~=nil then
            if player.platformUserId==data.playerId then
                UI:openWindow("main/notice")
            end 
          end
        end
      else
        self:setVisible(true)
      end
  end)
end