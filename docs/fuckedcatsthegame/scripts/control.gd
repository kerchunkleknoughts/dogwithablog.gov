extends Control


@onready var timer: Timer = $Timer


var timer1 := Timer.new()
var delay: float = 10








func _on_timer1_timeout() -> void:
	scene_manager.swap_scene(0)




func _ready() -> void:
	add_child(timer1)
	timer1.wait_time=delay
	timer1.one_shot=true
	timer1.start()
	
	print("control init function called.")
	
	print(timer1.time_left)
	
	timer1.timeout.connect(_on_timer1_timeout)
	
	#get_tree().change_scene_to_file("res://scenes/game.tscn")
	
		
