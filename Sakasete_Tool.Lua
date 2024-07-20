local function convf(addr)
    local n,s,e,f = 0
    
    n = memory.readdword(addr)
    s = (-1)^bit.arshift(n,31)
    e = bit.band(bit.arshift(n,23),0xFF) - 127
    f = 1 + bit.band(n, 0x7FFFFF) / 0x800000
    return s*f*2^e
    
end

local function Fn()
local speed,time
local base = 0x021E69E0
local flower = 0
local h,m,s = 0,0,0
local X,Y,Z
local igt
local RNG1,RNG2
local re
local happy
local plot,table
local byc,byc_t
local flower_p
local map
local offset,baseAdr

X = memory.readdwordsigned(0x0213C8D4)
Y = memory.readdwordsigned(0x0213C8D8)
Z = memory.readdwordsigned(0x0213C8DC)
time =1152647168 - memory.readdword(0x02383CE8)
igt = memory.readdword(0x02383CE8) - 1135869952
RNG1 = bit.tohex(memory.readdwordsigned(0x02141000))
RNG2 = bit.tohex(memory.readdwordsigned(0x02141004))
w = convf(0x02383CD4)
hw = convf(0x02383CD8)
happy = memory.readdword(0x02383CD0)
max = math.floor(convf(memory.readdword(0x02383CDC)))
fT = memory.readdword(0x023879FC) / 0x1000
map = memory.readword(0x0211EAD0)
baseAdr = 0x021E69E0
offset = 0
plot ="Undefined"
flower_p = 0
byc = convf(0x02383CEC)
re = movie.rerecordcount() 
speed = memory.readdword(0x023871CC)

byc_t = 360.067993 - byc

pg = hw + happy * 20

for i = 0, 48 do
    flower = flower + memory.readword(base + i * 2 + math.floor(i / 7) * 4)
end

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

if X < 0 then
	Xf = math.floor(math.ceil(X/0xC8000) / 2)
else
	Xf = math.ceil(math.floor(X/0xC8000) / 2)
end 

if Z < 0 then
	Zf = math.floor(math.ceil(Z/0xC8000) / 2)
else
	Zf = math.ceil(math.floor(Z/0xC8000) / 2)
end 

if map == 0x3C then
	if Xf <= 3 and Xf >= -3 and Zf <= 3 and Zf >=-3 then
		table = { "A", "B", "C", "D", "E", "F", "G"}
		plot = table[Zf + 4] .. (Xf + 4)
		offset = (Xf+3) * 2 + (Zf + 3) * 0x12
	else
		flower_p  = -100	
	end
else
	flower_p  = -100
end



if flower_p ~= -100 then
flower_p = memory.readword(baseAdr + offset)
gui.text(0,-10,string.format("Plot:%-9s Flower:%02d",plot,flower_p))
else
gui.text(0,-10,string.format("Plot:%s Flower:N/A",plot))
end

gui.text(0,0,"flower: " .. flower)
gui.text(0,10,string.format("Speed: %0.4f",speed*12.5/0x1000))
gui.text(0,20,string.format("X: %07.3f",X/0x1000))
gui.text(0,30,string.format("Y: %07.3f",Y/0x1000))
gui.text(0,40,string.format("Z: %07.3f",Z/0x1000))
gui.text(0,50,"RNG1: "..RNG1)
gui.text(0,60,"RNG2: "..RNG2)
gui.text(0,70,string.format("house: %05d",hw))
gui.text(0,80,string.format("after PG: %05d",pg))
gui.text(165,-10,"Rerecord: "..re)
gui.text(103,-191,string.format("%02d:%02d:%02d",h,m,s))
gui.text(205,-191,string.format("%07.3f",w))

if pg%1000 - max + w < 0 then
gui.text(0,-20,string.format("!Warning! PG too low")) 
end

if fT > 0 then
gui.text(5,-112,string.format("%03d f",fT))
end 

gui.text(0,100,string.format("byc_t: %f",byc_t))


end

gui.register(Fn)
