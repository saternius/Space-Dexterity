class nxtlvl extends MovieClip
{
	var speed;
	var type;

	function onLoad()
	{
		speed = 5;
		type = Math.floor(Math.random()*3+1);
		_x = 650;
		_y = Math.random()*200+50;
	}
	function onEnterFrame()
	{
		_x-= speed;
		_rotation-=0;
		if(this.hitTest(_root.ship))
		{
			if(type==1)
			{
				_root.gotoAndPlay("ship")
				{
					this.removeMovieClip();
				}
			}
			if(type==2)
			{
				_root.gotoAndPlay("ship")
				{
					this.removeMovieClip();
				}
			}
			if(type==3)
			{ 
 				_root.gotoAndPlay("ship")
				{
					this.removeMovieClip();
				}
			}
		}
		if(_x<-30)
		{
			this.removeMovieClip();
		}
	}
}