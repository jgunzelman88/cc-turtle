require "common"
woodSlot = 1
sapplingSlot = 2
fuelSlot = 16

function chopDownTree()
    turtle.select(woodSlot)
    if turtle.compare() then
        print("Chopping tree")
        turtle.dig()
        common.forward()
        while turtle.compareUp() do
            turtle.digUp()
            up()
        end
        common.navigate(0,0,0)
        common.setDirection("south")
        local logs = turtle.getItemCount(woodSlot) - 1
        turtle.drop(logs)
    else
        print("No tree or no log found")
    end
end

function cleanUp()
    setDirection("west")
    turtle.suck()
    common.forward()
    turtle.suck()
    common.turnRight()
    turtle.suck()
    common.forward()
    turtle.suck()
    common.forward()
    turtle.suck()
    common.turnRight()
    turtle.suck()
    common.forward()
    turtle.suck()
    common.forward()
    turtle.suck()
    common.turnRight()
    turtle.suck()
    common.forward()
    turtle.suck()
    common.forward()
    common.navigate(0,0,0)
    common.setDirection("south")
    for i=3,15,1 do 
        turtle.select(i)
        turtle.drop()
    end
end

function placeSappling()
    common.setDirection("north")
    turtle.select(sapplingSlot)
    turtle.place()
end
-- Begin --

while true do
    chopDownTree()
    cleanUp()
    placeSappling()
    reFuel()
end
-- 