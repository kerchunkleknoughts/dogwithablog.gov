extends Control

@onready var man = %GameManager





func _physics_process(delta: float) -> void:
	
	#print("FUCK!")
	

	#$drugs/Label3.text=str(Global.score)

	if Input.is_action_just_pressed("ui_cancel"):
		#get_tree().change_scene_to_file("res://scenes/control1.tscn")
		scene_manager.swap_scene(0)



	
	
