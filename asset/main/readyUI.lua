function self:onOpen(packet)
  self.bg.BtnYes.onMouseClick = function()
    PackageHandlers.sendClientHandler("addReady")
    UI:closeWindow("main/readyUI")
  end
end