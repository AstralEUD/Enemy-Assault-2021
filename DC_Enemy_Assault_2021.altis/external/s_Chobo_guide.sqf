_guide = {
	params ["_actionID"];
	"Enemy Assault 2021 초보자 가이드" hintC [
		parseText 
		"
		<br/><t align='center' size='1'><a color='#ffd800'>Enemy Assault 2021</a></t>
		<br/><t align='left'></t>
		<br/><t align='left' size='1.5'>에너미 어썰트 2021에 오신걸 환영합니다</t>
		<br/><t align='left' size='1.5'>본 서버는 공용 포인트가 아닌 '개인 포인트 제도'를 도입하였습니다.
		<br/><t align='left'></t>
		<br/><t align='left' size='1'>1킬당 3포인트를 획득할 수 있으며, 15분마다 15포인트를 획득할 수 있습니다.</t>
		<br/><t align='left' size='1'>얻은 포인트로는 차량을 스폰하거나 항공기를 스폰할 수 있습니다..</t>
		<br/><t align='left' size='1'> 인벤토리를 열었을 때 포인트를 확인할 수 있습니다.</t>
		<br/><t align='left' size='1'></t>
		<br/><t align='left' size='1'> 맵을 연 후 좌측 상단 '서버 가이드' 를 눌러 더 자세한 가이드를 확인할 수 있습니다.</t>
		<br/><t align='left' size='1'> 디스코드나 아르마 갤러리를 이용하여 도움을 얻거나 질문할 수 있습니다.</t>
		<br/>
		<br/><t align='left' size='1'> 상호간의 예의와 질서를 지켜 주세요.</t>
		<br/><t align='left' size='1'> 잘못에는 사과를, 모범에는 칭찬을 부탁드립니다.</t>
		<t size='1'><a color='#ff0000'>(초보자 가이드 끄기 ‡ESC‡)</a></t></t><br/>"
	];
	hintC_arr_EHb = findDisplay 72 displayAddEventHandler ["unload", {
		0 = _this spawn {
			_this select 0 displayRemoveEventHandler ["unload", hintC_arr_EHb];
			hintSilent "";
		};
	}];
};

player addAction ["<t size='1.5'>초보자 가이드 실행",_guide,nil,1.5,true,true,"","player inArea 'VAM_service_area_0'"];
