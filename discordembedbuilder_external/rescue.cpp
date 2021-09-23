// ["report",_arraytext] call DiscordEmbedBuilder_fnc_buildCfg;
class rescue {
    webhook="Example"; // CfgDiscordEmbedWebhooks
    username="EA2021 서버 알리미";
    tts=0;
    // Maximum of 10 embeds per template
    class Embeds {
        class Embed1: CfgDiscordEmbedTemplate {
            title="인질 사살 알림";
            color="660099";
            timestamp = 1;
            class Author {
                name="Project EA2021";
                url="https://github.com/AstralEUD/DC_Enemy_assault_2021";
				image="https://c.tenor.com/8088grr8698AAAAM/minions-despicableme.gif";
            };
            class Footer {
                text="Enemy Assault 2021";
            };
            fields[]={
                //{title,content,inline}
                {"인질 사살자: ","%1",1}
            };
        };
    };
};
