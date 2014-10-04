class Ak47 extends MovieClip
{
	function onLoad()
	{
		_x = Math.random()*520;
		_y = Math.random()*350;
	}
	function onEnterFrame(){
		if(this.hitTest(_root.fmc)){
			_root.ship.updateHealth(100-_root.ship.health);
			this.removeMovieClip();
		}
	}
		
}