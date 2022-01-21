
function self:onOpen(packet)
   local day=packet.packet.day
    local currentMonth=os.date("%m")
    local currentDay=os.date("%d")
    local currentYear=os.date("%Y")
    if (packet.packet.day)then
     
      if(currentDay~=day.day)and(day.loginCount<28) then
        self.Background.GridView:child("Day"..day.loginCount+1).Image.Button:setVisible(true)
        if day.loginCount>=1 then
          for i=1,day.loginCount do
            self.Background.GridView:child("Day"..i).Received:setVisible(true)
          end
        end
          
      else
          for i=1,day.loginCount do
            self.Background.GridView:child("Day"..i).Received:setVisible(true)
          end
      end
    end

  for k=1,28 do
    self.Background.GridView:child("Day"..k).Image.Button.onMouseClick=function()
      print("click"..k)
      day.day=currentDay
      day.month=currentMonth
      day.year=currentYear
      day.loginCount=day.loginCount+1
      PackageHandlers.sendClientHandler("updateDay28daylogin",{day=day})
    end
  end
  self.Background.CloseButton.onMouseClick=function()
    UI:closeWindow("main/28dayslogin")
  end
end