
if(target == noone) exit;

//seguindo o alvo
if (instance_exists(target)) {
    x = lerp(x, target.x, .1);
    y = lerp(y, target.y, .1);
}



