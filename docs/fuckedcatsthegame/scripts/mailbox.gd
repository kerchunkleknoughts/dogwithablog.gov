extends Node2D

@onready var fucker=get_tree().get_root().get_node("game2/fucker2")#$"../houses"

@onready var yarnsprite=$yarnsprite
@onready var fingersprite=$fingersprite

@onready var tb1=(get_tree().get_root().get_node("game2/mailtext/box/text"))


@onready var control=$GameManager
# Called when the node enters the scene tree for the first time.


@onready var area_2d: Area2D = $Area2D

var current_item_type=item_types.YARN;

func _ready() -> void:


	area_2d.area_entered.connect(_on_area_2d_area_entered)
	area_2d.area_exited.connect(_on_area_2d_area_exited)
	current_item_type=item_types.YARN;

	pass # Replace with function body.


var introtext="\nhello, welcome to kitty town! \nsince this is a test I am going to keep this short
\nhello, welcome to kitty town! \nsince this is a test I am going to keep this short
\nhello, welcome to kitty town! \nsince this is a test I am going to keep this short
\nhello, welcome to kitty town! \nsince this is a test I am going to keep this short"




enum item_types{
	YARN=0,
	FINGER=1
}



var onetime_toggle=1;


func _on_area_2d_area_entered(area: Area2D) -> void:
	var radius=150;
	print("YARN COL!")
	#howner.state=howner.states.RECHARGE
	
	
	if area.is_in_group("player"):
		#print("PICKUP!")
		#self.queue_free()
		area.get_parent().current_interactable=self;
		control.open_mail_text()
		#tb1=(get_tree().get_root().get_node("game2/mailtext/box/text"))
		
		if(onetime_toggle):
			control.timed_feed(tb1, introtext, .01)
			onetime_toggle=0;




		
		
	
	
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



	

func context_action():
	control.complete_text(tb1,introtext)



func _on_area_2d_area_exited(area: Area2D) -> void:
	var radius=150;
	print("YARN COL!")
	#howner.state=howner.states.RECHARGE
	
	
	if area.is_in_group("player"):
		#print("PICKUP!")
		#self.queue_free()
		area.get_parent().current_interactable=null;
		control.open_mail_text()
		
		

	
	pass # Replace with function body.
