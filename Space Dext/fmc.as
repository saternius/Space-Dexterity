class fmc extends MovieClip
{
	var velocity;
	var shootLimiter;
	var enemyTimer;
	var enemies;
	var powerupTimer;
	var miniBossTimer;
	var nxtlvlTimer;
	var score;
	var health;
	
	function onLoad()
	{
		velocity = 3;
		shootLimiter=0;
		enemyTimer= 0;
		powerupTimer=0;
		nxtlvlTimer=0;
		enemies=[];
		resetScore();
		resetHealth();
		miniBossTimer=0;
		_root.ship.shield._visible=false;
		_root.gameOverMenu._visible=false;
		_root.gameOverMenu.ta.onPress=function()
		{
			_root.ship.newGame();
		}
	}
	function onEnterFrame()
	{
		if(_visible == true)
		{
			shootLimiter+=1;
			if(Key.isDown(Key.CONTROL)&& shootLimiter > 38)
			{
				shootLimiter = 0;
				var missile = _root.attachMovie("Missile","Missile" + _root.getNextHighestDepth(),_root.getNextHighestDepth());
				missile._x=_x+30;
				missile._y=_y+6;
			}
			enemyTimer+=1;
			if(enemyTimer>60)
			{
				enemyTimer = 0;
				var enemy =_root.attachMovie("EnemyShip","EnemyShip" + _root.getNextHighestDepth(),_root.getNextHighestDepth());
				enemies.push(enemy);
			}
			if(!_root.miniBoss)
			{
				miniBossTimer+=1;
			}
			if(miniBossTimer>300)
			{
				miniBossTimer=0;
				_root.attachMovie("MiniBoss","miniBoss",_root.getNextHighestDepth());
				enemies.push(_root.miniBoss);
			}
			powerupTimer+=1;
			if(powerupTimer>350)
			{
				powerupTimer=0;
				var powerup=_root.attachMovie("PowerUp","PowerUp"+_root.getNextHighestDepth(),_root.getNextHighestDepth());
			}
			nxtlvlTimer+=1
			if(nxtlvlTimer>500)
			{
				nxtlvlTimer=0;
				var nxtlvl= _root.attachMovie("insert","insert"+_root.getNextHighestDepth(),_root.getNextHighestDepth());
			}
			if(_root.ship.shield._visible==true)
			{
				_root.ship.shield._alpha-=.5;
				if(_root.ship.shield._alpha<0)
				{
					_root.ship.shield._visible=false;
					_root.ship.shield._alpha=100;
				}
			}
			
			
		}
	}
	function updateScore(points)
	{
		score+=points;
		_root.scoreText.text=score;
		
	}
	function resetScore()
	{
		score=0;
		_root.scoreText.text=score;
	}
	function updateHealth(points)
	{
		health +=points;
		if(health<1)
		{
			health=0;
			_root.gameOverMenu._visible=true;
			explode();
		}
			
		_root.hm.bar._xscale=health;
	}
	function resetHealth()
	{
		health=100;
		_root.hm.bar._xscale=100;
	}
	function explode()
	{
		this._visible=false;
		var explosion = _root.attachMovie("Explosion","Explosion"+_root.getNextHighestDepth(),_root.getNextHighestDepth());
		explosion._x=_x;
		explosion._y=_y;
		for(var i in enemies)
		{
			enemies[i].explode();
		}
	}
	function newGame()
	{
		this._visible = true;
		_root.gameOverMenu._visible=false;
		resetHealth();
		resetScore();
	}
}

	