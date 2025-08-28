extends Node



@onready var money_label=get_tree().get_root().get_node("game2/moneylabel")#$"../moneylabel"

@onready var houses=get_tree().get_root().get_node("game2/houses")#$"../houses"

@onready var kittys=get_tree().get_root().get_node("game2/kittys")#$"../houses"


@onready var cafes=get_tree().get_root().get_node("game2/cafes")#$"../houses"

@onready var yarnballs=get_tree().get_root().get_node("game2/yarnballs")#$"../houses"


@onready var c1ml=get_tree().get_root().get_node("control1/drugs/c1moneylabel")


@onready var text=get_tree().get_root().get_node("game2/text")

func money_change(change):
	GlobalVariables.money += change
	#Global.score+=1
	
	#print("GLOBAL SCORE")
	#print(Global.score)
	print("Test")
	print(GlobalVariables.money)
	update_label()
	#create_house()
	

	#moneylabel.text="Drugs consumed: " + str(score)
	

@onready var finger_label=get_tree().get_root().get_node("game2/fingerlabel")#$"../moneylabel"

@onready var cig_label=get_tree().get_root().get_node("game2/ciglabel")#$"../moneylabel"




func update_label():

	
	if(!(money_label==null)):
		money_label.text=str(GlobalVariables.money)
	
	if(!(finger_label==null)):
		finger_label.text=str(GlobalVariables.fingers)
	

	if(!(cig_label==null)):
		cig_label.text=str(GlobalVariables.cigs)
	
	
	
	if(!(c1ml==null)):
		c1ml.text=str(GlobalVariables.money)


	



func lloadsc(path,targetnode):
	var scene = load(path).instantiate()
	var origin = Vector2(1000, 800)
	scene.set_position(origin)
	targetnode.add_child(scene)



func new_house(xpos,ypos,housetype):
	#this function will create a new house, then 
	#it will update the house id, then store it in the houses array.
	var path="res://scenes/multhouse.tscn"
	var targetnode=houses
	#print("here2!")
	var scene = load(path).instantiate()
	

	
	var origin = Vector2(xpos, ypos)
	scene.set_position(origin)
	#print("here1!")
	scene.hid=GlobalVariables.h_id_counter;
	GlobalVariables.h_id_counter=GlobalVariables.h_id_counter+1
	targetnode.add_child(scene)
	print("scene hid"+str(scene.hid))
	print("global hid"+ str(GlobalVariables.h_id_counter))
	#print("here3!")
	
	
	
	scene.currenthousetype=housetype;
	scene.animation_init()





	
func new_ramid_house(xpos,ypos,housetype):
	#this function will create a new house, then 
	#it will update the house id, then store it in the houses array.
	var path="res://scenes/ramidhouse.tscn"
	var targetnode=houses
	#print("here2!")
	var scene = load(path).instantiate()
	

	
	var origin = Vector2(xpos, ypos)
	scene.set_position(origin)
	#print("here1!")
	scene.hid=GlobalVariables.h_id_counter;
	GlobalVariables.h_id_counter=GlobalVariables.h_id_counter+1
	targetnode.add_child(scene)
	print("scene hid"+str(scene.hid))
	print("global hid"+ str(GlobalVariables.h_id_counter))
	#print("here3!")
	
	
	
	scene.currenthousetype=housetype;
	scene.animation_init()


	







func new_cafe(xpos,ypos,cafe_type):
	#this function will create a new house, then 
	#it will update the house id, then store it in the houses array.
	var path="res://scenes/cafe.tscn"
	var targetnode=cafes
	#print("here2!")
	var scene = load(path).instantiate()
	var origin = Vector2(xpos, ypos)
	scene.set_position(origin)
	#print("here1!")
	scene.caid=GlobalVariables.ca_id_counter;
	GlobalVariables.ca_id_counter=GlobalVariables.ca_id_counter+1
	targetnode.add_child(scene)
	print("scene hid"+str(scene.caid))
	print("global hid"+ str(GlobalVariables.ca_id_counter))
	#print("here3!")
	scene.current_building_type=cafe_type;
	scene.sprite_init();


