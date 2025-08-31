extends Node2D


@onready var isgen=0;


@onready var control=get_tree().get_root().get_node("game2/GameManager")#$"../houses"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:

	

	if(self.get_parent().get_parent().bottom_room_index==-1):
		isgen=0;
	else:
		isgen=1;



	print("BOTTOM GATE IS GEN VALUE!!!: " + str(isgen))

	pass # Replace with function body.




# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	pass







func _on_area_2d_area_entered(area: Area2D) -> void:
	var radius=150;
	print("YARN COL!")
	#howner.state=howner.states.RECHARGE
	
	


	if area.is_in_group("player"):
		#print("PICKUP!")
		
		#self.queue_free()
		
		if(isgen==0):
			scene_manager.generate_and_append_bottom();
			isgen=1;
			#scene_manager.scene_nav_swap(1)
			control.move_player(-100,-100)

			scene_manager.call_deferred("scene_nav_swap", 1)
		else:
			#scene_manager.scene_nav_swap(1)
			control.move_player(-100,-100)
			
			scene_manager.call_deferred("scene_nav_swap", 1)
		
