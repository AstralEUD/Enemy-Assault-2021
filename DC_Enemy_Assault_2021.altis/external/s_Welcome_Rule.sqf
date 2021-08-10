sleep 0.5;//서버 시작후 몇초뒤에 실행될지 결정
"Welcome to DC Vanilla Server!" hintC [
    parseText 
	"
	<br/><t align='center' size='1'><a color='#ffd800'>Enemy Assault 2021</a></t>
	<br/><t align='center' size='2'><a color='#ffd800'>에너미어썰트 2021</a></t>
	<br/><t align='center'></t>
	<br/><t align='center'>에너미 어썰트 2021에 오신걸 환영합니다</t>
	<br/><t align='center'></t>
	<br/><t align='center'>상호존중하여 매너있는 행동 및 대화를 하길바람</t>
	<br/><t align='center'></t>
	<br/><t align='center'>막장서버는 아니니까 트롤러, 게임방해, 민폐자는 일가실각, 영구밴 할수 있음<t size='0.9'>
	<br/><t align='center'></t>
	<br/><t align='right'><t size='1'>
	디스코드<a color='#ffd800' href='https://discord.gg/SbAzgYjWqV
'> 접속하기</a><br/>
	아르마 마이너갤 <a color='#008cff' href='http://gall.dcinside.com/mgallery/board/lists/?id=arma'> 접속하기</a></t></t><br/>
	<br/>
	<br/><t align='center' size='0.9'>분대창설, 가입은 U키, 그외 마우스휠을 굴려 메뉴를 사용</t>
	<br/>
	<br/><t align='center' size='1.5'><a color='#ffd800'>자동달리기 =키</a></t>
	<br/><t align='center'></t>
	<br/>
	<t size='0.8'><t align='left'> 개발총괄 : Testify </a><br/>
	<t size='0.8'><t align='left'> Thanks to : DCinisde ArmA Gallery </a><br/>
	<t size='1'><a color='#ff0000'>(서버 공지사항 끄기 ‡ESC‡)</a></t></t><br/>"
];
hintC_arr_EH = findDisplay 72 displayAddEventHandler ["unload", {
    0 = _this spawn {
        _this select 0 displayRemoveEventHandler ["unload", hintC_arr_EH];
        hintSilent "";
    };
}];