func new_text(xpos,ypos,expsec,textval):
	#this function will create a new house, then 
	#it will update the house id, then store it in the houses array.
	var path="res://scenes/text.tscn"
	var targetnode=text
	#print("here2!")
	var scene = load(path).instantiate()
	var origin = Vector2(xpos, ypos)
	scene.set_position(origin)
	#print("here1!")
	scene.expsec=expsec
	scene.textval=textval
	targetnode.add_child(scene)
	





func new_cat(xpos,ypos,npctype):
	var path="res://scenes/multkitty.tscn"
	var targetnode=kittys
	#print("here2!")
	var scene = load(path).instantiate()
	var origin = Vector2(xpos, ypos)
	scene.set_position(origin)
	#print("here1!")
	scene.ktid=GlobalVariables.ki_id_counter;
	GlobalVariables.ki_id_counter=GlobalVariables.ki_id_counter+1
	targetnode.add_child(scene)
	print("scene hid"+str(scene.ktid))
	print("global hid"+ str(GlobalVariables.ki_id_counter))
	
	
	scene.current_npc_type=npctype
	scene.animation_init()
	
	
	#I have no fucking clue why this causes the building check function to crash, 
	#this for whatever reason makes the npc have a null pointer to the cafe. 
	# why am I cursed with such incomprehensible bugs? 
	# did I do something horrible in a past life and I am now just 
	# paying for it? 
	
	#scene.kitty_init();
	
	pass





func new_pyramid(xpos,ypos,npctype):
	var path="res://scenes/pyramid.tscn"
	var targetnode=kittys
	#print("here2!")
	var scene = load(path).instantiate()
	var origin = Vector2(xpos, ypos)
	scene.set_position(origin)
	#print("here1!")
	scene.ktid=GlobalVariables.ki_id_counter;
	GlobalVariables.ki_id_counter=GlobalVariables.ki_id_counter+1
	targetnode.add_child(scene)
	print("scene hid"+str(scene.ktid))
	print("global hid"+ str(GlobalVariables.ki_id_counter))
	
	
	scene.current_npc_type=npctype
	scene.animation_init()
	
	
	#I have no fucking clue why this causes the building check function to crash, 
	#this for whatever reason makes the npc have a null pointer to the cafe. 
	# why am I cursed with such incomprehensible bugs? 
	# did I do something horrible in a past life and I am now just 
	# paying for it? 
	
	#scene.kitty_init();
	
	pass



func report_node(targetnode):
	for child in targetnode.get_children():
		print(child.name)



func house_report():
	report_node(houses)





#!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!THIS IS A DEPRECIATED FUNCTION!!!!!!!!!!!!!!
func create_house(xpos,ypos):
	
	var money_req=10;
	
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



func new_yarn(xpos,ypos, type):
	#this function will create a new house, then 
	#it will update the house id, then store it in the houses array.
	var path="res://scenes/yarn.tscn"
	var targetnode=yarnballs
	#print("here2!")
	var scene = load(path).instantiate()
	var origin = Vector2(xpos, ypos)
	scene.set_position(origin)
	
	
	
	#print("here1!")
	#scene.hid=GlobalVariables.h_id_counter;
	#GlobalVariables.h_id_counter=GlobalVariables.h_id_counter+1
	targetnode.add_child(scene)
	#print("scene hid"+str(scene.hid))
	#print("global hid"+ str(GlobalVariables.h_id_counter))
	#print("here3!")
	scene.current_item_type=type; 
	scene.yarn_init();
	



func new_cig(xpos,ypos, type):
	#this function will create a new house, then 
	#it will update the house id, then store it in the houses array.
	var path="res://scenes/cig.tscn"
	var targetnode=yarnballs
	#print("here2!")
	var scene = load(path).instantiate()
	var origin = Vector2(xpos, ypos)
	scene.set_position(origin)
	
	
	
	#print("here1!")
	#scene.hid=GlobalVariables.h_id_counter;
	#GlobalVariables.h_id_counter=GlobalVariables.h_id_counter+1
	targetnode.add_child(scene)
	#print("scene hid"+str(scene.hid))
	#print("global hid"+ str(GlobalVariables.h_id_counter))
	#print("here3!")
	scene.current_item_type=type; 
	scene.yarn_init();
	





#func create_mult_kitty(xpos,ypos):
	
	



