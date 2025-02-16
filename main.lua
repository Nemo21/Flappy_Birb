-- Nothing new getting push library for virtual resolution
push = require 'push'

-- Actual resolution
WINDOW_HEIGHT = 720
WINDOW_WIDTH = 1280

-- In what resolution love will render(16:9)
VIRTUAL_HEIGHT = 288
VIRTUAL_WIDTH = 512

-- cant be accessed outside the file
-- Loads an image from a graphics file from disk
-- Storing it in an object we can draw to the setupScreen
-- now they are considered "drawable" by love.draw()
local background = love.graphics.newImage("background.png")
local ground = love.graphics.newImage("ground.png")

-- Nothing new called at the start of program execution
function love.load()
    -- clear and retro 
    love.graphics.setDefaultFilter("nearest", "nearest")

    love.window.setTitle("Flappy Bird")

    -- setup of screen for virtual resolution
    push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
        vsync = true,
        fullscreen = false,
        resizable = true
    })
end

-- Resize the window given by push
function love.resize(w, h)
    push:resize(w, h)
end

-- to lazy to Ctrl+C just q it
function love.keypressed(key)
    if key == "escape" then
        love.event.quit()
    end
end

-- this is love's render function which will draw in the push's specified resolution

function love.draw()
    push:start()

    love.graphics.draw(background, 0, 0)
    love.graphics.draw(ground, 0, VIRTUAL_HEIGHT - 16)

    push:finish()
end
