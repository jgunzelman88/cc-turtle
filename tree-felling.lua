os.loadAPI("./common")
WOOD_SLOT = 1
SAPPLING_SLOT = 2
BONE_SLOT = 3

sX = 0
if arg[1] then sX = tonumber(arg[1]) end
sY = 0
if arg[2] then sY = tonumber(arg[2]) end
sZ = 0
if arg[3] then sZ = tonumber(arg[3]) end

print("Starting zone " .. sX .. ", " .. sY .. ", " .. sZ)
function chopDownTree()
    turtle.select(WOOD_SLOT)
    print()
    if turtle.compare() and turtle.inspect() then
        print("Chopping tree")
        turtle.dig()
        common.forward()
        while turtle.compareUp()  do
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
        common.navigate(sX,sY,sZ)
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
    common.navigate(sX,sY,sZ)
    common.setDirection("south")
    for i=4,15,1 do 
        turtle.select(i)
        turtle.drop()
    end
end

function placeSappling()
    common.navigate(sX,sY,sZ)
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
    common.navigate(sX-1,sY,sZ)
    common.setDirection("south")
    turtle.select(BONE_SLOT)
    space = turtle.getItemSpace()
    turtle.suck(space)
    
end

-- Begin --
common.gpsInit()
common.navigate(sX, sY, sZ)
common.setDirection("north")
common.reFuel()
chopDownTree()
cleanUp()
getBoneMeal()
placeSappling()