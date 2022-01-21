
function self:onOpen(packet)
   local day=packet.packet.day
    local currentMonth=os.date("%m")
    local currentDay=os.date("%d")
    local currentYear=os.date("%Y")
    if (packet.packet.day)then
     
      if(currentDay~=day.day)and(day.loginCount<7) then
        self.Background.HorizontalLayout:child("Day"..day.loginCount+1).Button:setVisible(true)
        if day.loginCount>=1 then
          for i=1,day.loginCount do
            self.Background.HorizontalLayout:child("Day"..i).Received:setVisible(true)
          end
        end
          
      else
          for i=1,day.loginCount do
            self.Background.HorizontalLayout:child("Day"..i).Received:setVisible(true)
          end
      end
    end

  for k=1,7 do
    self.Background.HorizontalLayout:child("Day"..k).Button.onMouseClick=function()
      day.day=currentDay
      day.month=currentMonth
      day.year=currentYear
      day.loginCount=day.loginCount+1
      PackageHandlers.sendClientHandler("updateDay7daylogin",{day=day})
    end
  end
  self.Background.CloseButton.onMouseClick=function()
    UI:closeWindow("main/7dayslogin")
  end
end