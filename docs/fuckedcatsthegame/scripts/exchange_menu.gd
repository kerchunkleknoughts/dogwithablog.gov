extends Node2D

@onready var control=$GameManager


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
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
