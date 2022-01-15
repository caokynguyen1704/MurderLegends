local teamName={"murder","sheriff","survivor"}
 local TdAudioEngine = TdAudioEngine.Instance()
function self:onOpen(packet)
  if(packet.packet)then
    local timer=packet.packet.timer
    self.bg.timerNum:setText(timer.."s")
    self.bg.teamNum:setText(teamName[packet.packet.team])
    if(packet.packet.win==1) then 
      if packet.packet.win==packet.packet.team then
        self.bg.winLogo:setVisible(true)
        TdAudioEngine:play2dSound("asset/music/Victory.mp3", false)
      else 
        self.bg.loseLogo:setVisible(true)
        TdAudioEngine:play2dSound("asset/music/Lose.mp3", false)
      end
    elseif packet.packet.win==0 then 
        self.bg.loseLogo:setVisible(true)
        TdAudioEngine:play2dSound("asset/music/Lose.mp3", false)
    else
      if packet.packet.team==1 then
        self.bg.loseLogo:setVisible(true)
        TdAudioEngine:play2dSound("asset/music/Lose.mp3", false)
      else 
        self.bg.winLogo:setVisible(true)
        TdAudioEngine:play2dSound("asset/music/Victory.mp3", false)
      end
    end
  end
  self.bg.CloseBtn.onMouseClick=function()
    UI:closeWindow("main/resultUI")
  end
end