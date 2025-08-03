extends Node2D








var state=states.WAIT;
#default state. equal to just waiting. This is evaluated every tick via the state machine eval function


enum states{
	WAIT=0,
	MOVING=1,
	RECHARGE=2
}


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


@onready var control=$"../GameManager"
@onready var houses=$"../houses"


#const speed=70;

var direction=1;

var rng = RandomNumberGenerator.new()
var my_random_number = rng.randf_range(-10.0, 10.0)
	
	

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
		#print()
		for child in houses.get_children():
			
			control.advancedmovetonode(sleepvel,self,child)
			self.state=states.MOVING



func check_boxes():
	#if house_hitbox.is_colliding():
	#	self.state=states.RECHARGE
	var a 



func evalstate(delta):
	if(self.state==states.WAIT):
		evalphy(delta)
		depsleep()
		checkneeds()
		evalneeds()
		check_boxes()
	if(self.state==states.MOVING):
		evalphy(delta)
		depsleep()
		checkneeds()
		check_boxes()
		#evalneeds()
		#for now, only one need is served at a time. 
		#
	if(self.state==states.RECHARGE):
		self.xvel=0
		self.yvel=0
		evalphy(delta)
		checkneeds()




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
	
	
