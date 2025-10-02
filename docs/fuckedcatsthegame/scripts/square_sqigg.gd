extends Node2D


@onready var mypoly=$Polygon2D2


@onready var  bounding_poly=$bounding_poly







#$Polygon2D.to_global($Polygon2D.polygon[0])



@onready var timer: Timer=$squggimtimer


#@onready var death_timer: Timer =$deathtimer



# Called when the node enters the scene tree for the first time.
func _ready() -> void:



	timer.start();






	print(mypoly.to_global(mypoly.polygon[0]))
	print(mypoly.to_global(mypoly.polygon[1]))
	print(mypoly.to_global(mypoly.polygon[2]))
	print(mypoly.to_global(mypoly.polygon[3]))




	print("BOUNDING POLY POINTS LIST!")
	for points in bounding_poly.polygon.size():


		print(bounding_poly.polygon[points])




	print("BOUNDING POLY POINTS LIST!")
	for points in bounding_poly.polygon.size():
		print(bounding_poly.polygon[points])



	pass # Replace with function body.



@onready var rng = RandomNumberGenerator.new()
@onready var my_random_number = rng.randf_range(-10.0, 10.0)



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:






	pass



@onready var xoffset=100;
@onready var yoffset=100;

@onready var minxvalue=100;
@onready var maxxvalue=200;
@onready var maxyvalue=100;
@onready var minyvalue=200;




@onready var centerx=self.position.x;

@onready var centery=self.position.y;




#assuming the polygon is constant around a rectangle, 
#for stability purposes.


var counter=0;


func _on_squggimtimer_timeout() -> void:


	

	

	for points in mypoly.polygon.size():
		



		var addedval=Vector2( -1*sin(counter *(PI/10) ), 1*sin(counter *(PI/10) ))

		#sin()

		#print(addedval)

		mypoly.polygon[points] += addedval;

		counter+=1;



	pass # Replace with function body.
