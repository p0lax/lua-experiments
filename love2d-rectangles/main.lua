local initTime
local w, h = 50, 50
local gameWidth, gameHeight
local isGrowPhase = true
local coords = {}

local function createRectCoords()
  local COORD_START = 60;
  for i = 1, 10 do
    local x = i*COORD_START
    local y = math.random(COORD_START)
    coords[i] = { x = x, y = y }
  end
end

local function printTable(table, space)
  space = space == nil and '' or space
  for k, v in pairs(table) do
    print(space .. 'key: ' .. k)
    if (type(v) == "table") then
      print(space .. 'value: table')
      printTable(v, space .. '  ')
    elseif (v ~= nil) then
      print(space .. 'value: ' .. v)
    end
  end
end

function love.load()
  initTime = love.timer.getTime()
  gameWidth = love.graphics.getWidth()
  gameHeight = love.graphics.getHeight()
  createRectCoords()
  printTable(coords)
end

function love.update(dt) 
  local newTime = love.timer.getTime()
  if (gameWidth < w or gameHeight < h) then
    isGrowPhase = false
  end
  if (isGrowPhase) then
    w = w + 0
    h = h + 0
  else
    w = w - 1
    h = h - 1
  end
end

function love.draw()
  love.graphics.setBackgroundColor(17, 85, 200, 100)
  for i = 1, 10 do
    love.graphics.setColor(255, 255, 255)
    love.graphics.rectangle('fill', coords[i].x, coords[i].y, w, h)
  end
end