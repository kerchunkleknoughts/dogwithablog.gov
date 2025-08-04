extends Node



@onready var money_label=$"../moneylabel"

@onready var houses=$"../houses"






func money_change(change):
	GlobalVariables.money += 1
	#Global.score+=1
	
	#print("GLOBAL SCORE")
	#print(Global.score)
	print("Test")
	print(GlobalVariables.money)
	update_label()
	#create_house()
	

	#moneylabel.text="Drugs consumed: " + str(score)
	





func update_label():
	money_label.text=str(GlobalVariables.money)
	



func lloadsc(path,targetnode):
	var scene = load(path).instantiate()
	var origin = Vector2(1000, 800)
	scene.set_position(origin)
	targetnode.add_child(scene)





func report_node(targetnode):
	for child in targetnode.get_children():
		print(child.name)



func house_report():
	report_node(houses)





func create_house(xpos,ypos):
	
	var money_req=50;
	
	#this code creates a creature at the given position.
	#var house = preload("res://scenes/Creaturee2.tscn").instantiate()
	#var origin = Vector2(1000, 800)
	#house.set_position(origin)
	#add_child(house)
	
	if(GlobalVariables.money>=money_req):
		lloadsc("res://scenes/house.tscn",houses)
		GlobalVariables.money=0;
	
	update_label()
	#var house = preload("res://scenes/Creaturee2.tscn").instantiate()
	#var origin = Vector2(1000, 800)
	#house.set_position(origin)
	#add_child(house)



func find_vector_difference(node1,node2):
	
	#print(node1.position.x)
	#print(node1.position.y)
	
	var difx=node1.position.x-node2.position.x
	var dify=node1.position.y-node2.position.y
	
	var b = Vector2()
	b.x = difx
	b.y = dify
	
	return b
	
	
func find_angle(differencevector):
	var angle=atan(differencevector.y/differencevector.x)
	return angle;
	
	
	
	
	
	
func movenode(vect,node):
		#this function gives a node the 
		#passed xy velocity vector
	node.xvel=vect.x
	node.yvel=vect.y
	
	
func advancedmovetonode(mag,node1,node2):
	#this function takes a desired velocity magnitude, 
	#and calculates the x and y portions of
	#that velcity vector, and assigns 
	#the subject node that velocity. 
	var vectordif=self.find_vector_difference(node1,node2)
	var angle=self.find_angle(vectordif);
	var opposite=sin(angle)*mag;
	var adjacent=cos(angle)*mag;
	var b = Vector2()
	b.x = adjacent
	b.y = opposite
	self.movenode(b,node1)
	
	
func find_distance(node1,node2):
	var dv = Vector2()
	
	dv=find_vector_difference(node1,node2);
	var asq=(dv.x)^2
	var bsq=(dv.y)^2
	var csq=sqrt(asq+bsq)
	
	return csq
	
	
	
	
func check_building_collision(node1,building):
	#node 2 is the building
	var distance=find_distance(node1,building)
	if(distance<=building.col_radius):
		return true;
	else:
		return false;
	
	

		

		
		
		
		
		
		
		
		
		
		
		
