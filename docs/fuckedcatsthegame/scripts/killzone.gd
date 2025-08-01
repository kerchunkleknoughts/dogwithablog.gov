extends Area2D



@onready var timer: Timer = $Timer


func _on_body_entered(body: Node2D) -> void:
	print("you died! DEADBOB!")
	Engine.time_scale=0.5;
	body.get_node("CollisionShape2D").queue_free()
	timer.start()


func _on_timer_timeout() -> void:
	Engine.time_scale=1;
	scene_manager.reload_current_scene()
