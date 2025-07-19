sleep 0.5;//서버 시작후 몇초뒤에 실행될지 결정
"Welcome to ASTRO Enemy Assault" hintC [
    parseText 
	"
	<br/><t align='center' size='1'><a color='#ffd800'>ASTRO Enemy Assault</a></t>
	<br/><t align='center'></t>
	<br/><t align='center' size='1'>ASTRO 서버 Enemy Assault에 오신 것을 환영합니다</t>
	<br/><t align='center' size='0.9'>본 서버는 공용 포인트가 아닌 개인 포인트를 채택한 작전서버입니다.</t>
	<br/><t align='center' size='0.9'> - 초보자는 초보자 가이드를 참고하세요 -</t>
	<br/><t align='center' size='1'></t>
	<br/><t align='right'><t size='1'>디스코드<a color='#ffd800' href='https://discord.gg/drXxj3PmyG'> 접속하기</a>
	<br/>
	<br/><t align='center' size='0.9'>분대창설, 가입은 U키, 그외 마우스휠을 굴려 메뉴를 사용</t>
	<br/><t align='center' size='0.9'><a color='#ffd800'>자동달리기 =키</a></t>
	<br/><t align='center' size='1.1'><a color='#ffd800'>!! 업데이트 로그를 반드시 확인하세요 !! (맵열어서 확인)</a></t>
	<br/><t align='center'></t>
	<br/>
	<t size='0.8'><t align='left'> 개발총괄 : Astral </a><br/>
	<t size='0.8'><t align='left'> Thanks to : DCinisde ArmA Gallery </a><br/>
	<t size='1'><a color='#ff0000'>(서버 공지사항 끄기 ‡ESC‡)</a></t></t><br/>"
];
hintC_arr_EH = findDisplay 72 displayAddEventHandler ["unload", {
    0 = _this spawn {
        _this select 0 displayRemoveEventHandler ["unload", hintC_arr_EH];
        hintSilent "";
    };
}];