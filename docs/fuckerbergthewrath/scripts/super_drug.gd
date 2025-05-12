extends Area2D

var sprite;

@onready var timer: Timer = $Timer




@onready var man = %GameManager


func _on_body_entered(body: Node2D) -> void:
	print("ohh drug time ")
	#sprite = body.get_node("AnimatedSprite2D")
	#sprite.play("drug time")
	Global.drugtime=true
	#Global.add_point()
	man.add_point()
	timer.start()
	queue_free()





func _on_timer_timeout() -> void:
	sprite.play("bob")
	print("back to normal!")
	
	
