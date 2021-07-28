특기 변경기 by UNIT_normal
기본 특기와 커스텀 특기로 변경할 수 있습니다.

알려진 문제들
- 이 스크립트는 실제 유닛 클래스를 바꾸지 않습니다.

설치
1. Trait_Changer 폴더를 미션폴더에 넣기
2. stringtable.xml을 넣거나 내용물을 기존에 있던 것에 삽입
3. init.sqf에 다음 줄 삽입
[] execVM "Trait_Changer\TC_init.sqf";

4. 원하는 오브젝트 init 창에 다음 줄 삽입
0 = this execVM "Trait_Changer\functions\fnc_TC_object.sqf";

4. description.ext에 다음 줄 삽입
#include "Trait_Changer\defines.hpp"
#include "Trait_Changer\TC_GUI_controls.hpp"
#include "Trait_Changer\TC_GUI_classes.hpp"

옵션
- TC_init.sqf에서 서버상 특기제한 사용 가능

변경내역
1.0
공개

고마운 곳들
디시인사이드 아르마(ARMA) 마이너 갤러리 (수많은 테스트 도움과 서버 내 테스트)