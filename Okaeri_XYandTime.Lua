local function Fn()
local XAddr = 0x02396EE4
local YAddr = 0x0223A5BC
local ZAddr = 0x02396EEC
local X,Y,Z
local time	
local RNG1
local RNG2
local re
local IGT
local h,m,s
local flag

	X=memory.readdwordsigned(XAddr)
	Y=memory.readdwordsigned(YAddr)
	Z=memory.readdwordsigned(ZAddr)
	RNG1 = memory.readdwordunsigned(0x02230C6C)
	RNG2 = memory.readdwordunsigned(0x02230C70)
	time = memory.readdword(0x02395528)
	re = movie.rerecordcount()
	flag = memory.readdword(0x02392958)

	RNG1 = bit.tohex(RNG1)
	RNG2 = bit.tohex(RNG2)

	gui.text(0,0,"X: "..X)
	gui.text(95,0,"Y: "..Y)
	gui.text(165,0,"Z: "..Z)

	if time >= 0x44A50000 then
		time = 0x44E10000 - memory.readdword(0x02395528)
		IGT = (memory.readdword(0x02395528)- 0x44A50000) /0x2000
		h =  math.floor( IGT/60 + 22)
			if h >= 24 then
				h = h-24
			end
		m = math.floor( IGT % 60)
		s = math.floor( IGT * 60 % 60)
		gui.text(0,10,string.format("Time: %d %df",time,(time+time*0.5*flag)*2/437))
		gui.text(35,-96,""..h)
		gui.text(47,-96,":"..m)
		gui.text(65,-96,":"..s)
	else
		time = 0x44870000 -  memory.readdword(0x02395528)
		IGT = (memory.readdword(0x02395528)- 0x44160000) /0x4000
		h =  math.floor( IGT/60+10)
		m = math.floor( IGT % 60)
		s = math.floor( IGT * 60 % 60)
	 	gui.text(0,10,string.format("Time: %d %df",time,(time+time*0.5*flag)*2/874))
		gui.text(35,-96,""..h)
		gui.text(47,-96,":"..m)
		gui.text(65,-96,":"..s)
		gui.text(0,10,"Time: "..time)
	end	

	gui.text(0,20,"RNG1: "..RNG1)
	gui.text(0,30,"RNG2: "..RNG2)
	gui.text(165,-10,"Rerecord: "..re)
end
gui.register(Fn)
