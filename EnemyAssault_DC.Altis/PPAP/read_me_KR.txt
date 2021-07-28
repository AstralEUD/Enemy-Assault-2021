항공기를 위한 파일런 프리셋 할당기 by UNIT_normal
GUI를 통해 기본적으로 제공되는 프리셋과 추가적으로 구성한 프리셋 간 변경이 가능합니다.

알려진 문제들
- 무장 이름이 길 경우, 2줄로 표기될 수 있습니다.
- 파일론 이름이 잘못 출력될 수 있습니다.

설치
1. PPAP 폴더를 미션폴더에 넣기
2. stringtable.xml을 넣거나 내용물을 기존에 있던 것에 삽입
3. init.sqf에 다음 줄 삽입
[] execVM "PPAP\PPAP_init.sqf";
4. description.ext에 다음 줄 삽입
#include "PPAP\defines.hpp"
#include "PPAP\PPAP_GUI_controls.hpp"
#include "PPAP\PPAP_GUI_classes.hpp"

옵션
- PPAP_init.sqf에서 각종 옵션 활성화 가능

변경내역
1.0
공개
1.01
마이너 체인지
1.10
액션 매커니즘 변경
1.11
마이너 체인지
1.12
로컬리티 문제 해결, 기타 발동조건 변경
1.13
마이너 체인지
1.14
버그 픽스. 로컬리티 이슈로 인하여 차량 내부에서 파일런 변경시엔 조종사를 제외한 전원이 하차하여야함.
1.15
버그 픽스, 마이너 체인지, 스트링테이블 내용물 변경

고마운 곳들
디시인사이드 아르마(ARMA) 마이너 갤러리 (수많은 테스트 도움과 서버 내 테스트)
JLD 서버 (서버 내 테스트)