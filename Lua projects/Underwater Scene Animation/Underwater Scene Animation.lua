-- Underwater Scene Animation in the Console

local screenWidth = 80
local screenHeight = 20
local fish = {}
local seaweed = {}
local bubbles = {}
local framesPerSecond = 10

-- Function to create a fish
function createFish()
    local fish = {
        x = screenWidth,
        y = math.random(1, screenHeight),
        char = ">",
        color = 34, -- ANSI escape code for green color
        vx = -0.1
    }
    table.insert(fish, fish)
end

-- Function to create seaweed
function createSeaweed()
    local seaweed = {
        x = math.random(1, screenWidth),
        y = math.random(10, screenHeight),
        height = math.random(3, 10),
        char = "W",
        color = 32 -- ANSI escape code for green color
    }
    table.insert(seaweed, seaweed)
end

-- Function to create bubbles
function createBubbles()
    local bubble = {
        x = math.random(1, screenWidth),
        y = screenHeight,
        char = "o",
        color = 37 -- ANSI escape code for white color
    }
    table.insert(bubbles, bubble)
end

-- Function to update the underwater scene
function updateUnderwater()
    for _, fish in ipairs(fish) do
        fish.x = fish.x + fish.vx

        -- Respawn fish if it goes off the screen
        if fish.x < 1 then
            fish.x = screenWidth
            fish.y = math.random(1, screenHeight)
        end
    end

    for _, bubble in ipairs(bubbles) do
        bubble.y = bubble.y - 1

        -- Respawn bubble if it goes off the screen
        if bubble.y < 1 then
            bubble.y = screenHeight
            bubble.x = math.random(1, screenWidth)
        end
    end
end

-- Function to draw the underwater scene
function drawUnderwater()
    local space = {}

    for _ = 1, screenHeight do
        space[_] = string.rep(" ", screenWidth)
    end

    for _, fish in ipairs(fish) do
        local x, y = math.floor(fish.x), math.floor(fish.y)
        if x >= 1 and x <= screenWidth and y >= 1 and y <= screenHeight then
            space[y] = space[y]:sub(1, x - 1) ..
                       "\27[" .. fish.color .. "m" .. fish.char .. "\27[0m" ..
                       space[y]:sub(x + 1)
        end
    end

    for _, seaweed in ipairs(seaweed) do
        for i = 1, seaweed.height do
            local x, y = math.floor(seaweed.x), math.floor(seaweed.y + i - 1)
            if x >= 1 and x <= screenWidth and y >= 1 and y <= screenHeight then
                space[y] = space[y]:sub(1, x - 1) ..
                           "\27[" .. seaweed.color .. "m" .. seaweed.char .. "\27[0m" ..
                           space[y]:sub(x + 1)
            end
        end
    end

    for _, bubble in ipairs(bubbles) do
        local x, y = math.floor(bubble.x), math.floor(bubble.y)
        if x >= 1 and x <= screenWidth and y >= 1 and y <= screenHeight then
            space[y] = space[y]:sub(1, x - 1) ..
                       "\27[" .. bubble.color .. "m" .. bubble.char .. "\27[0m" ..
                       space[y]:sub(x + 1)
        end
    end

    print(table.concat(space, "\n"))
end

-- Main loop
for frame = 1, 100 do
    os.execute("clear")  -- Use "cls" for Windows

    if frame % (framesPerSecond * 2) == 0 then
        createFish()
        createSeaweed()
        createBubbles()
    end

    updateUnderwater()
    drawUnderwater()

    os.execute("sleep 0.1")  -- Adjust sleep time for your system
end
