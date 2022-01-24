

function self:onOpen(packet)
    if (packet.packet.pet)then
      if #packet.packet.pet.listPet~=0 then
        for k,v in pairs(packet.packet.pet.listPet) do
          local Image = UI:createStaticImage("bg"..v.i)
          Image:setProperty("Image", "gameres|asset/Texture/Gui/itembg.png")
          Image:setProperty("Size", "{{0,260},{0,220}}")
          self.Background.ScrollableView.GridView:addChild(Image:getWindow())
          local Image_Item = UI:createStaticImage("ItemImage")
          Image_Item:setProperty("Image", v.img)
          Image_Item:setProperty("Size", "{{0,96},{0,96}}")
          Image_Item:setProperty("Position", "{{0,65},{0,50}}")
          self.Background.ScrollableView.GridView:child("bg"..v.i):addChild(Image_Item:getWindow())
          if (packet.packet.pet.selectPet.idItem==v.idItem)  then


                local Image_Item1 = UI:createStaticImage("ItemStatus")
                Image_Item1:setProperty("Image", "gameres|asset/Texture/Gui/equip1.png")
                Image_Item1:setProperty("Position", "{{0,30},{0,145}}")
                Image_Item1:setProperty("Size", "{{0,220},{0,67}}")
                self.Background.ScrollableView.GridView:child("bg"..v.i):addChild(Image_Item1:getWindow())


          else
            local Button = UI:createButton('ItemButton')
            Button:setProperty("NormalImage", "")
            Button:setProperty("Text", v.name)
            Button:setArea2({0,30},{0,145},{0,220},{0,67})
            self.Background.ScrollableView.GridView:child("bg"..v.i):addChild(Button:getWindow())
            self.Background.ScrollableView.GridView:child("bg"..v.i).ItemButton.onMouseClick=function()
     
            packet.packet.pet.selectPet=v
              PackageHandlers.sendClientHandler("updatePet",{pet=packet.packet.pet})
            end
          end
        end
      end
    end


  self.Background.CloseButton.onMouseClick=function()
    UI:closeWindow("main/petHouse")
  end
end