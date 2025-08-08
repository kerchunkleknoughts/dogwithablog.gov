extends Node



@onready var control=$GameManager

#anytime a cafe is being targeted, da owner changes to the kitty which is walking towards it. 
@onready var daowner;

@onready var caid;




#@onready var house_hitbox=$CollisionShape2D



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
	var radius=100;
	print("COL!")
	
	daowner.state=daowner.states.RECHARGE
	if((daowner.position.x<=self.position.x+radius)&&(daowner.position.x>=self.position.x-radius)):
		
			daowner.state=daowner.states.RECHARGE
	pass # Replace with function body.
