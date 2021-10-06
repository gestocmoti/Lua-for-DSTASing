local function Fn()
local speed
local base = 0x021E69E0
local flower = 0
local time
local X
local Y
local Z
local RNG1
local RNG2
local re

X = memory.readdwordsigned(0x0213C8D4)
Y = memory.readdwordsigned(0x0213C8D8)
Z = memory.readdwordsigned(0x0213C8DC)
time =1152647168 - memory.readdword(0x02383CE8)
RNG1 = memory.readdwordsigned(0x02141000)
RNG2 = memory.readdwordsigned(0x02141004)
re = movie.rerecordcount() 

for i = 0, 48 do
    flower = flower + memory.readword(base + i * 2 + math.floor(i / 7) * 4)
end

speed = memory.readdword(0x023871CC)

gui.text(0,0,"flower: " .. flower)
gui.text(0,10,"Time: "..time)
gui.text(0,20,"Speed: "..speed)
gui.text(0,30,"X: "..X)
gui.text(0,40,"Y: "..Y)
gui.text(0,50,"Z: "..Z)
gui.text(0,60,"RNG1: "..RNG1)
gui.text(0,70,"RNG2: "..RNG2)
gui.text(165,-10,"Rerecord: "..re)

end
gui.register(Fn)