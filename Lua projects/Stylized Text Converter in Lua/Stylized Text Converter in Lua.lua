-- Stylized Text Converter in Lua

local normalText = "Hello, World!"

function stylizeText(text)
    local stylizedText = ""

    for i = 1, #text do
        local char = string.sub(text, i, i)
        local stylizedChar = stylizeCharacter(char)
        stylizedText = stylizedText .. stylizedChar
    end

    return stylizedText
end

function stylizeCharacter(char)
    local stylizedChar = char

    -- Define stylized characters or transformations
    local stylizedChars = {
        a = "𝓪", b = "𝓫", c = "𝓬", d = "𝓭", e = "𝓮",
        f = "𝓯", g = "𝓰", h = "𝓱", i = "𝓲", j = "𝓳",
        k = "𝓴", l = "𝓵", m = "𝓶", n = "𝓷", o = "𝓸",
        p = "𝓹", q = "𝓺", r = "𝓻", s = "𝓼", t = "𝓽",
        u = "𝓾", v = "𝓿", w = "𝔀", x = "𝔁", y = "𝔂",
        z = "𝔃",
        ["A"] = "𝓐", ["B"] = "𝓑", ["C"] = "𝓒", ["D"] = "𝓓", ["E"] = "𝓔",
["F"] = "𝓕", ["G"] = "𝓖", ["H"] = "𝓗", ["I"] = "𝓘", ["J"] = "𝓙",
["K"] = "𝓚", ["L"] = "𝓛", ["M"] = "𝓜", ["N"] = "𝓝", ["O"] = "𝓞",
["P"] = "𝓟", ["Q"] = "𝓠", ["R"] = "𝓡", ["S"] = "𝓢", ["T"] = "𝓣",
["U"] = "𝓤", ["V"] = "𝓥", ["W"] = "𝓦", ["X"] = "𝓧", ["Y"] = "𝓨",
["Z"] = "𝓩",
["0"] = "𝓪", ["1"] = "𝓫", ["2"] = "𝓬", ["3"] = "𝓭", ["4"] = "𝓮",
["5"] = "𝓯", ["6"] = "𝓰", ["7"] = "𝓱", ["8"] = "𝓲", ["9"] = "𝓳",
["@"] = "＠", ["#"] = "＃", ["$"] = "＄", ["%"] = "％", ["&"] = "＆",
        [" "] = " ", -- Keep spaces as they are
        ["!"] = "❗", ["?"] = "❓", [","] = "，", ["."] = "。",
    }

    -- Check if the character has a stylized version
    if stylizedChars[char:lower()] then
        stylizedChar = stylizedChars[char:lower()]

        -- Preserve the case of the original character
        if char:match("%u") then
            stylizedChar = stylizedChar:upper()
        end
    end

    return stylizedChar
end

local stylizedText = stylizeText(normalText)
print(stylizedText)
