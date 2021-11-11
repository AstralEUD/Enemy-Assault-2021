// ["Player",_countAllPlayer] call DiscordEmbedBuilder_fnc_buildCfg;
class Player {
    webhook="Example"; // CfgDiscordEmbedWebhooks
    username="EA2021 서버 알리미";
    avatar="https://i.imgur.com/p3CcCHG.png";
    tts=0;
    // Maximum of 10 embeds per template
    class Embeds {
        class Embed1: CfgDiscordEmbedTemplate {
            title="현재 서버 인원 현황";
            color="00FF00";
            timestamp = 1;
            class Author {
                name="Project EA2021";
                url="https://github.com/AstralEUD/DC_Enemy_assault_2021";
                image="https://units.arma3.com/groups/img/66458/dAB2EdMwVB.png";
            };
            class Footer {
                text="Enemy Assault 2021";
                image="https://steamcdn-a.opskins.media/steamcommunity/public/images/apps/107410/3212af52faf994c558bd622cb0f360c1ef295a6b.jpg";
            };
            fields[]={
                //{title,content,inline}
                {"현재 서버 인원수: ","%1 명",0},
				{"현재 서버 접속한 사람들: ","%2",0}
            };
        };
    };
};