func create_mult_house(xpos,ypos,housetype):
	
	var money_req=10;
	var house_creation_successful=0;
	
	#this code creates a creature at the given position.
	#var house = preload("res://scenes/Creaturee2.tscn").instantiate()
	#var origin = Vector2(1000, 800)
	#house.set_position(origin)
	#add_child(house)
	
	if(GlobalVariables.money>=money_req):
		house_creation_successful=1
		new_house(xpos,ypos,housetype);
		#Create a new house, store in the houses array. 
		GlobalVariables.money=GlobalVariables.money-money_req;
		
		
		
	
	update_label()
	
	print("is house creation succ?: " +str(house_creation_successful))
	
	return house_creation_successful;
	
	
	#var house = preload("res://scenes/Creaturee2.tscn").instantiate()
	#var origin = Vector2(1000, 800)
	#house.set_position(origin)
	#add_child(house)





func create_ramid_house(xpos,ypos,housetype):
	


	var money_req=10;
	var house_creation_successful=0;
	

	#this code creates a creature at the given position.
	#var house = preload("res://scenes/Creaturee2.tscn").instantiate()
	#var origin = Vector2(1000, 800)
	#house.set_position(origin)
	#add_child(house)
	
	if(GlobalVariables.money>=money_req):
		house_creation_successful=1
		new_ramid_house(xpos,ypos,housetype);
		#Create a new house, store in the houses array. 
		GlobalVariables.money=GlobalVariables.money-money_req;
		
		
		
	
	update_label()
	
	print("is house creation succ?: " +str(house_creation_successful))
	
	return house_creation_successful;
	
	
	#var house = preload("res://scenes/Creaturee2.tscn").instantiate()
	#var origin = Vector2(1000, 800)
	#house.set_position(origin)
	#add_child(house)







#func set_mult_house_ownership(houseid):
	

func create_cafe(xpos,ypos,cafe_type):
	
	var money_req=10;
	
	#this code creates a creature at the given position.
	#var house = preload("res://scenes/Creaturee2.tscn").instantiate()
	#var origin = Vector2(1000, 800)
	#house.set_position(origin)
	#add_child(house)
	
	if(GlobalVariables.money>=money_req):
		new_cafe(xpos,ypos,cafe_type);
		#Create a new house, store in the houses array. 
		GlobalVariables.money=GlobalVariables.money-money_req;
		
		
		
	
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
	
	
	
	#if(node2.position.x>node1.position.x):
	#	vectordif=vectordif*-1;
	
	print("VECTOR DIF!: "+ str(vectordif))
	
	var angle=self.find_angle(vectordif);
	
	#if(node1.position.x<node2.position.x):
	#	angle=angle+180
	
	
	var opposite=sin(angle)*mag;
	var adjacent=cos(angle)*mag;
	var b = Vector2()
	b.x = adjacent
	b.y = opposite
	
	var isright=0;
	
	
	
	if(node1.position.x>node2.position.x):
		b.x=b.x*-1
		b.y=b.y*-1
		isright=1;
		
	self.movenode(b,node1)
	
	return isright
	
	
	
	
	
func find_distance(node1,node2):
	var dv = Vector2()
	
	dv=find_vector_difference(node1,node2);
	var asq=pow(dv.x,2)
	var bsq=pow(dv.y,2)
	var csq=sqrt(asq+bsq)
	
	return csq
	
	
	
	
func check_building_collision(node1,building):
	#node 2 is the building
	var distance=find_distance(node1,building)
	if(distance<=building.col_radius):
		return true;
	else:
		return false;
	
	

		
func create_house_pyramid_moves_in(xpos,ypos,npctype):
	
	var offset=100;
	var issucc=create_ramid_house(xpos,ypos,npctype)
	print(str(issucc))
	
	
	#new_cat(xpos,ypos)
	if(issucc==1):	
		new_pyramid(xpos+offset,ypos+offset,npctype)
		

		
		
		
		
		
		#control.create_mult_house(self.position.x+100,self.position.y+100)
		#control.new_cat(self.position.x+100,self.position.y+100)


func create_house_kitty_moves_in(xpos,ypos,npctype):
	
	var offset=100;
	var issucc=create_mult_house(xpos,ypos,npctype)
	print(str(issucc))
	
	#new_cat(xpos,ypos)
	if(issucc==1):	
		new_cat(xpos+offset,ypos+offset,npctype)
		
	
		
		
		
		
		
