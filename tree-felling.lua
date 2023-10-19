os.loadAPI("./common")
WOOD_SLOT = 1
SAPPLING_SLOT = 2
BONE_SLOT = 3

function chopDownTree()
    turtle.select(WOOD_SLOT)
    if turtle.compare() then
        print("Chopping tree")
        turtle.dig()
        common.forward()
        while turtle.compareUp() do
            turtle.digUp()
            common.up()
            turtle.dig()
            common.turnLeft()
            turtle.dig()
            common.turnLeft()
            turtle.dig()
            common.turnLeft()
            turtle.dig()
        end
        common.navigate(0,0,0)
        common.setDirection("south")
        local logs = turtle.getItemCount(WOOD_SLOT) - 1
        turtle.drop(logs)
    else
        print("No tree or no log found")
    end
end

function cleanUp()
    common.setDirection("west")
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
    for i=4,15,1 do 
        turtle.select(i)
        turtle.drop()
    end
end

function placeSappling()
    common.navigate(0,0,0)
    common.setDirection("north")
    turtle.select(SAPPLING_SLOT)
    turtle.place()
    turtle.select(BONE_SLOT)
    local notGrown = turtle.place()
    while notGrown do
        notGrown = turtle.place()
    end

end

function getBoneMeal()
    common.navigate(-1,0,0)
    common.setDirection("south")
    turtle.select(BONE_SLOT)
    space = turtle.getItemSpace()
    turtle.suck(space)
    
end

-- Begin --
common.reFuel()
chopDownTree()
cleanUp()
getBoneMeal()
placeSappling()