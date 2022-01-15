
function self:onOpen(packet)
  if(packet.packet)then
    local timer=packet.packet.timer
    self.Text:setText(timer.."s")
  end
end