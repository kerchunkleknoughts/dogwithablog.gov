extends Node


var drugtime=false

var score =0

@onready var scorelabel=$Scorelabel


func add_point():
	
	score += 1
	print(score)
	#scorelabel.text="Drugs consumed: " + str(score)
