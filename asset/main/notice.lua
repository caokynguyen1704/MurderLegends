
function self:onOpen(packet)
  
    local i=3
    World.Timer(20,function()
      if (i<=0) then
        UI:closeWindow(self)
        return false
      end
      self.Image.Text1:setText("Close after "..i.." seconds")
      i=i-1
      return true
    end)
 
end