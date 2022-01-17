local shopdata={
  {
    name="Assault Sword",
    price="500",
    img="gameres|asset/Texture/Gui/AssaultSword.png",
    idItem="83049293-058c-4f13-ad0b-bd0642528227",
    i=0
  },
  {
    name="Eternal Boardsword",
    price="1000",
    img="gameres|asset/Texture/Gui/EternalBoardsword.png",
    idItem="6581d150-6719-4a3f-9783-ce669dee6261",
    i=1
  },
  {
    name="Awesome Axe",
    price="1500",
    img="gameres|asset/Texture/Gui/AwesomeAxe.png",
    idItem="25d5b5f5-09f3-4d9e-b2a1-aabe2ebfd1d0",
    i=2
  },
  {
    name="Green Talled Pickaxe",
    price="3000",
    img="gameres|asset/Texture/Gui/GreenTailedPickaxe.png",
    idItem="5029fb61-d4fe-428f-85e1-3413f909a014",
    i=3
  },
  {
    name="Battle Streamer Bow",
    price="2000",
    img="gameres|asset/Texture/Gui/BattleStreamerBow.png",
    idItem="95efae6b-1bcc-4567-bf42-1fbfd76dc277",
    i=4
  },
  {
    name="Battle Golden Bow",
    price="4000",
    img="gameres|asset/Texture/Gui/BattleGoldenBow.png",
    idItem="51628cca-71b9-4ad3-aeb3-8da9a933d8db",
    i=5
  },
}


function self:onOpen(packet)
    if (packet.packet.db)then
      if #packet.packet.db.listWeapon~=0 then
        for k,v in pairs(packet.packet.db.listWeapon) do
          local Image = UI:createStaticImage("bg"..v.i)
          Image:setProperty("Image", "gameres|asset/Texture/Gui/itembg.png")
          Image:setProperty("Size", "{{0,260},{0,220}}")
          self.Background.ScrollableView.GridView:addChild(Image:getWindow())
          local Image_Item = UI:createStaticImage("ItemImage")
          Image_Item:setProperty("Image", v.img)
          Image_Item:setProperty("Size", "{{0,96},{0,96}}")
          Image_Item:setProperty("Position", "{{0,65},{0,50}}")
          self.Background.ScrollableView.GridView:child("bg"..v.i):addChild(Image_Item:getWindow())
          local Button = UI:createButton('ItemButton')
          Button:setProperty("Text", v.name)
          Button:setArea2({0,30},{0,145},{0,220},{0,67})
          self.Background.ScrollableView.GridView:child("bg"..v.i):addChild(Button:getWindow())
        end
      end
    end


  self.CloseButton.onMouseClick=function()
    UI:closeWindow("main/balo")
  end
end