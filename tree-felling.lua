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
        direction = "south" then
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
        direction = "south" then
    elseif direction == "south" then
        direction = "west" 
    else
        direction = "north" 
    end
    turtle.turnRight()
end

function forward()
    if direction == "north" then 
        z++
    elseif direction = "south" then
        z--
    elseif direction = "east" then
        x++
    else 
        x--
    end
    turtle.forward()
end

function backward()
    if direction == "north" then 
        z--
    elseif direction = "south" then
        z++
    elseif direction = "east" then
        x--
    else 
        x++
    end
    turtle.backward()
end

function up()
    y++
    turtle.up()
end

function down()
    y--
    turtle.down()
end

function setDirection(directionF){
    while direction != directionF do
        turnLeft()
    end
}

function navigate(xF,yF,zF)
    -- navigate y 
    local yDis = yF - y;
    if yDis < 0 then
        for i=yDis,0,+1 do
            up()
        end
    else 
        for i=yDis,0,-1 do
            down()
        end
    end
    setDirection("north")
    -- navigate z
    local zDis = zF - z
    if zDis < 0 then
        for i=zDis,0,+1 do
            forward()
        end
    else 
        for i=zDis,0,-1 do
            backward()
        end
    end
    setDirection("east")
    -- navigate z
    local xDis = zF - z
    if xDis < 0 then
        for i=xDis,0,+1 do
            forward()
        end
    else 
        for i=xDis,0,-1 do
            backward()
        end
    end
end

navigate(1,0,1)