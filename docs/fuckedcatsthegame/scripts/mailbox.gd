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
\nhello, welcome to kitty town! \nsince this is a test I am going to keep this short
\n\n 
press e to e 
"

var text2="\nOhh lookee here looks like some nosey \nmother fucker wanted to know what was on page two! 
\n I swear to god if the prices for beef jerky\n keep going up I am going to hang myself. 
\n\n\n\n 
press e to e
"
var text3="
\nAnyways, if you are ever in the bartering spirit 
I am the obligitory game shopkeeper to purchase
your goods from!
\n\n\n\n 
press e to e
"


var menu_type=0;


var text_array=[introtext,text2,text3]

var text_index=0;



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
		
		eval_menus()
		#tb1=(get_tree().get_root().get_node("game2/mailtext/box/text"))
		
		if(onetime_toggle):
			control.timed_feed(tb1, text_array[text_index], .01)
			onetime_toggle=0;
			#onetime toggle prevents the same text from being added to itself again and again. 
			




		
		
	
	
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




	

var context_state=0;
var control_counter=0;




func context_action():
	
	
	if(control_counter==3):
		var a
		context_state=2;
		control_counter=0;	
		control.open_mail_text();
		control.open_ex_text();
		context_action();
		return;
		
	
	if(context_state==2):
		var a;
		menu_type=1;
		return;

	
	if(context_state==0):
		control.complete_text(tb1,text_array[text_index])
		context_state+=1;
		control_counter+=1;
		return;



	if(context_state==1):	
		if(control.get_node("feed_timer").is_stopped()):
			text_index+=1;
			control.erase_text(tb1);
			control.timed_feed(tb1, text_array[text_index], .01)
			
			#onetime_toggle=1;
			context_state=0;
		return;
	
	

	
	
func eval_menus():
		if(menu_type==0):
			control.open_mail_text()
		if(menu_type==1):
			control.open_ex_text()



func _on_area_2d_area_exited(area: Area2D) -> void:
	var radius=150;
	print("YARN COL!")
	#howner.state=howner.states.RECHARGE
	
	
	if area.is_in_group("player"):
		#print("PICKUP!")
		#self.queue_free()
		area.get_parent().current_interactable=null;
		
		eval_menus()
		
		
		
		

	
	pass # Replace with function body.
