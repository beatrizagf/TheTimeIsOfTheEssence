// player movement is done in the script
scrProcessPlayer();

//life timer: countdown + only one digit
if hp>0
{
	hp=hp-delta_time/1000000;
}
//if hp==3
//{dragonshadow=true;}
else
{
	//hp=0
	game_restart();
}

showhp=ceil(hp)	//only one digit