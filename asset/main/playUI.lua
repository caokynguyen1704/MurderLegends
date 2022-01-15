function self:onOpen(packet)
  if(packet.teamID)then
    teamID=packet.teamID
  end
  if(teamID==1)then self.knifeBg:setVisible(true) self.gunBg:setVisible(false)  end
  if(teamID==2)then self.gunBg:setVisible(true) self.knifeBg:setVisible(false) end
  if(teamID==3)then self.gunBg:setVisible(false) self.knifeBg:setVisible(false) end
  self.gunBg.Button.onMouseClick = function()
    
  end
end