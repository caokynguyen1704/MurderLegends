local shopdata={
  {
    name="Assault Sword",
    price="10",
    idItem="83049293-058c-4f13-ad0b-bd0642528227",
    i=0
  },
  {
    name="Eternal Boardsword",
    price="1000",
    idItem="6581d150-6719-4a3f-9783-ce669dee6261",
    i=1
  },
  {
    name="Awesome Axe",
    price="1500",
    idItem="25d5b5f5-09f3-4d9e-b2a1-aabe2ebfd1d0",
    i=2
  },
  {
    name="Green Talled Pickaxe",
    price="3000",
    idItem="5029fb61-d4fe-428f-85e1-3413f909a014",
    i=3
  },
  {
    name="Battle Streamer Bow",
    price="2000",
    idItem="95efae6b-1bcc-4567-bf42-1fbfd76dc277",
    i=4
  },
  {
    name="Battle Golden Bow",
    price="4000",
    idItem="51628cca-71b9-4ad3-aeb3-8da9a933d8db",
    i=5
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
          if(vv.idItem==v) then
            self.Background.ScrollableView.GridView:child("ItemBackground"..vv.i).SoidOut:setVisible(true)
            self.Background.ScrollableView.GridView:child("ItemBackground"..vv.i).ItemButton:setVisible(false)
            break
          end
        end
      end
    end
  end
  self.CloseButton.onMouseClick=function()
    UI:closeWindow("main/shop")
  end
  self.Background.CoinCount:setText(packet.packet.profile.totalCoin)
  for i=0,5 do
    self.Background.ScrollableView.GridView:child("ItemBackground"..i).ItemButton.onMouseClick=function()
      if packet.packet.profile.totalCoin>=shopdata[i+1].price*1 then
        local updateWeapon=packet.packet.db.listWeapon
        updateWeapon[#updateWeapon+1]=shopdata[i+1].idItem
        PackageHandlers.sendClientHandler("buyItem",{
            profile={
              totalCoin=packet.packet.profile.totalCoin-shopdata[i+1].price*1,
              lv=packet.packet.profile.lv,
              exp=packet.packet.profile.exp
            },
            weapon={
              listWeapon=updateWeapon,
              selectWeapon={sheriff=nil,murder=nil}
            }
          })
      else
        print("Khong du tien")
      end
    end
  end
  
end