extends Node


@onready   var mutex = Mutex.new()
@onready var control=$GameManager

#anytime a cafe is being targeted, da owner changes to the kitty which is walking towards it. 
@onready var daowner;


@onready var kittys=get_tree().get_root().get_node("game2/kittys")

@onready var caid;

@onready var occupant_limit=2;
@onready var occupant_cnt=0;

@onready var ocntlabel=$ocnt

@onready var olimitlabel=$olimit

#@onready var house_hitbox=$CollisionShape2D
@onready var quedactions=0;
@onready var quedrems=0;
@onready var quedadds=0;
@onready var totaladds=0;
@onready var totalrems=0;


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	update_labels()
	#connect("body_entered", self, "_on_body_entered")
	pass # Replace with function body.



func update_labels():
	ocntlabel.text=str(occupant_limit)
	olimitlabel.text=str(occupant_cnt)
	pass




# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	
	#print("QUED ACTIONS: "+str(quedactions))
	#print("QUED ADDS: "+str(quedadds))
	#print("QUED REMS: "+str(quedrems))
	#print("OCCUPANT COUNT: " + str(occupant_cnt))
	
	update_labels()
	
	
	#untill I get this bug fixed, this will auto correct it. 
	#later I will use to stop the game so I can look at 
	#variables that lead to this issue. 
	if(totaladds==totalrems):
		if(occupant_cnt>0):			
			occupant_cnt=0;
			
	
	if(totaladds==totalrems):
		if(occupant_cnt<0):
			occupant_cnt=0;
			
	
	
	
	
	for count in quedadds:
		var a;
		
		mutex.lock()
		occupant_cnt=occupant_cnt+1;
		mutex.unlock()
		
		quedadds=quedadds-1;
		
		
		quedactions=quedactions-1;

	

	for count in quedrems:
		var a;
		
		mutex.lock()
		occupant_cnt=occupant_cnt-1;
		mutex.unlock()
		
		quedrems=quedrems-1;
		quedactions=quedactions-1;

	
	pass

	
	


#func _on_area_2d_area_entered(area: Area2D) -> void:
	
#	print("COL!")
#	GlobalVariables.kittyhome=1;
	
#	pass # Replace with function body.




func queoccadd():
	quedactions=quedactions+1;
	quedadds=quedadds+1;
	totaladds=totaladds+1
	pass
	
	
	
	
func queoccrem():
	quedactions=quedactions+1;
	quedrems=quedrems+1;
	totalrems=totalrems+1;
	pass









func _on_area_2d_area_entered(area: Area2D) -> void:
	var radius=100;
	print("COL!")
	

	
	
	
	#daowner.state=daowner.states.RECHARGE
	
	#loop through each npc and check if located in the cafe, if so, set to recharge. 
	
	
	if area.is_in_group("kitties"):
		
		
		queoccadd();
		
		print("KITTY COLLISION!!")
		
		daowner=area.get_parent();
		
		
		#if(((daowner.position.x<=self.position.x+radius)&&(daowner.position.x>=self.position.x-radius)) && ((daowner.position.y<=self.position.y+radius)&&(daowner.position.y>=self.position.y-radius))):
		
		if(occupant_cnt<occupant_limit):
			if(daowner.checkhunger()):
				daowner.state=daowner.states.RECHARGE
				daowner.building_type_currently_at=daowner.building_types.CAFE;
				#occupant_cnt=occupant_cnt+1;
				
				
				
	update_labels()
					
	pass # Replace with function body.


func _on_area_2d_area_exited(area: Area2D) -> void:
	if area.is_in_group("kitties"):
		queoccrem()
		update_labels();
	
	pass # Replace with function body.



func check_if_space_avaliable():
	if(occupant_cnt<occupant_limit):
		return true;
	else:
		return false;
