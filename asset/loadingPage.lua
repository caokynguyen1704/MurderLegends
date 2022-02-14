function self:onOpen(packet)
  local loading=self.Image.loadbar
  local i=0
  World.Timer(0,function()
    if i<100 then
      i=i+30
      loading:setProgress(i/100)
      return 1
    else
      UI:closeWindow("loadingPage")
      return false
    end
  end)
end