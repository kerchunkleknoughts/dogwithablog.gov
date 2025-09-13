extends "res://scripts/yarn.gd"





func _ready() -> void:

	# OR
	super._ready()  # Godot 4.x









func _on_area_2d_area_entered(area: Area2D) -> void:
	var radius=150;
	print("YARN COL!")
	#howner.state=howner.states.RECHARGE
	
	
	if area.is_in_group("player"):
		print("PICKUP!")
		self.queue_free()
		
		if(current_item_type==item_types.YARN):
			GlobalVariables.tumors=GlobalVariables.tumors+1;
			
		if(current_item_type==item_types.FINGER):
			GlobalVariables.fingers=GlobalVariables.fingers+1;
		
