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
-- background image and starting scroll location (X axis)
local backgroundScroll = 0
local ground = love.graphics.newImage("ground.png")
-- ground image and starting scroll location (X axis)
local groundScroll = 0

-- speed at which we should scroll images,each frame by dt
local BACKGROUND_SCROLL_SPEED = 30
-- the ground will move twice as fast as the background
local GROUND_SCROLL_SPEED = 60

-- point at which we should loop our background back to X 0
local BACKGROUND_LOOPING_POINT = 413
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

function love.update(dt)
    -- scroll background by preset speed * dt, looping back to 0 after the looping point
    backgroundScroll = (backgroundScroll + BACKGROUND_SCROLL_SPEED * dt) % BACKGROUND_LOOPING_POINT;
    -- scroll ground by preset speed * dt, looping back to 0 after the screen width passes
    groundScroll = (groundScroll + GROUND_SCROLL_SPEED * dt) % VIRTUAL_WIDTH

end
-- this is love's render function which will draw in the push's specified resolution

function love.draw()
    push:start()
    -- draw the background at negative looping point having the effect of moving left to right
    love.graphics.draw(background, -backgroundScroll, 0)
    -- draw the ground on top of the background, toward the bottom of the screen,
    -- at its negative looping point
    love.graphics.draw(ground, -groundScroll, VIRTUAL_HEIGHT - 16)

    push:finish()
end
