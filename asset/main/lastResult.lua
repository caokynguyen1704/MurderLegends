local teamName={"murder","sheriff","survivor"}
 local TdAudioEngine = TdAudioEngine.Instance()
function self:onOpen(packet)
  if(packet.packet)then
    print(packet.team)
    if(packet.packet.win==1) then 
      self.bg_killer:setVisible(true)
      self.bg_killer.winActor.nameActor:setText(packet.packet.winActor)
      --self.bg_killer.winActor:setActorName(packet.packet.winActor:getActorName())
      self.bg_killer.loseActor.nameActor:setText(packet.packet.loseActor)
      --self.bg_killer.loseActor:setActorName(packet.packet.loseActor:getActorName())
      if(packet.team>=2) then
      self.bg_killer.loseImg:setVisible(true)
      TdAudioEngine:play2dSound("asset/music/Lose.mp3", false)
    else
      self.bg_killer.winImg:setVisible(true)
      TdAudioEngine:play2dSound("asset/music/Victory.mp3", false)
      end
    else
      self.bg_sheriff:setVisible(true)
      self.bg_sheriff.winActor.nameActor:setText(packet.packet.winActor)
      --self.bg_sheriff.winActor:setActorName(packet.packet.winActor:getActorName())
      self.bg_sheriff.loseActor.nameActor:setText(packet.packet.loseActor)
      --self.bg_sheriff.loseActor:setActorName(packet.packet.loseActor:getActorName())
      if(packet.team==1) then
        self.bg_sheriff.loseImg:setVisible(true)
        TdAudioEngine:play2dSound("asset/music/Lose.mp3", false)
      else
        self.bg_sheriff.winImg:setVisible(true)
        TdAudioEngine:play2dSound("asset/music/Victory.mp3", false)
      end
      --[=[self.bg_sheriff:setVisible(true)
      if packet.packet.team==1 then
        self.bg.loseLogo:setVisible(true)
        TdAudioEngine:play2dSound("asset/music/Lose.mp3", false)
      else 
        self.bg.winLogo:setVisible(true)
        TdAudioEngine:play2dSound("asset/music/Victory.mp3", false)
      end]=]--
    end
  end
  self.CloseBtn.onMouseClick=function()
    UI:closeWindow("main/lastResult")
  end
end