extends Node2D




#!!!!!!!!!!!!!!!!!!!!!!!!!!!!TO CONVERT GIFS INTO SPRITESHEETS!!!::::::: https://ezgif.com/gif-to-sprite/ezgif-4eb7ff1703391.gif
#untill I figure out a better way to do this that doesnt involve a website.


@onready var houses=get_tree().get_root().get_node("game2/houses")#$"../houses"
@onready var cafes=get_tree().get_root().get_node("game2/cafes")#$"../houses"

@onready var idle_move_timer: Timer =$idle_move_timer

@onready var idle_animate_timer: Timer =$idle_animation_timer

@onready var death_timer: Timer =$deathtimer


@onready var ani_start=0;
@onready var anime_switch_toggle=0;

@onready var idle_move_timer_active=0;

@onready var rnga = RandomNumberGenerator.new()
@onready var my_random_numbera = rnga.randf_range(0, 100)


@onready var myhouse;

@onready var closest_cafe;


@onready var state=states.WAIT;
#default state. equal to just waiting. This is evaluated every tick via the state machine eval function




@onready var ktid;

@onready var idle_animation_timer_active=0;

@onready var yarn_summon_odds=5
#this is the chance that a kitty will summon yarn
#each tick. 
#this is out of a hundred.




enum mydirection{
	LEFT=0,
	RIGHT=1,
	STOPPED=2,
	VERTICAL=3
}

@onready var currentdirection=mydirection.VERTICAL;






@onready var anistate=anistates.IDLE;

@onready var subanistate=subanistates.CENTER;


@onready var health=10;
@onready var healthmax=10;
@onready var healthmin=0;

@onready var isdead=0;






@onready var hunger=10000;
@onready var hungermax=2000;
@onready var hungermin=9999;
#var hungerdam=900;
@onready var hungerdam=200
#this is the hunger at which starvation occurs, and health is reduced. 
@onready var hunger_recharge_thresh=10500;
	





@onready var sleep=1200;
@onready var sleepmax=2000;
@onready var sleepmin=1000;
@onready var sleep_recharge_thresh=2000;
#sleepmin is the threshold that
#determines if npc navigates to 
#nearist station to regenerate sleep. 

@onready var sleepvel=50;

@onready var xvel=0;
@onready var yvel=0;


@onready var onticksleepdep=1;

@onready var onticksleepadd=10;

@onready var ontickhungerdep=2;

@onready var ontickhungeradd=13;


#this is an array which is processed on a FCFS basis. 
@onready var needfulfillment = [0,0,0]

#I guess this enum is literally 
enum needs{
	WATER=0,
	HUNGER=1,
	SLEEP=2,
}


enum building_types{
	OUTSIDE=0,
	HOME=1,
	CAFE=2,
	
}


enum states{
	WAIT=0,
	MOVING=1,
	RECHARGE=2,
	IDLEMOVE=3,
}



enum anistates{
	IDLE=1,
	MOVEMENT=2
	
}


enum subanistates{
	BLINK=1,
	LEFTLOOK=2,
	RIGHTLOOK=3,
	IVLEFTLOOK=4,
	IVRIGHTLOOK=5,
	LEFTMOVE=6,
	RIGHTMOVE=7,
	CENTER=8,
	
}



@onready var need_to_recharge=0;



@onready var control=get_tree().get_root().get_node("game2/GameManager")#$"../houses"



#@onready var houses=$"../houses"


#const speed=70;

@onready var direction=1;

@onready var rng = RandomNumberGenerator.new()
@onready var my_random_number = rng.randf_range(-10.0, 10.0)
	
	




@onready var building_type_currently_at=building_types.OUTSIDE;

@onready var talk_odds=5



@onready var catanimation=$cat_animation
@onready var doughanimation=$dough_animation
@onready var deathanimation=$death_animation
@onready var pyramid_animation=$pyramid_animation


enum npc_type{
	CATNPC=0,
	DOUGHNPC=1,
	PYRAMID=2,
	
}

@onready var current_npc_type=npc_type.CATNPC


@onready var anime=$cat_animation




























 














func _ready() -> void:
	
	
	idle_move_timer.timeout.connect(_on_idle_move_timer_timeout)
	idle_animate_timer.timeout.connect(_on_idle_animation_timer_timeout)
	death_timer.timeout.connect(_on_deathtimer_timeout)


	hunger=2000;
	hungermax=3000;
	hungermin=1500;
	#value at which npc seeks out cafe
	
		#var hungerdam=900;
	hungerdam=200
		#this is the hunger at which starvation occurs, and health is reduced. 
	hunger_recharge_thresh=3000;
		
		
	sleep=3000;
	sleepmax=4000;
	sleepmin=1500;
	#value at which npc seeks out home.
	
	sleep_recharge_thresh=4000;
	
	
	find_my_house()
	
	pass # Replace with function body.





# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	#my_random_number = rng.randf_range(-1, 10)
	#my_random_number = floor(my_random_number)
	
	#print("random value!")
	#print(my_random_number)
	
	#if(my_random_number >5):
	#	direction=direction*-1
		
	#direction=direction*my_random_number

	
	#run physical processes on the creature :)
	
	
	evalstate(delta)
	
	pass
	
	








enum initstates
{
NEVER_STAVE_ALWAYS_HUNGRY=0,
REGULAR_GAMEPLAY=1,
	
}



@onready var needdebugvariable=initstates.REGULAR_GAMEPLAY;

func kitty_init():
	

	if(needdebugvariable==initstates.NEVER_STAVE_ALWAYS_HUNGRY):
	
		hunger=10000;
		hungermax=2000;
		hungermin=9999;
		#var hungerdam=900;
		hungerdam=200
		#this is the hunger at which starvation occurs, and health is reduced. 
		hunger_recharge_thresh=10500;
			


	if(needdebugvariable==initstates.REGULAR_GAMEPLAY):
	
		hunger=2000;
		hungermax=3000;
		hungermin=12;
		#var hungerdam=900;
		hungerdam=200
		#this is the hunger at which starvation occurs, and health is reduced. 
		hunger_recharge_thresh=1500;
			

	pass




@onready var voicelines = [
	 
	"where am I?",
	 "I want to go back to bed",
	 "fucking hell...",
	 "...",
	 "what time is it?",
	 "meow.",
	 "I want dinner."	
	]



func talk():
	
	var rng = RandomNumberGenerator.new()
	var my_random_number = rng.randf_range(0, voicelines.size())
	#inclusive of min, exclusive of max (like most floating-point RNGs).
	
	var rando_talk = rng.randf_range(0, 1000)
	
	if(talk_odds>rando_talk):
		control.new_text(self.position.x,self.position.y-50,1,voicelines[my_random_number])
		


func talk_init():
	
	if(current_npc_type==npc_type.CATNPC):
			voicelines = [
		 

		 
	"where am I?",
	 "I want to go back to bed",
	 "fucking hell...",
	 "...",
	 "what time is it?",
	 "meow.",
	 "I want dinner."	
		
		]
	
	
	if(current_npc_type==npc_type.DOUGHNPC):
		voicelines = [
	 

	 
	 "I want blood.",
	 "I need to get my toaster repaired.",
	"What a lovely day!",	
	"Cant wait for sundays service!",
	"Boy! what a nice lawn!",
	"I wonder what the joneses are up to?"
	
	
	]
	
	
	if(current_npc_type==npc_type.PYRAMID):
		voicelines = [
	 

	 
	 "J'ai hâte de rentrer à la maison et de regarder The Mighty Morphin Power Rangers: The Movie (1995)",
	 "Bon sang, on dirait que j'ai encore perdu mon bébé",
	 "mais sérieusement, qui coupe les cheveux des coiffeurs ?",
	"J'aimerais vraiment être un chien",
	"Je pourrais aller manger de la soupe tout de suite"
	
	
	]







func animation_init():
		
	deathanimation.visible=false;	
		
	talk_init()
	
	if(current_npc_type==npc_type.CATNPC):
			catanimation.visible=true;
			anime=catanimation
	else:
			catanimation.visible=false;
		
		
		
	if(current_npc_type==npc_type.DOUGHNPC):
			doughanimation.visible=true;
			anime=doughanimation
	else:
			doughanimation.visible=false;
			
	
	if(current_npc_type==npc_type.PYRAMID):
		pyramid_animation.visible=true;
		anime=pyramid_animation
	else:
			pyramid_animation.visible=false;
		


func find_my_house():
		for child in houses.get_children():
			if(child.hid==self.ktid):
				self.myhouse=child
				self.myhouse.howner=self
			

func report():
	#reporting function which returns attributes of current instance. 
	print("                             ")
	print("                             ")
	print("report of "+ str(self.name))
	print("health " + str(self.health))
	print("healthmax " + str(self.healthmax))
	print("sleep " + str(self.sleep))
	print("sleepmax " + str(self.sleepmax))
	print("hunger " + str(self.hunger))
	print("hungermax " + str(self.hungermax))
	print("x velocity "+ str(self.xvel))
	print("y velocity "+ str(self.yvel))
	print("State: "+ str(self.state))
	print("anistate: "+ str(self.anistate))
	print("subanistate: "+ str(self.subanistate))
	print("Current need to fulfill: "+ str(need_to_recharge))
	




