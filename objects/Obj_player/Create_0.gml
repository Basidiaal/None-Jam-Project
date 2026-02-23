

//criando camera
var cam = instance_create_layer(x,y,layer,Obj_Camera);
cam.target = id;

delay =0;

invincible = false;
max_life = 1;
current_life = max_life;

velh = 0;
velv = 0;

max_velh = 1;
max_velv = 1;

mass = 1;
attack = 1;

xscale = -1;

mostra_estado = false;

img_spd = 40;

combo = 0;

estado = "parado";




xscale = 1;


max_life = 100;
current_life = max_life;

max_velh = 4;
max_velv = 7;
dash_vel = 6;

combo = 0;
mostra_estado = true;
Attack = 1;
attack_mult = 1;
attack_buff = room_speed;

invincible = false;
invincible_timer = room_speed * .9;
timer_invincible = invincible_timer;

dash_delay = room_speed * .2 ;
dash_timer = 0;
img_spd = 60;

dano = noone;
i_can = true;

game_over_delay = false;
if(instance_exists(Obj_checkpoint)){
ini_open("checkpoint");
Obj_checkpoint.sprite_index = Spr_enable_checkpoint;
Obj_Camera.x = ini_read_real("Camera","CamX",Obj_Camera.x);
Obj_Camera.y = ini_read_real("Camera","CamY",Obj_Camera.y);
x = ini_read_real("Player","PosX",x);
y = ini_read_real("Player","PosY",y);
ini_close();
}
