sleep 0.5;//서버 시작후 몇초뒤에 실행될지 결정
"Welcome to DC Vanilla Server!" hintC [
    parseText 
	"
	<br/><t align='center' size='1'><a color='#ffd800'>디씨 아르마 마이너갤 갤주 [NHC]</a></t>
	<br/><t align='center' size='2'><a color='#ffd800'>디씨 아르마갤 바닐라(기본) 멀티서버</a></t>
	<br/><t align='center'></t>
	<br/><t align='center'>디씨 아르마 마이너갤 바닐라 멀티서버에 오신걸 환영합니다</t>
	<br/><t align='center'></t>
	<br/><t align='center'>디씨인사이드 식 대화허용, 반말, 존대, 참피(실장석)어 등 모두 가능</t>
	<br/><t align='center'></t>
	<br/><t align='center'>다만 상호존중하여 매너있는 행동 및 대화를 하길바란다</t>
	<br/><t align='center'></t>
	<br/><t align='center'>막장서버는 아니니까 트롤러, 게임방해, 민폐자는 일가실각, 영구밴 할수 있음<t size='0.9'>
	<br/><t align='center'></t>
	<br/><t align='center' size='1.5'><a color='#ff0000'>보병 및 지상장비 위주로 항공장비에만 사람이 많이 몰리면 무작위로 강퇴 하겠음</a></t>
	<br/><t align='center'></t>
	<br/><t align='right'><t size='1'>
	디스코드<a color='#ffd800' href='https://discord.gg/Wa37cv8
'> 접속하기</a><br/>
	아르마 마이너갤 <a color='#008cff' href='http://gall.dcinside.com/mgallery/board/lists/?id=arma'> 접속하기</a></t></t><br/>
	<br/>
	<br/><t align='center' size='0.9'>분대창설, 가입은 U키, 그외 마우스휠을 굴려 메뉴를 사용</t>
	<br/>
	<br/><t align='center' size='1.5'><a color='#ffd800'>소총 등뒤에 매기 -키, 자동달리기 =키</a></t>
	<br/><t align='center'></t>
	<br/>
	<t size='0.8'><t align='left'> 서버안내문 도움 - BWB Gaming Group </a><br/>
	<t size='0.8'><t align='left'> 미션맵 작성 도움 - Modify @KingChiRoll </a><br/>
	<t size='1'><a color='#ff0000'>(서버 공지사항 끄기 ‡ESC‡)</a></t></t><br/>"
];
hintC_arr_EH = findDisplay 72 displayAddEventHandler ["unload", {
    0 = _this spawn {
        _this select 0 displayRemoveEventHandler ["unload", hintC_arr_EH];
        hintSilent "";
    };
}];