-- Code with everything based on player
player = require("player")

-- Load a font
font = love.graphics.newFont("assets/m5x7.ttf", 40)
function love.load()
    -- Set a window title
    love.window.setTitle("doterite prototype")
    
    -- The state of the game which determines what to display
    state = "menu"

    -- Actually load the font in the game
    love.graphics.setFont(font)


    -- Make assets less blurry and higher quality
    love.graphics.setDefaultFilter("nearest", "nearest")
	-- And load them in

	-- These are for the main menu
    textlogo = love.graphics.newImage("assets/images/textlogo.png")
    earth = love.graphics.newImage("assets/images/earth.png")
    -- Set background color
    love.graphics.setBackgroundColor(0, 0, 0.1)
end

function love.draw()
    -- Main Menu
    if state == "menu" then
        love.graphics.draw(textlogo, 120, 50, 0, 12, 12)
        love.graphics.draw(earth, -220, 260, 0, 18, 18)
        love.graphics.print("Press \"Enter\" to start!", 260, 300)
    elseif state == "game" then
        -- Draws the player's character
        player.draw()
        love.graphics.print("FPS: "..tostring(love.timer.getFPS()))
    else
        -- Make a simple pause menu
        love.graphics.print("Paused!", 260, 300)
    end
end

function love.update(dt)
    -- Updates the player ONLY if the game state is "game" (to play)

    if state == "game" then
        player.update(dt)
    end
end

function love.keypressed(key)
    -- Menu keys

    -- Main Menu
    if key == "return" then state = "game" end

    -- Already ingame
    if key == "escape" then state = "pause_menu" end

    -- Anytime
    if key == "e" then love.event.quit() end
end
