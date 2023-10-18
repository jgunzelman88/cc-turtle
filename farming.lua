os.loadAPI("common")

WIDTH = tonumber(arg[1])
LENGTH = tonumber(arg[2])

CROP_SLOT = 1
SEED_SLOT = 2


function farm()
  for i=0,WIDTH-1,1 do
    for i=0,LENGTH-1,1 do
      common.forward()
      success, data = turtle.inspectDown()
      if success and data.state.age == 7 then
        turtle.select(CROP_SLOT)
        turtle.digDown()
        turtle.select(SEED_SLOT)
      end
      
    end
  end
end