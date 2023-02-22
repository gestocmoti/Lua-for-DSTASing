local function Fn()
local speed,time
local base = 0x021E69E0
local flower = 0
local h = 0
local m = 0
local s = 0
local X,Y,Z
local igt
local RNG1,RNG2
local re
local debug
local w,hw,max
local wf,hwf,maxf
local ss,e,f
local happy
local pg

X = memory.readdwordsigned(0x0213C8D4)
Y = memory.readdwordsigned(0x0213C8D8)
Z = memory.readdwordsigned(0x0213C8DC)
time =1152647168 - memory.readdword(0x02383CE8)
igt = memory.readdword(0x02383CE8) - 1135869952
RNG1 = memory.readdwordsigned(0x02141000)
RNG2 = memory.readdwordsigned(0x02141004)
w = memory.readdword(0x02383CD4)
hw = memory.readdword(0x02383CD8)
happy = memory.readdword(0x02383CD0)
max = memory.readdword(0x02383CDC)

re = movie.rerecordcount() 

RNG1 = bit.tohex(RNG1)
RNG2 = bit.tohex(RNG2)

ss = (-1)^bit.arshift(w, 31)
e = bit.band(bit.arshift(w, 23),0xFF) - 127
f = 1 + bit.band(w, 0x7FFFFF) / 8388608
wf = ss * f * 2^e

ss = (-1)^bit.arshift(hw, 31)
e = bit.band(bit.arshift(hw, 23),0xFF) - 127
f = 1 + bit.band(hw, 0x7FFFFF) / 8388608
hwf = ss * f * 2^e

ss = (-1)^bit.arshift(max, 31)
e = bit.band(bit.arshift(max, 23),0xFF) - 127
f = 1 + bit.band(max, 0x7FFFFF) / 8388608
maxf = ss * f * 2^e

hwf = math.floor(hwf)

pg = hwf + happy * 20

for i = 0, 48 do
    flower = flower + memory.readword(base + i * 2 + math.floor(i / 7) * 4)
end

speed = memory.readdword(0x023871CC)

if igt < 4980736 then
	igt = igt / 65536.0 * 2
elseif igt < 13369344 then
	igt = igt - 4980736
	igt = igt / 32768.0 * 2 + 152
else
	igt = igt - 13369344
	igt = igt / 16384.0 * 2 + 664
end


h = 6 + math.floor(igt / 60)
m = math.floor(igt % 60)
s = math.floor(igt * 60 % 60)


gui.text(0,0,"flower: " .. flower)
gui.text(0,10,"Speed: "..speed)
gui.text(0,20,"X: "..X)
gui.text(0,30,"Y: "..Y)
gui.text(0,40,"Z: "..Z)
gui.text(0,50,"RNG1: "..RNG1)
gui.text(0,60,"RNG2: "..RNG2)
gui.text(0,70,string.format("house: %05d",hwf))
gui.text(0,80,string.format("after PG: %05d",pg))
gui.text(165,-10,"Rerecord: "..re)
gui.text(0,-190,string.format("%02d:%02d:%02d",h,m,s))
gui.text(205,-192,string.format("%07.3f",wf))


if pg%1000 - maxf + wf < 0 then
gui.text(0,-10,string.format("!Warning! PG too low"))
end

end
gui.register(Fn)
