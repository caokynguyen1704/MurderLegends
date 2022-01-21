local numCoin=0
local teamID=3
 local TdAudioEngine = TdAudioEngine.Instance()
 local musicLobby=nil
 local musicIngame=nil
musicLobby=TdAudioEngine:play2dSound("asset/main/music/lobby.mp3", true)
PackageHandlers.registerClientHandler("playSoundCoin", function(player, packet)
    --from.baseSpawnInfo.pos
    local id=TdAudioEngine.Instance():play3dSound("asset/main/music/coin.mp3", packet.pos,false)
end)
PackageHandlers.registerClientHandler("playSoundLobby", function(player, packet)
    --from.baseSpawnInfo.pos
    TdAudioEngine:stopSound(musicIngame)
      TdAudioEngine:stopSound(musicLobby)

    musicLobby=TdAudioEngine:play2dSound("asset/main/music/lobby.mp3", true)
end)
PackageHandlers.registerClientHandler("playSoundIngame", function(player, packet)

      TdAudioEngine:stopSound(musicLobby)

    TdAudioEngine:stopSound(musicIngame)
    musicIngame=TdAudioEngine:play2dSound("asset/main/music/Ingame.mp3", true)
end)
PackageHandlers.registerClientHandler("getTeam", function(player, packet)
    if(packet.teamID)then
      teamID=packet.teamID
      UI:closeWindow("main/playUI")
      UI:openWindow("main/playUI","main/playUI","layouts",{teamID=packet.teamID})
    end
end)
PackageHandlers.registerClientHandler("UI", function(player, packet)
    if(packet.status=="open") then
      UI:closeWindow(packet.nameUI)
      UI:openWindow(packet.nameUI,packet.nameUI,"layouts",{packet=packet,team=teamID})
    elseif (packet.status=="close")then
      UI:closeWindow(packet.nameUI)
    end
end)