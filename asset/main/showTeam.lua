local teamName={"murder","sheriff","innocent "}
function self:onOpen(packet)
  if(packet.packet)then
    self.Text:setText("You are "..teamName[packet.packet.team])
  end
end