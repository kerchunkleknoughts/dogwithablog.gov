extends Node2D


@onready var sprite=$AnimatedSprite2D

@onready var ray_cast_right=$raycastright
@onready var ray_cast_left=$raycastleft2


const speed=70;

var direction=1;

var rng = RandomNumberGenerator.new()
var my_random_number = rng.randf_range(-10.0, 10.0)
	
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	
	my_random_number = rng.randf_range(-1, 10)
	my_random_number = floor(my_random_number)
	
	#print("random value!")
	#print(my_random_number)
	
	if(my_random_number >5):
		direction=direction*-1
		

	
	if ray_cast_right.is_colliding():
		direction=direction*-1;
	
		sprite.flip_h=true;
	
	if ray_cast_left.is_colliding():
		direction=direction*-1;
		sprite.flip_h=false;
	
	
	
	#direction=direction*my_random_number
	
	
	position.x+=direction*speed*delta;
	position.y+=direction*speed*delta;
