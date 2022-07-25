sleep 0.5;//서버 시작후 몇초뒤에 실행될지 결정
"Welcome to Enemy Assault 2021!" hintC [
    parseText 
	"
	<br/><t align='center' size='1'><a color='#ffd800'>Enemy Assault 2021</a></t>
	<br/><t align='center'></t>
	<br/><t align='center' size='1'>에너미 어썰트 2021에 오신걸 환영합니다</t>
	<br/><t align='center' size='1.5'> [공지사항 (v.1.9.9)] </t>
	<br/><t align='center'></t>
	<br/><t align='center' size='1.5'>자본주의 에너미 어썰트 2021에 오신것을 환영합니다 !!.</t>
	<br/><t align='center' size='1.5'>본 미션맵은 한국서버에 뿌리내린 단체주의, 단체포인트, 기타등등을 지양합니다.</t>
	<br/><t align='center' size='1.5'>우리 서버에서는 당신이 돈을 벌고, 돈을 쓸 수 있습니다!</t>
	<br/><t align='center' size='1'> - 초보자는 초보자 가이드를 참고하세요 -</t>
	<br/><t align='center' size='1'></t>
	<br/><t align='right'><t size='1'>디스코드<a color='#ffd800' href='https://discord.gg/WSR9NZZPXC'> 접속하기</a>
	<br/><t align='center' size='0.9'>분대창설, 가입은 U키, 그외 마우스휠을 굴려 메뉴를 사용</t>
	<br/><t align='center' size='0.9'><a color='#ffd800'>자동달리기 =키</a></t>
	<br/><t align='center' size='1.1'><a color='#ffd800'>!! 업데이트 로그를 반드시 확인하세요 !! (맵열어서 확인)</a></t>
	<br/><t align='center'></t>
	<br/>
	<t size='0.8'><t align='left'> 개발총괄 : Testify </a><br/>
	<t size='0.8'><t align='left'> Thanks to : 전라도향우회관 </a><br/>
	<t size='1'><a color='#ff0000'>(서버 공지사항 끄기 ‡ESC‡)</a></t></t><br/>"
];
hintC_arr_EH = findDisplay 72 displayAddEventHandler ["unload", {
    0 = _this spawn {
        _this select 0 displayRemoveEventHandler ["unload", hintC_arr_EH];
        hintSilent "";
    };
}];