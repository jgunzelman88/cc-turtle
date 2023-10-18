os.loadAPI("./common")
WOOD_SLOT = 1
SAPPLING_SLOT = 2

function chopDownTree()
    turtle.select(WOOD_SLOT)
    if turtle.compare() then
        print("Chopping tree")
        turtle.dig()
        common.forward()
        while turtle.compareUp() do
            turtle.digUp()
            common.up()
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
    for i=3,15,1 do 
        turtle.select(i)
        turtle.drop()
    end
end

function placeSappling()
    common.setDirection("north")
    turtle.select(SAPPLING_SLOT)
    turtle.place()
end

function fellTree()
    chopDownTree()
    cleanUp()
    placeSappling()
    common.reFuel()
end

-- Begin --
local myTimer = os.startTimer(60)
while true do
    local event, timerID = os.pullEvent("timer")
    if timerID == myTimer then 
        fellTree()
    end
end
-- 
