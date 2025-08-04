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
