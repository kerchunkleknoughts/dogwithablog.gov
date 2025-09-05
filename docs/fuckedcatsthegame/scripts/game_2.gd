extends Node2D



@onready var control=$GameManager




var left_room_index=-1;
var right_room_index=-1;
var top_room_index=-1;
var bottom_room_index=-1;

var current_room_index=0;









# Called when the node enters the scene tree for the first time.
func _ready() -> void:

	control.insult_engine_init()
	pass # Replace with function body.



# Called every frame. 'delta' is the elapsed time since the previous frame.

func _process(delta: float) -> void:
	
	
	control.update_label();

	
	
	pass
