extends CharacterBody2D



const SPEED = 400.0
const JUMP_VELOCITY = -400.0

@onready var timer: Timer = $Timer

@onready var animated_sprite=$AnimatedSprite2D

@onready var control=$"../GameManager"


@onready var kitty=$"../john"


@onready var houses=$"../houses"


#@onready var man = %GameManager


#@onready var audio_player = Music_player.music


var toggle=1;


func _physics_process(delta: float) -> void:
	
	if Input.is_action_just_pressed("ypress"):
		print("YUHHHH!")
		print(self.position)
		
		control.money_change(1)
		
	if Input.is_action_just_pressed("opress"):
		print("ohasbeenpressed")
		kitty.report()
		control.house_report()
		
		
		
	if Input.is_action_just_pressed("mpress"):
		print("time to summon some dogshit I guess")
		control.create_house(1000, 800)
		
			
	if Input.is_action_just_pressed("kpress"):
		print("khasbeenpressed")
		#kitty.report()
		for child in houses.get_children():
			print(control.find_vector_difference(self,child))
			
	
	
	
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
	
	




	
	
	


	
