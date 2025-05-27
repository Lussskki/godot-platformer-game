extends AnimatedSprite2D

@onready var camera = $"../Camera2D"
var target_offset := 0.0
const CAMERA_LERP_SPEED := 10.0
const CAMERA_SIDE_OFFSET := 10  # distance camera shifts

func _ready() -> void:
	play("walk")

func _process(delta: float) -> void:
	if Input.is_action_pressed("ui_left"):
		flip_h = true
		target_offset = -CAMERA_SIDE_OFFSET
	elif Input.is_action_pressed("ui_right"):
		flip_h = false
		target_offset = CAMERA_SIDE_OFFSET
	else:
		target_offset = 0.0

	camera.offset.x = lerp(camera.offset.x, target_offset, delta * CAMERA_LERP_SPEED)
