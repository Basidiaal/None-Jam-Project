if(global.pause)exit;
//sistema de colisão e movimento
var _velh = sign(velh);
var _velv = sign(velv);


//horizontal
repeat(abs(velh))
{
	
	if(place_meeting(x + _velh, y, Obj_Block)){
	velh = 0;
	break;
	}
	x += _velh;
	
}

//vertical
repeat(abs(velv)){

  if(place_meeting(x, y + _velv,Obj_Block)){
	  velv = 0;
	  break;
  }
  y += _velv;
	
}