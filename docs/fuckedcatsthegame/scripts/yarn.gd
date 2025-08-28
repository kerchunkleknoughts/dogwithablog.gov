extends Node2D

@onready var fucker=get_tree().get_root().get_node("game2/fucker2")#$"../houses"

@onready var yarnsprite=$yarnsprite
@onready var fingersprite=$fingersprite


@onready var control=$GameManager
# Called when the node enters the scene tree for the first time.


@onready var area_2d: Area2D = $Area2D



func _ready() -> void:


	area_2d.area_entered.connect(_on_area_2d_area_entered)


	pass # Replace with function body.



enum item_types{
	YARN=0,
	FINGER=1
}

var current_item_type=item_types.YARN;



func _on_area_2d_area_entered(area: Area2D) -> void:
	var radius=150;
	print("YARN COL!")
	#howner.state=howner.states.RECHARGE
	
	
	if area.is_in_group("player"):
		print("PICKUP!")
		self.queue_free()
		
		if(current_item_type==item_types.YARN):
			GlobalVariables.money=GlobalVariables.money+1;
		if(current_item_type==item_types.FINGER):
			GlobalVariables.fingers=GlobalVariables.fingers+1;
		
		
	
	
	#if((fucker.position.x<=self.position.x+radius)&&(fucker.position.x>=self.position.x-radius)):
	#	print("PICKUP!")
	#	GlobalVariables.money=GlobalVariables.money+1;
		#control.update_label()
	#	self.queue_free()
		#kill self once purpose is fulfilled, that is being picked up.

	pass # Replace with function body.



func yarn_init():
	
	if(current_item_type==item_types.YARN):
		yarnsprite.visible=true;
	else:
		yarnsprite.visible=false;
	
	
	if(current_item_type==item_types.FINGER):
		fingersprite.visible=true;
	else:
		fingersprite.visible=false;


	
