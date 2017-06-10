local initTime
local w, h = 100, 50
local gameWidth, gameHeight

function love.load()
  initTime = love.timer.getTime()
  gameWidth = love.graphics.getWidth()
  gameHeight = love.graphics.getHeight()
end

function love.update(dt) 
  local newTime = love.timer.getTime()
  print(gameWidth, w)
  w = (gameWidth > w and w + 1 or w - 1)
  h = (gameHeight > h and h + 1 or h - 1)
end

function love.draw()
    love.graphics.setBackgroundColor(17, 85, 200, 100)
    love.graphics.setColor(255, 255, 255)
    love.graphics.rectangle('fill', 20, 20, w, h)
end