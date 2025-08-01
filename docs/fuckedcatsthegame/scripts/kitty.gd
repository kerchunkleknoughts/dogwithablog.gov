extends Node2D


var health=10;
var healthmax=10;

var hunger=50;
var hungermax=100;

var sleep=1200;
var sleepmax=17;


var onticksleepdep=1;



@onready var control=$"../GameManager"



const speed=70;

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



func depsleep():
	if(self.sleep>0):
		self.sleep=sleep-onticksleepdep








# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	
	#my_random_number = rng.randf_range(-1, 10)
	#my_random_number = floor(my_random_number)
	
	#print("random value!")
	#print(my_random_number)
	
	#if(my_random_number >5):
	#	direction=direction*-1
		

	#direction=direction*my_random_number
	
	#position.x+=direction*speed*delta;
	#position.y+=direction*speed*delta;
	
	
	
	
	
	#run physical processes on the creature :)
	depsleep()
	
	
