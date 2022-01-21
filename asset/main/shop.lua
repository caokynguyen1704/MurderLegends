local shopdata={
  {
    name="Assault Sword",
    price="500",
    img="gameres|asset/Texture/Gui/AssaultSword.png",
    idItem="83049293-058c-4f13-ad0b-bd0642528227",
    i=0,
    type="knife",
  },
  {
    name="Eternal Boardsword",
    price="1000",
    img="gameres|asset/Texture/Gui/EternalBoardsword.png",
    idItem="6581d150-6719-4a3f-9783-ce669dee6261",
    i=1,
    type="knife",
  },
  {
    name="Awesome Axe",
    price="1500",
    img="gameres|asset/Texture/Gui/AwesomeAxe.png",
    idItem="25d5b5f5-09f3-4d9e-b2a1-aabe2ebfd1d0",
    i=2,
    type="knife",
  },
  {
    name="Green Talled Pickaxe",
    price="3000",
    img="gameres|asset/Texture/Gui/GreenTalledPickaxe.png",
    idItem="5029fb61-d4fe-428f-85e1-3413f909a014",
    i=3,
    type="knife",
  },
  {
    name="Battle Streamer Bow",
    price="2000",
    img="gameres|asset/Texture/Gui/BattleStreamerBow.png",
    idItem="95efae6b-1bcc-4567-bf42-1fbfd76dc277",
    i=4,
    type="gun",
  },
  {
    name="Battle Golden Bow",
    price="4000",
    img="gameres|asset/Texture/Gui/BattleGoldenBow.png",
    idItem="51628cca-71b9-4ad3-aeb3-8da9a933d8db",
    i=5,
    type="gun",
  },
}


function self:onOpen(packet)
  if (packet.packet.db)then
    if #packet.packet.db.listWeapon==0 then
      for i=0,5 do
        self.Background.ScrollableView.GridView:child("ItemBackground"..i).SoidOut:setVisible(false)
      end
    else
      for k,v in pairs (packet.packet.db.listWeapon) do
        for kk,vv in pairs(shopdata) do
          if(vv.idItem==v.idItem) then
            self.Background.ScrollableView.GridView:child("ItemBackground"..vv.i).SoidOut:setVisible(true)
            self.Background.ScrollableView.GridView:child("ItemBackground"..vv.i).ItemButton:setVisible(false)
            break
          end
        end
      end
    end
  end
  self.Background.CloseButton.onMouseClick=function()
    UI:closeWindow("main/shop")
  end
  self.Background.CoinCount:setText(packet.packet.profile.totalCoin)
  for i=0,5 do
    self.Background.ScrollableView.GridView:child("ItemBackground"..i).ItemButton.onMouseClick=function()
      if packet.packet.profile.totalCoin>=shopdata[i+1].price*1 then
        local updateWeapon=packet.packet.db.listWeapon
        updateWeapon[#updateWeapon+1]=shopdata[i+1]
        PackageHandlers.sendClientHandler("buyItem",{
            profile={
              totalCoin=packet.packet.profile.totalCoin-shopdata[i+1].price*1,
              lv=packet.packet.profile.lv,
              exp=packet.packet.profile.exp
            },
            weapon={
              listWeapon=updateWeapon,
              selectWeapon=packet.packet.db.selectWeapon
            }
          })
      else
        print("Khong du tien")
      end
    end
  end
  
end