woodSlot = 1
sapplingSlot = 2
boneSlot = 3
fuelSlot = 15

direction = "north"
x = 0
y = 0
z = 0

function reFuel()
    local fuelLevel = turtle.getFuelLevel()
    if fuelLevel < 100 then

    end
end

function turnLeft()
    if direction == "north" then
        direction = "west"
    elseif direction == "west" then
        direction = "south"
    elseif direction == "south" then
        direction = "east" 
    else
        direction = "north" 
    end
    turtle.turnLeft()
end

function turnRight()
    if direction == "north" then
        direction = "east"
    elseif direction == "east" then
        direction = "south" 
    elseif direction == "south" then
        direction = "west" 
    else
        direction = "north" 
    end
    turtle.turnRight()
end

function forward()
    if direction == "north" then 
        z = z + 1
    elseif direction == "south" then
        z = z - 1
    elseif direction == "east" then
        x = x + 1
    else 
        x = x - 1
    end
    turtle.forward()
end

function backward()
    if direction == "north" then 
        z = z - 1
    elseif direction == "south" then
        z = z + 1
    elseif direction == "east" then
        x = x - 1
    else 
        x = x + 1
    end
    turtle.back()
end

function up()
    y = y + 1
    turtle.up()
end

function down()
    y = y - 1
    turtle.down()
end

function setDirection(directionF)
    while direction ~= directionF do
        print("Turning to " .. directionF .. " currently " .. direction)
        turnLeft()
    end
end

function navigate(xF,yF,zF)
    -- navigate y 
    local yDis = yF - y;
    if yDis > 0 then
        print("Moving up " .. yDis)
        for i=yDis,1,-1 do
            up()
        end
    else 
        print("Moving down " .. yDis)
        for i=yDis,-1,1 do
            down()
        end
    end
    setDirection("north")
    -- navigate z
    local zDis = zF - z
    if zDis > 0 then
        print("Moving north " .. zDis)
        for i=zDis,1,-1 do
            print("Moving forward ")
            forward()
        end
    else 
        print("Moving south " .. zDis)
        for i=zDis,-1,1 do
            print("Moving backward ")
            backward()
        end
    end
    setDirection("east")
    -- navigate x
    local xDis = xF - x
    if xDis > 0 then
        print("Moving east " .. xDis)
        for i=xDis,1,-1 do
            print("Moving forward ")
            forward()
        end
    else 
        print("Moving west " .. xDis)
        for i=xDis,-1,1 do
            print("Moving backward ")
            backward()
        end
    end
end

