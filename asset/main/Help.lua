

function self:onOpen(packet)
   
  self.Image.CloseButton.onMouseClick=function()
    UI:closeWindow("main/Help")
  end
end