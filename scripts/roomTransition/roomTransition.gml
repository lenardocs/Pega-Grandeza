
function roomTransition(_type,_targetRoom){
	if(!instance_exists(obj_transition)){
		
		with(instance_create_depth(0,0,-9999,obj_transition)){
			
			type = _type;
			target = _targetRoom;
			
		}
		
	}
	else show_debug_message("Tentando transisionar enquanto está na transisão")
}