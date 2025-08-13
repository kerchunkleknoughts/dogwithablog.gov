extends Node2D


@onready var anime=$AnimatedSprite2D
@onready var houses=get_tree().get_root().get_node("game2/houses")#$"../houses"
@onready var cafes=get_tree().get_root().get_node("game2/cafes")#$"../houses"

@onready var idle_move_timer: Timer =$idle_move_timer

@onready var idle_animate_timer: Timer =$idle_animation_timer


var ani_start=0;
var anime_switch_toggle=0;

var idle_move_timer_active=0;

var rnga = RandomNumberGenerator.new()
var my_random_numbera = rnga.randf_range(0, 100)


@onready var myhouse;

@onready var closest_cafe;


var state=states.WAIT;
#default state. equal to just waiting. This is evaluated every tick via the state machine eval function



@onready var ktid;

var idle_animation_timer_active=0;




enum mydirection{
	LEFT=0,
	RIGHT=1,
	STOPPED=2,
	VERTICAL=3
}

var currentdirection=mydirection.VERTICAL;

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





var anistate=anistates.IDLE;

var subanistate=subanistates.CENTER;


var health=10;
var healthmax=10;

var hunger=1200;
var hungermax=2000;
var hungermin=1100
var hunger_recharge_thresh=2000;

var sleep=1200;
var sleepmax=2000;
var sleepmin=1000;
var sleep_recharge_thresh=2000;
#sleepmin is the threshold that
#determines if npc navigates to 
#nearist station to regenerate sleep. 

var sleepvel=50;

var xvel=0;
var yvel=0;


var onticksleepdep=1;

var onticksleepadd=10;

var ontickhungerdep=2;

var ontickhungeradd=13;


#this is an array which is processed on a FCFS basis. 
var needfulfillment = [0,0,0]

#I guess this enum is literally 
enum needs{
	WATER=0,
	HUNGER=1,
	SLEEP=2,
}


var need_to_recharge=0;



@onready var control=get_tree().get_root().get_node("game2/GameManager")#$"../houses"



#@onready var houses=$"../houses"


#const speed=70;

var direction=1;

var rng = RandomNumberGenerator.new()
var my_random_number = rng.randf_range(-10.0, 10.0)
	
	
























































































func _ready() -> void:
	
	find_my_house()
	
	pass # Replace with function body.


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
	for child in cafes.get_children():
		
		var currentdist=control.find_distance(self,child)
		if(currentdist<shortest_distance):
			shortest_distance=currentdist;
			self.closest_cafe=child;
	
		cafe_count=cafe_count+1;
	
	#if(!(cafe_count==0)):
		#closest_cafe.daowner=self

func checkneeds():
	needfulfillment[needs.SLEEP]=checksleep();
	needfulfillment[needs.HUNGER]=checkhunger();


func evalneeds():
	
	
	print(str(needfulfillment[needs.WATER]))
	print(str(needfulfillment[needs.HUNGER]))
	print(str(needfulfillment[needs.SLEEP]))
	
	if(needfulfillment[needs.WATER]==1):
		var a 
		print("WATERNEED!!!!")
		
		need_to_recharge=needs.WATER;
	
			
		
	if(needfulfillment[needs.HUNGER]==1):
		
		print("HUNGERNEED!!!!")
		if(!(cafes.get_child_count()==0)):
			
			find_nearest_cafe();
			
			control.advancedmovetonode(sleepvel,self,self.closest_cafe)
			self.state=states.MOVING
			need_to_recharge=needs.HUNGER
			
		
		
	
	if(needfulfillment[needs.SLEEP]==1):
		
		print("SLEEPNEED!")
		
		
		
		if(!(houses.get_child_count()==0)):
			
			find_my_house()
			
			control.advancedmovetonode(sleepvel,self,self.myhouse)
			self.state=states.MOVING
			need_to_recharge=needs.SLEEP


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
	
	if(self.state==states.WAIT):
		evalphy(delta)
		
		#depsleep()
		#dephunger()
		idle_movement()
		
		checkneeds()
		evalneeds() #something is done about needs only if not currently fulfilling a need.
		sb_anime_change()
		
		
		self.visible=true;
	
	
	
	if(self.state==states.MOVING):
		evalphy(delta)
		
		
		depsleep()
		dephunger()
		
		
		checkneeds()
		sb_anime_change()
		self.visible=true;

		#evalneeds()
		#for now, only one need is served at a time. 
		#
		
		
		
	if(self.state==states.IDLEMOVE):
		
		idle_movement()
		
		evalphy(delta)
		
		
		depsleep()
		dephunger()
		
		
		checkneeds()
		sb_anime_change()
		self.visible=true;




	if(self.state==states.RECHARGE):
		self.xvel=0
		self.yvel=0
		
		if(need_to_recharge==needs.HUNGER):
			addhunger()
			
		
	
		if(need_to_recharge==needs.SLEEP):
			addsleep()
			
		evalphy(delta)
		checkneeds()
		
		self.visible=false;
	
	
		#!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!THIS IS THE RETURN FUNCTION, STATE RETURN!!!!!!!!!!	
		#add condition to return back to idle state:
		idle_check();
	

func idle_check():
	if(self.sleep>=sleep_recharge_thresh):
		self.state=self.states.WAIT
		
	if(self.hunger>=hunger_recharge_thresh):
		self.state=self.states.WAIT	
		
		
		

func evalphy(delta):
	position.x+=direction*self.xvel*delta;
	position.y+=direction*self.yvel*delta;

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
	
func change_state(changeto):
	self.state=changeto
