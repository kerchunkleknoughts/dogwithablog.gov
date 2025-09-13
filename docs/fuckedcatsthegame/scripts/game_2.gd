extends Node2D



@onready var control=$GameManager


@onready var mf=$money_to_finger
@onready var fc=$finger_to_cig


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






func _on_money_to_finger_pressed() -> void:
	
	print("AAHAHAH ITS PRESSED!")
	
	control.currency_transfer(0, 1)
	
	
	pass # Replace with function body.





func _on_finger_to_cig_pressed() -> void:
	print("AAHAHAH ITS PRESSED!")
	
	control.currency_transfer(1, 1)
	
	
	pass # Replace with function body.




func _on_cig_to_tumor_pressed() -> void:
	print("AAHAHAH ITS PRESSED!")
	
	control.currency_transfer(2, 1)
	
	
	pass # Replace with function body.
