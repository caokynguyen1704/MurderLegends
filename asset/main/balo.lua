

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
          if (packet.packet.db.selectWeapon.murder.idItem==v.idItem) or packet.packet.db.selectWeapon.sheriff.idItem==v.idItem then


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
              local weapon=nil
              if v.type=="gun" then
                packet.packet.db.selectWeapon.sheriff=v
              else
                packet.packet.db.selectWeapon.murder=v
              end
              PackageHandlers.sendClientHandler("updateEquip",{weapon=packet.packet.db})
            end
          end
        end
      end
    end


  self.CloseButton.onMouseClick=function()
    UI:closeWindow("main/balo")
  end
end