func depsleep():
	if(self.sleep>0):
		self.sleep=self.sleep-onticksleepdep


func dephunger():
	if(self.hunger>0):
		self.hunger=self.hunger-self.ontickhungerdep

func addsleep():
	self.sleep=self.sleep+onticksleepadd

func addhunger():
	self.hunger=self.hunger+ontickhungeradd

func checksleep():
	if(self.sleep<self.sleepmin):
		return 1;
	else:
		return 0;	
		

func checkhunger():
	if(self.hunger<self.hungermin):
		return 1;
	else:
		return 0;	
		

func find_nearest_cafe():
	
	#This is just a simple linear search, 
	#but if needed this will become a
	#binary search in the future. 
	
	var cafe_count=0;
	var shortest_distance=100000000000;
	var cafe_found=0;
	
	for child in cafes.get_children():
		
		var currentdist=control.find_distance(self,child)
		if(currentdist<shortest_distance):
			shortest_distance=currentdist;
			
			if(child.check_if_space_avaliable()):
				self.closest_cafe=child;
				cafe_found=1;
	
		cafe_count=cafe_count+1;
		
	
	
	
	#if(!(cafe_count==0)):
		#closest_cafe.daowner=self
	if(!(cafe_found)):
		
		#if a cafe is not found, pick furthest anyway and walk towards it. 
		#this will lead to either a death condition, or by then the cafe
		#will have occupancy. I am picking the furthest because this 
		#gives pawns a chance to free up cafe space. 
		#if village is completely overloaded, that is players fault and the npc will die. 
		
		for child in cafes.get_children():
			self.closest_cafe=child;


func checkneeds():
	needfulfillment[needs.SLEEP]=checksleep();
	needfulfillment[needs.HUNGER]=checkhunger();
	checkstarve();




func goto_nearest_cafe():
	var a;
	if(!(cafes.get_child_count()==0)):
			
			find_nearest_cafe();
			
			
			var isright=0
			isright=control.advancedmovetonode(sleepvel,self,self.closest_cafe)
			
			if(isright):
				
				self.currentdirection=self.mydirection.RIGHT
			else:
				self.currentdirection=self.mydirection.LEFT
			
			self.state=states.MOVING
			need_to_recharge=needs.HUNGER
	return;
	
	
	
func goto_nearest_chest():
	var a;
	if(!(cafes.get_child_count()==0)):
			
			find_nearest_cafe();
			
			
			var isright=0
			isright=control.advancedmovetonode(sleepvel,self,self.closest_cafe)
			
			if(isright):
				
				self.currentdirection=self.mydirection.RIGHT
			else:
				self.currentdirection=self.mydirection.LEFT
			
			self.state=states.MOVING
			need_to_recharge=needs.HUNGER
	return;




func evalneeds():
	
	

	#print(str(needfulfillment[needs.WATER]))
	#print(str(needfulfillment[needs.HUNGER]))
	#print(str(needfulfillment[needs.SLEEP]))
	
	
	if(needfulfillment[needs.WATER]==1):
		var a 
	#	print("WATERNEED!!!!")
		
		need_to_recharge=needs.WATER;
		
			
	
	
	
	if(needfulfillment[needs.HUNGER]==1):
		
	#	print("HUNGERNEED!!!!")
	
		goto_nearest_cafe();
		
		return;

		
		
	
	if(needfulfillment[needs.SLEEP]==1):
		
	#	print("SLEEPNEED!")
		
		
		
		if(!(houses.get_child_count()==0)):
			if(!(self.myhouse==null)):
				find_my_house()
				
				control.advancedmovetonode(sleepvel,self,self.myhouse)
				self.state=states.MOVING
				need_to_recharge=needs.SLEEP

		return;

		

	



func check_boxes():
	var a 
	#if(GlobalVariables.kittyhome==1):
	#	self.state=self.states.RECHARGE


