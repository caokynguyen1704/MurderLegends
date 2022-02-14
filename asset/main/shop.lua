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
  {
    name="Claw Sword",
    price="2000",
    img="gameres|asset/Texture/Gui/ClawSword.png",
    idItem="4e9cab19-8b46-428e-a558-9ead97d176bc",
    i=6,
    type="knife",
  },
  {
    name="Arc Double Axe",
    price="2500",
    img="gameres|asset/Texture/Gui/ArcDoubleAxe.png",
    idItem="6ff5fe29-ef8d-4d81-9a91-71d1c0df4c95",
    i=7,
    type="knife",
  },
  {
    name="Blue Diamon Mallet",
    price="3000",
    img="gameres|asset/Texture/Gui/BlueDiamonMallet.png",
    idItem="30d0609f-9cce-4dad-ad39-27719c8d7c76",
    i=8,
    type="knife",
  },
  {
    name="Mediocre Hammer",
    price="4000",
    img="gameres|asset/Texture/Gui/MediocreHammer.png",
    idItem="a408e5ef-e611-4251-84dc-0e28fb01ca4e",
    i=9,
    type="knife",
  },
  {
    name="Explosive Cyclone",
    price="5000",
    img="gameres|asset/Texture/Gui/ExplosiveCyclone.png",
    idItem="da643e61-fafe-42fa-8169-657abf6a2916",
    i=10,
    type="gun",
  },
  {
    name="Plasma Rail Gun",
    price="7000",
    img="gameres|asset/Texture/Gui/PlasmaRailGun.png",
    idItem="7e1b374d-23c0-4d94-8a0e-3210fbd0bc4f",
    i=11,
    type="gun",
  },
  {
    name="Gatling",
    price="10000",
    img="gameres|asset/Texture/Gui/Gatling.png",
    idItem="dc5d8da1-5051-45cf-828b-ac6634d6080a",
    i=12,
    type="gun",
  },
  {
    name="King Sword",
    price="5000",
    img="gameres|asset/Texture/Gui/KingSword.png",
    idItem="1067b21d-6877-434c-bb21-bedad9e99950",
    i=13,
    type="knife",
  },
  {
    name="Flying Sword",
    price="7000",
    img="gameres|asset/Texture/Gui/FlyingSword.png",
    idItem="1672f552-f336-4c6d-80de-d95cc73f489c",
    i=14,
    type="knife",
  },
}


function self:onOpen(packet)
  if (packet.packet.db)then
    if #packet.packet.db.listWeapon==0 then
      for i=0,14 do
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
  self.Background.CoinCount:setText(math.floor(packet.packet.profile.totalCoin))
  for i=0,14 do
    self.Background.ScrollableView.GridView:child("ItemBackground"..i).ItemButton.onMouseClick=function()
      if packet.packet.profile.totalCoin>=shopdata[i+1].price*1 then
        local updateWeapon=packet.packet.db.listWeapon
        updateWeapon[#updateWeapon+1]=shopdata[i+1]
        local selectWP=packet.packet.db.selectWeapon
        if shopdata[i+1].type=="knife" then
          selectWP.murder=shopdata[i+1]
        else
          selectWP.sheriff=shopdata[i+1]
        end
        PackageHandlers.sendClientHandler("buyItem",{
            profile={
              totalCoin=math.floor(packet.packet.profile.totalCoin-shopdata[i+1].price*1),
              lv=packet.packet.profile.lv,
              exp=packet.packet.profile.exp
            },
            weapon={
              listWeapon=updateWeapon,
              selectWeapon=selectWP
            }
          })
      else
        print("Khong du tien")
      end
    end
  end
  
end