extends AnimatedSprite2D

@onready var camera = $"../Camera2D"
var target_offset := 0.0 # Desired offset
const CAMERA_LERP_SPEED := 10.0  # Smoothness

func _ready() -> void:
	play("walk")

func _process(delta: float) -> void:
	if Input.is_action_pressed("ui_left"):
		flip_h = true
		target_offset = -10
	elif Input.is_action_pressed("ui_right"):
		flip_h = false
		target_offset = 0
	else:
		target_offset = 0

	# Smoothly interpolate the current camera offset to the target
	camera.offset.x = lerp(camera.offset.x, target_offset, delta * CAMERA_LERP_SPEED)
