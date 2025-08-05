extends Node2D


@onready var anime=$AnimatedSprite2D
@onready var houses=get_tree().get_root().get_node("game2/houses")#$"../houses"

@onready var myhouse;


var state=states.WAIT;
#default state. equal to just waiting. This is evaluated every tick via the state machine eval function


@onready var ktid;


enum states{
	WAIT=0,
	MOVING=1,
	RECHARGE=2
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


func change_state(changeto):
	self.state=changeto
	


var health=10;
var healthmax=10;

var hunger=50;
var hungermax=100;

var sleep=1200;
var sleepmax=17;
var sleepmin=1000;
#sleepmin is the threshold that
#determines if npc navigates to 
#nearist station to regenerate sleep. 

var sleepvel=50;

var xvel=0;
var yvel=0;


var onticksleepdep=1;

#this is an array which is processed on a FCFS basis. 
var needfulfillment = [0,0,0]

#I guess this enum is literally 
enum needs{
	WATER=0,
	HUNGER=1,
	SLEEP=2,
}


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
			












func report():
	#reporting function which returns attributes of current instance. 
	print("report of "+ str(self.name))
	print("health " + str(self.health))
	print("healthmax " + str(self.healthmax))
	print("sleep " + str(self.sleep))
	print("sleepmax " + str(self.sleepmax))
	print("hunger " + str(self.hunger))
	print("hungermax " + str(self.hungermax))
	print("x velocity "+ str(self.xvel))
	print("y velocity "+ str(self.yvel))




func depsleep():
	if(self.sleep>0):
		self.sleep=sleep-onticksleepdep




func checksleep():
	if(self.sleep<self.sleepmin):
		return 1;
	else:
		return 0;	
		






func checkneeds():
	needfulfillment[needs.SLEEP]=checksleep();



func evalneeds():
	if(needfulfillment[needs.HUNGER]==1):
		var a
	if(needfulfillment[needs.WATER]==1):
		var a 
	if(needfulfillment[needs.SLEEP]==1):
		var a 
		control.advancedmovetonode(sleepvel,self,self.myhouse)
		self.state=states.MOVING





func check_boxes():
	var a 
	#if(GlobalVariables.kittyhome==1):
	#	self.state=self.states.RECHARGE



var ani_start=0;






func anime_change():
	
	#print(self.subanistate)
	#print(anime.get("parameters/playback") )	
	
	
	if(self.anistate==anistates.IDLE):
		if(self.subanistate==subanistates.CENTER):
			
			anime.play("center")
			var rng = RandomNumberGenerator.new()
			var my_random_number = rng.randf_range(-10.0, 10.0)
			if(my_random_number >5):
				#print("GREATER THAN!")
				self.subanistate=subanistates.LEFTLOOK;
				
			if(my_random_number<5):
				#print("LESS THAN!")
				self.subanistate=subanistates.RIGHTLOOK;
			
			ani_start=1
				
				
				
				
		if(self.subanistate==subanistates.LEFTLOOK):
			ani_start=1
			
			if(!(anime.is_playing())):
				self.subanistate=subanistates.IVLEFTLOOK
				
		
			if(ani_start):
				anime.play("center_to_left")
				ani_start=0		
			
			
		if(self.subanistate==subanistates.RIGHTLOOK):
			ani_start=1
			
			if(!(anime.is_playing())):
				self.subanistate=subanistates.IVRIGHTLOOK
				
			if(ani_start):
				anime.play("center_to_right")
				ani_start=0		
			
			
			
		if(self.subanistate==subanistates.IVLEFTLOOK):
			ani_start=1
			
			if(!(anime.is_playing())):
				self.subanistate=subanistates.CENTER
				
				
			if(ani_start):
				anime.play("Left_to_center")
				ani_start=0		
			
		if(self.subanistate==subanistates.IVRIGHTLOOK):
			ani_start=1
			
			if(!(anime.is_playing())):
				self.subanistate=subanistates.CENTER
				
			
			if(ani_start):
				anime.play("Right_to_center")
				ani_start=0		
	
	#if(self.anistate==anistates.MOVEMENT):
		#anime.play("walk")
		
	#if(self.anistate==anistates.BLINK):
		#anime.play("blink")
		var a
		
	#if(self.anistate==anistates.CENTERLOOK):
		#var rng = RandomNumberGenerator.new()
		#var my_random_number = rng.randf_range(-10.0, 10.0)
		#if(my_random_number >5):
				
		#anime.play("blink")
		
	if(self.anistate==anistates.MOVEMENT):
		anime.play("walk")
				

		
		



func sb_anime_change():
	if(self.state==states.MOVING):
		self.anistate=anistates.MOVEMENT
	if(self.state==states.WAIT):
		self.anistate=anistates.IDLE;
	
	anime_change()




func evalstate(delta):
	if(self.state==states.WAIT):
		evalphy(delta)
		depsleep()
		checkneeds()
		evalneeds()
		sb_anime_change()
		self.visible=true;
	
	
	
	if(self.state==states.MOVING):
		evalphy(delta)
		depsleep()
		checkneeds()
		sb_anime_change()
		self.visible=true;

		#evalneeds()
		#for now, only one need is served at a time. 
		#
	if(self.state==states.RECHARGE):
		self.xvel=0
		self.yvel=0
		evalphy(delta)
		checkneeds()
		self.visible=false;
	
		






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
	
	

	
	
