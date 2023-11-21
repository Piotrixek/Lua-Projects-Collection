-- Space Travel Animation with Emojis

-- Define the variables
local spaceship = { x = 40, y = 12 }
local stars = {}
local planets = {}
local screenWidth = 80
local screenHeight = 20
local speed = 0.1

-- Initialize stars and planets
for i = 1, 30 do
    table.insert(stars, { x = math.random(1, screenWidth), y = math.random(1, screenHeight) })
    table.insert(planets, { x = math.random(1, screenWidth), y = math.random(1, screenHeight), size = math.random(1, 3) })
end

function updateSpace()
    -- Update spaceship position
    spaceship.x = spaceship.x + speed

    -- Update star positions
    for _, star in ipairs(stars) do
        star.x = star.x - speed * 0.5

        -- Respawn star if it goes off the screen
        if star.x < 1 then
            star.x = screenWidth
            star.y = math.random(1, screenHeight)
        end
    end

    -- Update planet positions
    for _, planet in ipairs(planets) do
        planet.x = planet.x - speed * 0.3

        -- Respawn planet if it goes off the screen
        if planet.x < 1 then
            planet.x = screenWidth
            planet.y = math.random(1, screenHeight)
        end
    end
end

function drawSpace()
    local space = {}

    -- Initialize space with empty spaces
    for _ = 1, screenHeight do
        space[_] = string.rep(" ", screenWidth)
    end

    -- Draw stars
    for _, star in ipairs(stars) do
        local starChar = "✨"
        space[math.floor(star.y)] = space[math.floor(star.y)]:sub(1, math.floor(star.x) - 1) ..
                                    starChar .. space[math.floor(star.y)]:sub(math.floor(star.x) + 1)
    end

    -- Draw planets
    for _, planet in ipairs(planets) do
        local planetChar = "🪐"
        space[math.floor(planet.y)] = space[math.floor(planet.y)]:sub(1, math.floor(planet.x) - 1) ..
                                      planetChar .. space[math.floor(planet.y)]:sub(math.floor(planet.x) + 1)
    end

    -- Draw spaceship
    local spaceshipChar = "🚀"
    space[math.floor(spaceship.y)] = space[math.floor(spaceship.y)]:sub(1, math.floor(spaceship.x) - 1) ..
                                      spaceshipChar .. space[math.floor(spaceship.y)]:sub(math.floor(spaceship.x) + 1)

    -- Print the entire space
    print(table.concat(space, "\n"))
end

-- Main loop
for frame = 1, 100 do
    os.execute("clear")  -- Use "cls" for Windows
    updateSpace()
    drawSpace()
    os.execute("sleep 0.1")  -- Adjust sleep time for your system
end
