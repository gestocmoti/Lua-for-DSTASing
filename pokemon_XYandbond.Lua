local function Fn()
local X
local Y
local X_ride
local Y_ride
local bond
local bond_2
local bond_J
local bond_an
local bond_an2

X = memory.readdword(0x02137930)
Y = memory.readdword(0x02137934)
X_ride = memory.readdword(0x02136ED4)
Y_ride = memory.readdword(0x02136ED8)
bond = memory.readword(0x021D5A66)
bond_2 = memory.readword(0x0211CB76)
bond_J = memory.readword(0x021D5A68)
bond_an = memory.readword(0x021D5A88)
bond_an2 = memory.readword(0x0211CB78)


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

gui.text(0,10,"bond_r: 0")

elseif bond_an > 0 then

gui.text(0,10,"bond_r: "..bond_an)

else

gui.text(0,10,"bond_r: "..bond)

end


--　現在キャプチャ中かを判定し、キャプチャ中でなければ0を表示させる。また、怒り状態の場合はそれの値を表示させる。(2体目)

if bond_J == 17 then

gui.text(80,10,"bond2_r: 0")

elseif bond_an2 > 0 then

gui.text(80,10,"bond2_r: "..bond_an2)

else

gui.text(80,10,"bond2_r: "..bond_2)

end




end
gui.register(Fn)
