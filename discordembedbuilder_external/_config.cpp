// Developer info: https://github.com/ConnorAU/SQFDiscordEmbedBuilder/blob/master/README.md

class CfgDiscordEmbedWebhooks {
    // https://discord.com/api/webhooks/000000000000000000/XXXXXXX_XXXXXXXXXXXXXXX_XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
    // https://discordapp.com/api/webhooks/875695685448650772/ujBlpjB0XNaNdLhO8DruDGvKhS4V9qy02Gt3NsewoNEb1nT8D2mQ3U3ZkTti7yYLMt6y
    Example="(웹훅)";
};

class CfgDiscordEmbedTemplate {
    title="";
    description="";
    url="";
    color="";
    timestamp=0;
    thumbnail="";
    image="";
    class Author {
        name="";
        url="";
        image="";
    };
    class Footer {
        text="";
        image="";
    };
    // Maximum 25 fields per embed
    fields[]={
        //{title,content,inline}
    };
};

class CfgDiscordEmbedBuilder {
	#include "\@DiscordEmbedBuilder\external\Example.cpp"
	#include "\@DiscordEmbedBuilder\external\player.cpp"
	#include "\@DiscordEmbedBuilder\external\serverOn.cpp"
	#include "\@DiscordEmbedBuilder\external\report.cpp"
	#include "\@DiscordEmbedBuilder\external\rescue.cpp"
	#include "\@DiscordEmbedBuilder\external\teamkill.cpp"
	#include "\@DiscordEmbedBuilder\external\transfer.cpp"
};
