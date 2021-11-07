local function Fn()
local ID = 0
local base,base2
local i,j,k

--配列を宣言する。
-- 0x023B74A0を最初のbaseとし、それぞれの蜂の内部データ群に対してIDを付与し、それのＹ座標（3D）を定義する。※必要に応じて最初のベースアドレスを変える必要あり。
	arr = {}
		for i = 0, 8 do
			base = 0x023B74A0 + i*0x108
							
			arr[ID] = memory.readdword(base-40)
			
			--該当アドレスの蜂が倒されている場合、IDを1減らしておく。
			if memory.readdword(base-28) ~= 0x2000 then
				ID = ID-1
			end
			
			ID = ID+1
		end	

--適切な回数表示する。
	for j = 0, ID-1 do
		gui.text(100,-20-j*10,string.format("%d %d",ID-j,arr[ID-1-j]))
	end

-- 配列に配列をセットし、行列を宣言する。
-- 0x02234CC2を最初のbaseとし、それぞれの蜂に対してIDを付与し、上画面のXY座標(2D)を定義する。※必要に応じて最初のベースアドレスを変える必要あり。
	matrix = {}
		for k = 0, 8 do
			base2 = 0x02234CC2+k*12
			
			--[1]:ID [2]:X,[3]:Y
			matrix[k] ={[1]= k+1 , [2]=memory.readword(base2+6),[3]=memory.readword(base2+8)} 
		
			--ケチャップ以降にIDを付与し始めた場合for文を抜ける。			
			if memory.readword(base2+10) == 0x68 then
				break
			end

			--72,-192を原点とし、それぞれのIDをx,yを基に配置する。
			gui.text(72+matrix[k][2],-192+matrix[k][3],string.format("%d",matrix[k][1]))	
		end

--gui.text(0,70,string.format("test %d",matrix[1][2]))
end
gui.register(Fn)