func anime_change():
	
	
	
	#print(self.subanistate)
	#print(anime.get("parameters/playback") )	
	
	
	
	if(self.anistate==anistates.IDLE):
		
		if(anime_switch_toggle==1):
			anime_switch_toggle=0;
			anime.play("center")

				
				
				
				
				
		if(self.subanistate==subanistates.LEFTLOOK):
			
			
			if((ani_start==0) && !(anime.is_playing())):
				anime.play("center_to_left")
				ani_start=ani_start+1;
				
			if((ani_start==1) && !(anime.is_playing())):
				self.subanistate=subanistates.IVLEFTLOOK
				ani_start=0;
				
				
			

			
				
		

		if(self.subanistate==subanistates.RIGHTLOOK):
			
			if((ani_start==0) && !(anime.is_playing())):
				anime.play("center_to_right")
				ani_start=ani_start+1;
				
			if((ani_start==1) && !(anime.is_playing())):
				self.subanistate=subanistates.IVRIGHTLOOK
				ani_start=0;
				

			
			
		if(self.subanistate==subanistates.IVLEFTLOOK):

			if((ani_start==0) && !(anime.is_playing())):
				anime.play("Left_to_center")
				ani_start=ani_start+1;
				
			if((ani_start==1) && !(anime.is_playing())):
				self.subanistate=subanistates.CENTER
				ani_start=0;
							
			
			
			
		if(self.subanistate==subanistates.IVRIGHTLOOK):

			if((ani_start==0) && !(anime.is_playing())):
				anime.play("Right_to_center")
				ani_start=ani_start+1;
				
			if((ani_start==1) && !(anime.is_playing())):
				self.subanistate=subanistates.CENTER
				ani_start=0;
							
			


		if(self.subanistate==subanistates.BLINK):

			if((ani_start==0) && !(anime.is_playing())):
				anime.play("blink")
				ani_start=ani_start+1;
				
			if((ani_start==1) && !(anime.is_playing())):
				self.subanistate=subanistates.CENTER
				ani_start=0;
							



		if(self.subanistate==subanistates.CENTER):
			ani_start=0
			anime.play("center")
			var rng = RandomNumberGenerator.new()
			var my_random_number = rng.randf_range(0, 10)
			
			#print("RANDO NUM:"+ str(my_random_number))
			
			if(my_random_number <3):
				#print("GREATER THAN!")
				self.subanistate=subanistates.LEFTLOOK;
			else:
			
				if(my_random_number<6):
					#print("LESS THAN!")
					self.subanistate=subanistates.RIGHTLOOK;
					
				else:
					
					if(my_random_number<9):
						self.subanistate=subanistates.BLINK;
						#print("OTHER!")
					
					
			
	#if(self.anistate==anistates.MOVEMENT):
		#anime.play("walk")
		
	#if(self.anistate==anistates.BLINK):
		#anime.play("blink")

		
	#if(self.anistate==anistates.CENTERLOOK):
		#var rng = RandomNumberGenerator.new()
		#var my_random_number = rng.randf_range(-10.0, 10.0)
		#if(my_random_number >5):
				
		#anime.play("blink")
		
	if(self.anistate==anistates.MOVEMENT):
		
		if(anime_switch_toggle==0):
			anime_switch_toggle=1;
			anime.play("center")
		
		
		if(self.currentdirection==self.mydirection.LEFT):
			anime.play("lefty_walk")
		if(self.currentdirection==self.mydirection.RIGHT):
			anime.play("righty_walk")
		if(self.currentdirection==self.mydirection.VERTICAL):
			anime.play("walk")
		
		

func sb_anime_change():
	if(self.state==states.MOVING):
		self.anistate=anistates.MOVEMENT
		
		
	if(self.state==states.IDLEMOVE):
		self.anistate=anistates.MOVEMENT
		
		
	if(self.state==states.WAIT):
		self.anistate=anistates.IDLE;
		
	
	anime_change()


func idle_movement():
	
	var velo=50;
	var diags=5;
	

	
	#var movementen=0
	var rng = RandomNumberGenerator.new()
	var my_random_number = rng.randf_range(0, 10)
	
	
	
	if((my_random_number <5) && (idle_move_timer_active==0) && (idle_animation_timer_active==0) ):
		#movementen=1;
		#print("timer activated!")
		
		idle_move_timer.start()
		idle_move_timer_active=1;
		my_random_numbera = rnga.randf_range(0, 100)
	
	
	else:
		if(idle_animation_timer_active==0):
			idle_animate_timer.start()
		idle_animation_timer_active=1;
		
		
		
	
	
	
	
	
	
	if(idle_move_timer_active):
		self.state=self.states.IDLEMOVE;
		
		if(my_random_numbera<=25):
			#print("case1")
			control.movenode(Vector2(velo,0),self); 
			self.currentdirection=self.mydirection.LEFT
			
		else:
			if(my_random_numbera<=50):
				control.movenode(Vector2(0,velo),self); 
				self.currentdirection=self.mydirection.VERTICAL
				#print("case2")
			else:
				
				if(my_random_numbera<=75):
					control.movenode(Vector2(0,velo*-1),self); 
					self.currentdirection=self.mydirection.VERTICAL
					#print("case3")
				else:
					
					
					if(my_random_numbera<=100):
						control.movenode(Vector2(velo*-1,0),self); 
						self.currentdirection=self.mydirection.RIGHT
						#print("case4")
						
	else:
		#print("no movee 4 u")
		control.movenode(Vector2(0,0),self); 
		self.state=self.states.WAIT

