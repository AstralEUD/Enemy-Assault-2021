// ["report",_arraytext] call DiscordEmbedBuilder_fnc_buildCfg;
class report {
    webhook="Example"; // CfgDiscordEmbedWebhooks
    username="EA2021 서버 알리미";
	message="<@&882560653267697684>";
    tts=0;
    // Maximum of 10 embeds per template
    class Embeds {
        class Embed1: CfgDiscordEmbedTemplate {
            title="서버 제보함";
            color="FF0000";
            timestamp = 1;
            class Author {
                name="Project EA2021";
                url="https://github.com/AstralEUD/DC_Enemy_assault_2021";
				image="https://emoji.gg/assets/emoji/2668_Siren.gif";
            };
            class Footer {
                text="Enemy Assault 2021";
            };
            fields[]={
                //{title,content,inline}
                {"제보자 이름: ","%2",1},
				{"제보 내용: ","%1",0}
            };
        };
    };
};
