extends Node



@onready var control=$GameManager

@onready var howner;

@onready var hid;



@onready var currenthousetype=house_types.CATHOUSE;

@onready var cathouse_sprite=$cat_house
@onready var doughhousesprite=$dough_house
@onready var ramidhousesprite=$ramid_house


enum house_types{
	CATHOUSE=0,
	DOUGHHOUSE=1,
	RAMIDHOUSE=2,

	}
	



#@onready var house_hitbox=$CollisionShape2D



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	self.z_index=100;
	
	

	#connect("body_entered", self, "_on_body_entered")
	pass # Replace with function body.




# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	
	
	
	pass

	
	
func animation_init():
		
	if(currenthousetype==house_types.CATHOUSE):
			cathouse_sprite.visible=true;
	else:
			cathouse_sprite.visible=false;
		

	if(currenthousetype==house_types.DOUGHHOUSE):
			doughhousesprite.visible=true;
	else:
			doughhousesprite.visible=false;
	
	
	
	if(currenthousetype==house_types.RAMIDHOUSE):
			ramidhousesprite.visible=true;
	else:
			ramidhousesprite.visible=false;
		





#func _on_area_2d_area_entered(area: Area2D) -> void:
	
#	print("COL!")
#	GlobalVariables.kittyhome=1;
	
#	pass # Replace with function body.



func _on_area_2d_area_entered(area: Area2D) -> void:
	var radius=100;
	print("COL!")
	#howner.state=howner.states.RECHARGE
	
	if(!(howner==null)):
		if((howner.position.x<=self.position.x+radius)&&(howner.position.x>=self.position.x-radius)):
		
				howner.state=howner.states.RECHARGE
				howner.building_type_currently_at=howner.building_types.HOME;
	pass # Replace with function body.
