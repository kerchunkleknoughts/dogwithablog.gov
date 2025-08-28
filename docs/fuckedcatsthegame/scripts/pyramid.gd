extends "res://scripts/multkitty.gd"


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
