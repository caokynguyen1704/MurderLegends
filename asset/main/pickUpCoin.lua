
function self:onOpen(packet)
  if(packet.packet)then
    local coin=packet.packet.coin
    self.pickCoin.Text:setText(coin)
  end
  
  
end