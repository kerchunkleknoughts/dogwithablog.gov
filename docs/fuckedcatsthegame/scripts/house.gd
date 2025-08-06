extends Node



@onready var control=$GameManager

@onready var john=get_tree().get_root().get_node("game2/john")

@onready var howner




#@onready var house_hitbox=$CollisionShape2D

enum states{
	WAIT=0,
	MOVING=1,
	RECHARGE=2
}




# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	

	#connect("body_entered", self, "_on_body_entered")
	pass # Replace with function body.




# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	
	
	
	pass

	
	


#func _on_area_2d_area_entered(area: Area2D) -> void:
	
#	print("COL!")
#	GlobalVariables.kittyhome=1;
	
#	pass # Replace with function body.



func _on_area_2d_area_entered(area: Area2D) -> void:
	print("COL!")
	#john.state=john.states.RECHARGE
	#GlobalVariables.kitty.state=GlobalVariables.kitty.states.RECHARGE;
	pass # Replace with function body.
