params["_speaker","_caption"];

[format ["<t size = '.5'>%1<br/>""%2""</t>",name _speaker,_caption] 
,-1 
,1 
,1 
,0.1 
,-0.1
,SCM_DisplayIDD+SCM_CaptionRscLayerInc+100] spawn BIS_fnc_dynamicText;

SCM_CaptionRscLayerInc=(SCM_CaptionRscLayerInc+1)%5;