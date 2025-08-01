extends CharacterBody2D


const SPEED = 400.0
const JUMP_VELOCITY = -400.0

@onready var timer: Timer = $Timer

@onready var animated_sprite=$AnimatedSprite2D



@onready var man = %GameManager

#@onready var audio_player = Music_player.music


var toggle=1;


func _physics_process(delta: float) -> void:
	
	
	if(!Music_player.playing):
		Music_player.play()
	

	
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	
	
	
	
	if Input.is_action_just_pressed("ui_cancel"):
		scene_manager.swap_scene(1)
		
		
		
		

		
	
	
	
	
	#if Input.is_action_just_pressed("ui_left"):
	#	sprite.flip_h = true
	#if Input.is_action_just_pressed("ui_right"):
	#	sprite.flip_h = false
	
	print(timer.time_left)
	
	
	
	if direction>0:
		
		
		animated_sprite.flip_h=false;
	
		
	elif direction<0:
		animated_sprite.flip_h=true;
		
	
			
			
			
			
			
	#animated_sprite.play("drug time")
	
	#this means the player is standing still, so 
	# we should just play the idle animation. 
	#
	print("TOG VALUE" + str(toggle))
	
	if(toggle==0 && timer.time_left==0):
		toggle=1
		#Global.drugtime=false
		
		#get_tree().reload_current_scene()
		
	
	print("TOG VALUE" + str(toggle))
	
	print_tree()
	
	#print(Global.drugtime)
	
	
	
	#if Global.drugtime:
		#animated_sprite.play("drug time")
		
		#if(toggle==1):
		#timer.start()
			#toggle=0
		
		
	#else:
		
		#if is_on_floor():
			
		#	if direction==0:
		#		animated_sprite.play("bob")
		#	else:
		#		animated_sprite.play("walk")	
		#else:
		#	animated_sprite.play("jump")
		
			
			
		
		
	
	if direction:
		
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	
	




	
	
	


	
