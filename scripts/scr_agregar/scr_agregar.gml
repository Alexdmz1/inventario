///@arg item
function scr_agregar(argument0){

	var _item =argument0;
	
	with(Obj_inventario)
	{
		for(var i=1;i<=slotT;i++)
		{
			if(global.slot[i]==0)
			{
				global.slot[i]=_item;
				return (1);
				exit;
			}
		}
		return(0);
	}
}