local function Fn()
local X,Z
local Xf,Zf
local plot,table
local flower_p
local map
local offset,baseAdr

X = memory.readdwordsigned(0x0213C8D4)
Z = memory.readdwordsigned(0x0213C8DC)
map = memory.readword(0x0211EAD0)
baseAdr = 0x021E69E0
offset = 0
plot ="Undefined"
flower_p = 0

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

end
gui.register(Fn)