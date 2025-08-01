extends CharacterBody2D


const SPEED = 400.0
const JUMP_VELOCITY = -400.0


@onready var animated_sprite=$AnimatedSprite2D



func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	
	
	#if Input.is_action_just_pressed("ui_left"):
	#	sprite.flip_h = true
	#if Input.is_action_just_pressed("ui_right"):
	#	sprite.flip_h = false
	
	
	
	print(direction)
	
	if direction>0:
		
		
		animated_sprite.flip_h=false;
		print("unflip")
		
	elif direction<0:
		animated_sprite.flip_h=true;
		print("flip")
			
			
			
	animated_sprite.play("drug time")
	
	
	if direction:
		print("DIRECTION")
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	
	
	
	
