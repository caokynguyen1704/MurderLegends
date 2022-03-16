function self:onOpen(packet)
  self.bg.BtnYes.onMouseClick = function()
    --PackageHandlers.sendClientHandler("addReady")
    --UI:closeWindow("main/readyUI")
  end
  local data=packet.packet
  local w=self.bg
  local isRun=0
  local isRun1=0
  PackageHandlers.registerClientHandler("isStart", function(player, packet)
        if(packet.isStart==true) then
          UI:closeWindow("main/readyUI")
          self:setVisible(false)
          if data.isLogin==1 then
            if data.playerId~=nil then
              if player.platformUserId==data.playerId then
                isRun1=isRun1+1
                  if isRun1==1 then
                    UI:openWindow("main/notice")
                  end
              end 
            end
          end
        else
          self:setVisible(true)
          isRun=isRun+1
          if isRun==1 then
              if self:getProperty("Visible")=="true" then
      local k=20
      World.Timer(20, function()
        w.Text:setText("Start in "..k.." seconds")
        k=k-1
        if k<=0 then
          if self:getProperty("Visible")=="true" then
            PackageHandlers.sendClientHandler("addReady")
            print("------------click ready-----------")
            UI:closeWindow("main/readyUI")
            return false
          end
        end
        return true
      end)
    end
    end
        end
  end)




end