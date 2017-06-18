local MOUSE_LEFT_BUTTON = 1
local w, h = 50, 50
local gameWidth, gameHeight
local isGrowPhase = true
local coords = {}
local angle = 0
-- Objects
local cursor
local card

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
  gameWidth = love.graphics.getWidth()
  gameHeight = love.graphics.getHeight()
  createRectCoords()

  card = love.graphics.newImage("card.png")
  cursor = love.mouse.newCursor("cursor.png", 0, 0)
  love.mouse.setCursor(cursor)
  -- printTable(coords)
end

function inRectangle()

end

function love.mousepressed(x, y, button)
  if button == MOUSE_LEFT_BUTTON then
    angle = angle + 90
  end
end

function love.update(dt) 
  -- if (gameWidth < w or gameHeight < h) then
  --   isGrowPhase = false
  -- end
  -- if (isGrowPhase) then
  --   h = h + 2
  -- else
  --   h = h - 2
  -- end
end

function love.draw()
  love.graphics.setBackgroundColor(17, 85, 200, 100)
  for i = 1, 10 do
    love.graphics.setColor(255, 255, 255)
    love.graphics.rectangle('fill', coords[i].x, coords[i].y, w, h)
  end

  love.graphics.draw(card, 300, 300, math.rad(angle), 0.1, 0.1, card:getWidth()/2, card:getHeight()/2)
end