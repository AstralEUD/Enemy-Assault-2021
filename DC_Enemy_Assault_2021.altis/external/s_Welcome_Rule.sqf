sleep 0.5;//서버 시작후 몇초뒤에 실행될지 결정
"Welcome to Enemy Assault 2021!" hintC [
    parseText 
	"
	<br/><t align='center' size='1'><a color='#ffd800'>Enemy Assault 2021</a></t>
	<br/><t align='center'></t>
	<br/><t align='center' size='1'>에너미 어썰트 2021에 오신걸 환영합니다</t>
	<br/><t align='center' size='1.5'> [공지사항 (v.1.8.6)] (필독) </t>
	<br/><t align='center'></t>
	<br/><t align='center' size='1.5'>서버 밸런스 패치를 위해서 NAVID, LYNX 등을 환불처리했습니다.</t>
	<br/><t align='center' size='1.5'>기존 가격의 1.2배로 환불처리하였으며, 유저분들의 양해를 구합니다. 죄송합니다.</t>
	<br/><t align='center' size='1'> - 초보자는 초보자 가이드를 참고하세요 -</t>
	<br/><t align='center' size='1'></t>
	<br/><t align='right'><t size='1'>디스코드<a color='#ffd800' href='https://discord.gg/SbAzgYjWqV'> 접속하기</a>
	<br/>아르마 마이너갤 <a color='#008cff' href='http://gall.dcinside.com/mgallery/board/lists/?id=arma'> 접속하기</a></t></t><br/>
	<br/>
	<br/><t align='center' size='0.9'>분대창설, 가입은 U키, 그외 마우스휠을 굴려 메뉴를 사용</t>
	<br/><t align='center' size='0.9'><a color='#ffd800'>자동달리기 =키</a></t>
	<br/><t align='center' size='1.1'><a color='#ffd800'>!! 업데이트 로그를 반드시 확인하세요 !! (맵열어서 확인)</a></t>
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