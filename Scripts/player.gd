extends CharacterBody2D

const SPEED = 130.0
const JUMP_VELOCITY = -300.0
const DEAD_ZONE = 0.2

func _physics_process(delta: float) -> void:
	# Apply gravity
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get input direction with dead zone
	var raw_direction := Input.get_axis("ui_left", "ui_right")
	var direction := 0.0
	if abs(raw_direction) > DEAD_ZONE:
		direction = raw_direction

	# Apply movement or deceleration
	if direction != 0:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
