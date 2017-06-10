local MAX_COLOR_VALUE = 255;
local r, g, b, initTime

local function getNewColor()
  local r = math.random(MAX_COLOR_VALUE);
  local g = math.random(MAX_COLOR_VALUE);
  local b = math.random(MAX_COLOR_VALUE);
  return r, g, b
end

function love.load()
  initTime = love.timer.getTime()
  r, g, b = getNewColor()
end

function love.update(dt) 
  local newTime = love.timer.getTime();
  print('DELTA:'..initTime - newTime)
  if (newTime - initTime > 2) then
    initTime = newTime
    r, g, b = getNewColor()
  end
end

function love.draw()
    love.graphics.setBackgroundColor(r, g, b, 100)
    love.graphics.printf("My text is " .. r .. ' ' .. b .. ' ' .. g, 0, 400, 800, 'center')
end