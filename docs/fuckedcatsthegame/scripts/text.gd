extends Node2D


var expsec=-1;
#by default, the expiration time is -1, meaning that it does not expire.
#it will remain untill set to a valid time. 

@onready var text=$Label2

@onready var timerr=$Timer

var textval="insert text"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	text.text=textval;
	
	if(expsec>-1):
		timerr.wait_time=expsec;
		timerr.start()
		
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	
	
	pass





func _on_timer_timeout() -> void:
	
	self.queue_free()
	pass # Replace with function body.
