os.loadAPI("common")

WIDTH =  4 --tonumber(arg[1])
LENGTH = 10 -- tonumber(arg[2])

CROP_SLOT = 1
SEED_SLOT = 2

function farm()
  for i=0,WIDTH-1,1 do
    for j=0,LENGTH-2,1 do
      common.forward()
      pickAndPlant()
    end
    if i % 2 == 0 then
      common.turnRight()
      common.forward()
      common.turnRight()
    else
      common.turnLeft()
      common.forward()
      common.turnLeft()
    end
  end
end

function pickAndPlant()
  success, data = turtle.inspectDown()
  
  if success and data.state.age == 7 then
    turtle.select(CROP_SLOT)
    turtle.digDown()
    turtle.select(SEED_SLOT)
    turtle.placeDown()
  end
end

function cleanUp()
  common.navigate(3,0,0)
  for i=3,15,1 do 
    turtle.select(i)
    turtle.dropDown()
  end
end

function dropCrops() 
  common.navigate(0,0,0)
  turtle.select(CROP_SLOT)
  ejectCount = turtle.getItemCount() - 1
  turtle.dropDown(ejectCount)
end

print("Farming " .. WIDTH .. " x " .. LENGTH .. " plot")
common.reFuel()
farm()
cleanUp()
dropCrops()
common.navigate(0,0,0)
common.setDirection("north")