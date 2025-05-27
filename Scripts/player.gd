extends CharacterBody2D

const SPEED = 130.0
const JUMP_VELOCITY = -300.0
const DEAD_ZONE = 0.2

@onready var animated_sprite = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	# Apply gravity
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	# Get input direction with dead zone
	var raw_direction := Input.get_axis("move_left", "move_right")
	var direction := 0.0
	if abs(raw_direction) > DEAD_ZONE:
		direction = raw_direction

	# Flip A D right direction	
	if raw_direction > 0:
		animated_sprite.flip_h = false
	elif raw_direction < 0:
		animated_sprite.flip_h = true

	# Play animations
	if is_on_floor():
		if raw_direction == 0:
			animated_sprite.play("idle")
		else:
			animated_sprite.play("run")
	else:
		animated_sprite.play("jump")
	
	# Apply movement or deceleration
	if direction != 0:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
