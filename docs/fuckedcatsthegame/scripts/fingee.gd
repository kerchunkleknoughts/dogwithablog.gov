extends Node2D

@onready var fucker=get_tree().get_root().get_node("game2/fucker2")#$"../houses"

@onready var control=$GameManager
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.








func _on_area_2d_area_entered(area: Area2D) -> void:
	var radius=150;
	print("YARN COL!")
	#howner.state=howner.states.RECHARGE
	
	
	if area.is_in_group("player"):
		print("PICKUP!")
		self.queue_free()
		GlobalVariables.fingers=GlobalVariables.fingers+1;
		
	
	
	#if((fucker.position.x<=self.position.x+radius)&&(fucker.position.x>=self.position.x-radius)):
	#	print("PICKUP!")
	#	GlobalVariables.money=GlobalVariables.money+1;
		#control.update_label()
	#	self.queue_free()
		#kill self once purpose is fulfilled, that is being picked up.

	pass # Replace with function body.
