/// @description dibujar inventario
//camera_get_view_x()
//view_get_xport()
//draw_self();
open=true;


var
h = 0,
k = 0,
vx = view_xport[0]/2,// entre 2
vy =  view_yport[0]/2, // entre 2
color = c_ltgray;
	
for(var i=1;i<=slotT;i++){

		
	// coordenadas idividuales
	var sx = vx + L*k, sy = vy + L*h;

	
	//interacción
	if point_in_rectangle(mouse_x,mouse_y,sx+64,sy+64,sx+128,sy+128)
	{
		if(mouse_check_button_pressed(mb_left))
		{
			//mouse vacio y slot lleno
			if(mouse==0 and global.slot[i]!=0)
			{
				mouse = global.slot[i];
				global.slot[i] = 0;
			}
			//mouse lleno y slot vacio
			else if(mouse!=0 and global.slot[i]==0)
			{
				global.slot[i]=mouse;
				 mouse= 0;
			}
			//mouse lleno y slot lleno
			else if(mouse!=0 and global.slot[i]!=0)
			{
				var _item=global.slot[i]; // variable de respaldo
				global.slot[i]= mouse;
				 mouse= _item;
			}
		}
		
		color=c_yellow;
	}
	else
	{
		
		color=c_white;
	}
		
	//fondo
	draw_sprite_ext(spr_bordeYfondo,1,sx+100,sy+100,1,1,0,color,1);
	draw_sprite(spr_bordeYfondo,1,sx+100,sy+100);
		
	//borde
	draw_sprite_ext(spr_bordeYfondo,0,sx+100,sy+100,1,1,0,c_white,1);
	draw_sprite(spr_bordeYfondo,0,sx+100,sy+100);
		
	if(global.slot[i]!=0){
		draw_sprite(spr_item,global.slot[i],sx+100,sy+100);
		
	}
		
	// aumentar coordenadas
	k++;
	if(frac(i/4) == 0){
		h += 1;
		k = 0;
	}
		
}

// dibujar item del mouse

if(mouse!=0)
{
	// dibujar item
	draw_sprite(spr_item,mouse,mouse_x,mouse_y);
}

var equis= irandom_range(1,5);
var	ye=	irandom_range(1,5);
if(mouse_check_button_pressed(mb_right))
{
	with(instance_create_layer(obj_player.x+50*equis,obj_player.y+50*ye,"Instances",obj_item))
	{
		item=other.mouse;
	}
	mouse=0;
}

