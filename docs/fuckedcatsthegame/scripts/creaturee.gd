extends Node2D


@onready var sprite=$AnimatedSprite2D

@onready var ray_cast_right=$raycastright
@onready var ray_cast_left=$raycastleft2


const speed=50;

var direction=1;


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if ray_cast_right.is_colliding():
		direction=direction*-1;
	
		sprite.flip_h=true;
	
	if ray_cast_left.is_colliding():
		direction=direction*-1;
		sprite.flip_h=false;
	
	
	
	position.x+=direction*speed*delta;
