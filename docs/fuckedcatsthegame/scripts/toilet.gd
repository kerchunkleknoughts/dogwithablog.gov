extends "res://scripts/multkitty.gd"



@onready var animated_sprite=$cat_animation


func _ready() -> void:

	# OR
	super._ready()  # Godot 4.x

	# your child setup here
	hunger = 2000
	hungermax = 3000
	hungermin = 1500
	hungerdam = 200
	hunger_recharge_thresh = 3000

	sleep = 3000
	sleepmax = 4000
	sleepmin = 1500
	sleep_recharge_thresh = 4000

	find_my_house()








func _process(delta: float) -> void:
  

	# OR
	super._process(delta)  # Godot 4.x

	# extra child process logic here
	if xvel<0:
	
	
		animated_sprite.flip_h=false;

	
	elif xvel>0:
		animated_sprite.flip_h=true;











func talk_init():
	
	if(current_npc_type==npc_type.CATNPC):
			voicelines = [
		 

		"sigh.",
		"gurgle."

		
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





func yarn_summon_eval(outof):
	#generate a random number, then based on yarn summon odds determine if 
	#yarn should be summoned. 
	var rng = RandomNumberGenerator.new()
	var my_random_number = rng.randf_range(0, outof)
	if(yarn_summon_odds>my_random_number):
		control.new_tumor(self.position.x,self.position.y,current_npc_type)
		
