extends Node2D


@onready var death_timer: Timer =$deathtimer
@onready var animation=$animation
@onready var animation_to_play=0;
var waittime;



@onready var animation_array=["explode"]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:



	death_timer.wait_time=waittime;

	animation.play(animation_array[animation_to_play])
	
	death_timer.start();

	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass






func _on_deathtimer_timeout() -> void:
	self.queue_free()	
	pass # Replace with function body.
