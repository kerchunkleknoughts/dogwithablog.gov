extends Node2D




#these two variables keep both scenes in memory,
#this way the game is not reset every time 
#you open up the pause menu. 

#the point of this scene is to remove the other scenes 
#from the current game tree. All this does is 
#swaps out the currently running things out, 
#think of like a context switch for tasks. 

var pause = preload("res://scenes/control1.tscn").instantiate()
var game = preload("res://scenes/game2.tscn").instantiate()
var splash = preload("res://scenes/control.tscn").instantiate()


@onready var generated_scenes=get_tree().get_root().get_node("scene_manager/generated_scenes")#$"../houses"



var scene_x_pos=0;
var scene_y_pos=0;



@onready var room_index_counter=2;




func generate_scene():
	var path="res://scenes/game2.tscn"
	#var targetnode=generated_scenes
	
	var scene = load(path).instantiate()
	
	scene_array.append(scene)
	room_index_counter=room_index_counter+1;
	print("ROOM INDEX COUNTER: "+str(room_index_counter));
	scene.current_room_index=room_index_counter;


	#targetnode.add_child(scene)







func generate_and_append_top():

	print("GENERATING AND APPENDING TOP!")
	var path="res://scenes/game2.tscn"
	#var targetnode=generated_scenes
	
	var scene = load(path).instantiate()
	
	scene_array.append(scene)
	room_index_counter=room_index_counter+1;
	print("ROOM INDEX COUNTER: "+str(room_index_counter));
	scene.current_room_index=room_index_counter;
	scene.bottom_room_index=currentscene;
	print("ohyeah ")


	scene_array[currentscene].top_room_index=room_index_counter;









func generate_and_append_bottom():

	print("GENERATING AND APPENDING BOTTOM!")
	var path="res://scenes/game2.tscn"
	#var targetnode=generated_scenes
	
	var scene = load(path).instantiate()
	
	scene_array.append(scene)
	room_index_counter=room_index_counter+1;
	print("ROOM INDEX COUNTER: "+str(room_index_counter));
	scene.current_room_index=room_index_counter;
	scene.top_room_index=currentscene;
	print("ohyeah ")

	scene_array[currentscene].bottom_room_index=room_index_counter;









func scene_nav_swap(direction):


	#top
	if(direction==0):
	
		swap_scene(scene_array[currentscene].top_room_index)



	#bottom
	if(direction==1):

		swap_scene(scene_array[currentscene].bottom_room_index)


	#left
	#if(direction==2):


	#right
	#if(direction==3):












var currentscene=-1
var scene_array=[game,pause,splash]

const scene_path_array=["res://scenes/game2.tscn","res://scenes/control1.tscn","res://scenes/control.tscn"]





func swap_scene(scene_index: int)->void:
	
	#currently this does not remove the scene from memory,
	#need to write some code which destroys old 
	#scenes if option specified. 
	
	print("scene swap")
	
	print("prev current scene")
	print(currentscene)
	
	print("removing node")
	get_tree().root.remove_child(scene_array[currentscene])
	
	print("adding node")
	get_tree().root.add_child(scene_array[scene_index])
	currentscene=scene_index
	print("new current scene")
	print(currentscene)
	
	
	
	
	


func reload_current_scene()->void:
	
	print(scene_array)
	
	scene_array[currentscene].queue_free()
	print("NEW LENGTH!!")
	print(len(scene_array))
	
	
	scene_array.remove_at(currentscene)
	
	#right now this just deletes the node and then it 
	#becomes a null pointer, when adding it again 
	#you add nothing the object is gone., 
	var newobject=load(scene_path_array[currentscene]).instantiate()
	
	scene_array.insert(currentscene,newobject)
	
	print("NEW LENGTH!!")
	print(len(scene_array))
	
	print(scene_array)
	
	
	
	get_tree().root.add_child(scene_array[currentscene])
	
	
	
	
	
	
	

	
	
	
func bootstrap()->void:
	get_tree().root.add_child(scene_array[2])
	



	
	


func _physics_process(delta: float) -> void:
	
	#bootstrap into main scene.
	#this does not remove the scene from memory.
	if(currentscene==-1):
		currentscene=2
		print("bootstrap called!")
		bootstrap()
