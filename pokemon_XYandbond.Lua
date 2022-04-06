local function Fn()
local X,Y,X_ride,Y_ride
local bond,bond_2,bond_J,bond_an,bond_an2
local bp,ch,ch_r,keisan
local ch,ch_r2,keisan2

X = memory.readdword(0x02137930)
Y = memory.readdword(0x02137934)
X_ride = memory.readdword(0x02136ED4)
Y_ride = memory.readdword(0x02136ED8)
bond = memory.readword(0x021D5A66)
bond_2 = memory.readword(0x0211CB76)
bond_J = memory.readword(0x021D5A68)
bond_an = memory.readword(0x021D5A88)
bond_an2 = memory.readword(0x0211CB78)
bp = memory.readbyte(0x020B6C0C)
ch = memory.readbyte(0x02258048)
keisan = 0
keisan2 = 0 

-- ポケモンに乗っているかを判定し、適切な値を表示させる。

if X == 0 and Y == 0 then

gui.text(0,0,"X: "..X_ride)
gui.text(80,0,"Y: "..Y_ride)

else

gui.text(0,0,"X: "..X)
gui.text(80,0,"Y: "..Y)

end

--　現在キャプチャ中かを判定し、キャプチャ中でなければ0を表示させる。また、怒り状態の場合はそれの値を表示させる。(1体目)

if bond_J == 17 then

elseif bond_an > 0 then

gui.text(0,10,"bond_r: "..bond_an)

else

gui.text(0,10,"bond_r: "..bond)

end


--　現在キャプチャ中かを判定し、キャプチャ中でなければ0を表示させる。また、怒り状態の場合はそれの値を表示させる。(2体目)

if bond_J == 17 then

elseif bond_an2 > 0 then

gui.text(80,10,"bond2_r: "..bond_an2)

else

gui.text(80,10,"bond2_r: "..bond_2)

end

--　現在キャプチャシーンである場合、あと何回囲めば完了するか表示する。また、現在キャプチャ中であればそのコンボ値を考慮して表示する。

if bond_J == 17 then

elseif bond_an > 0 then
	ch_r = ch
	
	for i=0 , 999 do	
	keisan  = keisan + (bp/10)*(1+math.floor((ch_r -1)/5)*0.25)
	if bond_an < keisan then
		ch_r = ch_r - ch +1
		break
		end
	ch_r = ch_r + 1
	end
gui.text(0,20,"remain enclose: "..ch_r)

elseif bond > 0 then
	ch_r = ch
	
	for i=0 , 999 do	
	keisan  = keisan + bp*(1+math.floor((ch_r -1)/5)*0.25)
	if bond < keisan then
		ch_r = ch_r - ch +1
		break
		end
	ch_r = ch_r + 1
	end
gui.text(0,20,"remain enclose: "..ch_r)

end


--　現在キャプチャシーンである場合、あと何回囲めば完了するか表示する。また、現在キャプチャ中であればそのコンボ値を考慮して表示する。(2体目)

if bond_J == 17 then

elseif bond_an2 > 0 then
	ch_r2 = ch
	
	for i=0 , 999 do	
	keisan2  = keisan2 + (bp/10)*(1+math.floor((ch_r2 -1)/5)*0.25)
	if bond_an2 < keisan2 then
		ch_r2 = ch_r2 - ch +1
		break
		end
	ch_r2 = ch_r2 + 1
	end
gui.text(0,30,"remain enclose: "..ch_r2)

elseif bond_2 > 0 then
	ch_r2 = ch
	
	for i=0 , 999 do	
	keisan2  = keisan2 + bp*(1+math.floor((ch_r2 -1)/5)*0.25)
	if bond_2 < keisan2 then
		ch_r2 = ch_r2 - ch +1
		break
		end
	ch_r2 = ch_r2 + 1
	end
gui.text(0,30,"remain enclose: "..ch_r2)

end

end
gui.register(Fn)
