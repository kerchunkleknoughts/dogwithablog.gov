extends Node2D


var expsec=-1;
#by default, the expiration time is -1, meaning that it does not expire.
#it will remain untill set to a valid time. 

@onready var text=$Label2

@onready var timerr=$Timer

var textval="insert text"

@onready var xvel=0;
@onready var yvel=0;

# Called when the node enters the scene tree for the first time.

@onready var textmode=0;

func _ready() -> void:
	

	text.text=textval;
	
	if(expsec>-1):
		timerr.wait_time=expsec;
		timerr.start()
		
	
	pass # Replace with function body.






@onready var rng = RandomNumberGenerator.new()
@onready var my_random_number = rng.randf_range(0, 1)

var count=0;

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	


	if(textmode==0):
		self.position.x+=xvel;
		self.position.y+=yvel;
	
	if(textmode==1):
		self.position.x+=2*cos(xvel *(PI/10) );
		self.position.y+=2*sin(yvel *(PI/10) );

	if(textmode==2):

		
		
		#for letter in text.text:
		#	text.text[letter]
		self.position.x+=xvel;
		self.position.y+=yvel;



		var rng = RandomNumberGenerator.new()

		count= rng.randf_range(0, 1000)

		count+=1;

		if(count<50):
			my_random_number = rng.randf_range(0, 1)


		#flickers white and black
		#text.set("theme_override_colors/font_color",Color(my_random_number,my_random_number,my_random_number,my_random_number))
		
		

		text.set("theme_override_colors/font_color",Color(my_random_number,0,0,my_random_number))



	pass





func _on_timer_timeout() -> void:
	
	self.queue_free()
	pass # Replace with function body.