func _on_idle_move_timer_timeout() -> void:
	idle_move_timer_active=0;
	pass # Replace with function body.

func _on_idle_animation_timer_timeout() -> void:
	idle_animation_timer_active=0;
	#print("timeout!")
	pass # Replace with function body.

func evalstate(delta):
	
	#self.report()
	
	talk()
	
	if(self.state==states.WAIT):
		evalphy(delta)
		
		#depsleep()
		#dephunger()
		idle_movement()
		yarn_summon_eval(1000)
		
		checkneeds()
		evalneeds() #something is done about needs only if not currently fulfilling a need.
		sb_anime_change()
		
		
		self.visible=true;
	
		lossconditioneval()
	
	
	if(self.state==states.MOVING):
		
		evalphy(delta)
		
		
		depsleep()
		dephunger()
		checkneeds()
		
		
		
		sb_anime_change()
		self.visible=true;


		
		
		#check if npc should die while moving to a building.
		lossconditioneval()
		
		building_check()
		
		
	if(self.state==states.IDLEMOVE):
		
		
		
		idle_movement()
		
		evalphy(delta)
		
		
		depsleep()
		dephunger()
		yarn_summon_eval(1000)
		
		
		checkneeds()
		sb_anime_change()
		self.visible=true;


		lossconditioneval()


	if(self.state==states.RECHARGE):
		self.xvel=0
		self.yvel=0
		
		
		if(building_type_currently_at==building_types.CAFE):
			addhunger()
			
		
	
		if(building_type_currently_at==building_types.HOME):
			addsleep()
			
			
		evalphy(delta)
		checkneeds()
		
		self.visible=false;
	
	
		#!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!THIS IS THE RETURN FUNCTION, STATE RETURN!!!!!!!!!!	
		#add condition to return back to idle state:
		idle_check();
	
	
		



func idle_check():
	
	talk_init();
	
	if(self.sleep>=sleep_recharge_thresh):
		self.state=self.states.WAIT
		
	if(self.hunger>=hunger_recharge_thresh):
		
		#find_nearest_cafe();
		#I am not sure why but at this point sometimes 
		#npc will lose their reference to the nearest cafe, 
		#so for the time being, run the function again I guess. 
		
		
		#if(!(closest_cafe==null)):
		#	var a
			
			
		#closest_cafe.occupant_cnt=closest_cafe.occupant_cnt-1;
		#closest_cafe.queoccrem()
		#closest_cafe.update_labels();
		
		self.state=self.states.WAIT	
		
		

func evalphy(delta):
	position.x+=direction*self.xvel*delta;
	position.y+=direction*self.yvel*delta;


func change_state(changeto):
	self.state=changeto



func yarn_summon_eval(outof):
	#generate a random number, then based on yarn summon odds determine if 
	#yarn should be summoned. 
	var rng = RandomNumberGenerator.new()
	var my_random_number = rng.randf_range(0, outof)
	if(yarn_summon_odds>my_random_number):
		control.new_yarn(self.position.x,self.position.y,current_npc_type)
		
		
		
func lossconditioneval():
	
	checkhealth()
	eval_death()
		
		
func checkstarve():
	if(hunger<hungerdam):
		health=health-1;

func checkhealth():
	if(health<healthmin):
		isdead=1;


@onready var deathtoggle=1;
func eval_death():
	if(isdead==1):
		if(deathtoggle==1):
			death_timer.start()
			deathtoggle=0;
		
		deathanimation.visible=true
		deathanimation.play("explode")
		
		


func building_check():
	
	var a 
	#this function checks if the building that 
	#an npc is navigating to is still available to 
	#accommodate the npc.
	
	if(need_to_recharge==needs.HUNGER):
			
		if(!(closest_cafe.check_if_space_avaliable())):
			var aa 
			find_nearest_cafe()
			
			#reposition to next cafe
			
			var isright=0
			isright=control.advancedmovetonode(sleepvel,self,self.closest_cafe)
			
			if(isright):
				
				self.currentdirection=self.mydirection.RIGHT
			else:
				self.currentdirection=self.mydirection.LEFT
			
			self.state=states.MOVING
			need_to_recharge=needs.HUNGER
			
			
		



func _on_deathtimer_timeout() -> void:
	self.queue_free()	
	pass # Replace with function body.
