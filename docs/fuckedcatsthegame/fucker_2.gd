extends CharacterBody2D



const SPEED = 400.0
const JUMP_VELOCITY = -400.0

@onready var timer: Timer = $Timer

@onready var animated_sprite=$AnimatedSprite2D

@onready var control=$"../GameManager"





@onready var houses=$"../houses"


#@onready var man = %GameManager


#@onready var audio_player = Music_player.music


var toggle=1;


func _physics_process(delta: float) -> void:
	
	if Input.is_action_just_pressed("ypress"):
		#print("YUHHHH!")
		print(self.position)
		
		control.money_change(50)
		
		
	if Input.is_action_just_pressed("opress"):
		var a;
		#print("ohasbeenpressed")
		#control.new_cat(self.position.x+100,self.position.y+100)
		
		#kitty.report()
		#control.house_report()
		
		
	if Input.is_action_just_pressed("hpress"):
		#print("h has been pressed.")
		#control.new_yarn(self.position.x+100,self.position.y+100)
		control.new_text(self.position.x+100,self.position.y+100,1,"test")
		
		
		
		
	if Input.is_action_just_pressed("mpress"):
		#print("time to summon some dogshit I guess")
		#control.create_house(1000, 800)
		#ontrol.create_cafe(self.position.x+100,self.position.y+100,1);
		#control.create_cafe(self.position.x+100,self.position.y+100,1);
		control.create_house_pyramid_moves_in(self.position.x+100,self.position.y+100,0)
			
		











			
	if Input.is_action_just_pressed("kpress"):
		#print("khasbeenpressed")
		control.create_cafe(self.position.x+100,self.position.y+100,0);
		
		#kitty.report()
		#for child in houses.get_children():
		#	print(control.find_vector_difference(self,child))
			
	
	if Input.is_action_just_pressed("zpress"):
		#print("zpressed")
		#control.create_house(1000, 800)
		control.create_house_kitty_moves_in(self.position.x+100,self.position.y+100,0)
		
		
	
	if Input.is_action_just_pressed("xpress"):
		#print("zpressed")
		#control.create_house(1000, 800)
		control.create_house_kitty_moves_in(self.position.x+100,self.position.y+100,1)
		
	
	if Input.is_action_just_pressed("cpress"):
		#print("zpressed")
		#control.create_house(1000, 800)
		control.create_house_kitty_moves_in(self.position.x+100,self.position.y+100,2)
		






	if Input.is_action_just_pressed("bpress"):
		#print("time to summon some dogshit I guess")
		#control.create_house(1000, 800)
		#ontrol.create_cafe(self.position.x+100,self.position.y+100,1);
		#control.create_cafe(self.position.x+100,self.position.y+100,1);
		
		
		#scene_manager.generate_scene();

		control.create_effect(self.position.x+100,self.position.y+100,0,.5,2)




	if Input.is_action_just_pressed("vpress"):
		#print("time to summon some dogshit I guess")
		#control.create_house(1000, 800)
		#ontrol.create_cafe(self.position.x+100,self.position.y+100,1);
		#control.create_cafe(self.position.x+100,self.position.y+100,1);
		
		#scene_manager.swap_scene(3)

		control.dramatic_death(self)





	if Input.is_action_just_pressed("gpress"):
		#print("time to summon some dogshit I guess")
		#control.create_house(1000, 800)
		#ontrol.create_cafe(self.position.x+100,self.position.y+100,1);
		#control.create_cafe(self.position.x+100,self.position.y+100,1);
		#scene_manager.swap_scene(0)

		#control.dramatic_death2(self,.5,1,10)	
		control.create_house_pyramid_moves_in(self.position.x+100,self.position.y+100,1)























	
	if(!Music_player.playing):
		Music_player.play()
	
	
	if Input.is_action_just_pressed("ui_cancel"):
		scene_manager.swap_scene(1)
		
		



	var direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = direction * SPEED

	

	if direction.x<0:
		
		
		animated_sprite.flip_h=false;
	
		
	elif direction.x>0:
		animated_sprite.flip_h=true;


	move_and_slide()
	
	




	
	
	


	
