extends Node2D


const SPEED =60
var direction = 1
@onready var ray_right_2d: RayCast2D = $RayRight2D
@onready var ray_left_2d: RayCast2D = $RayLeft2D
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D




# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if ray_right_2d.is_colliding():
		direction = -1
		animated_sprite_2d.flip_h = true
	if ray_left_2d.is_colliding():
		direction = 1
		animated_sprite_2d.flip_h = false
	position.x += direction * SPEED * delta
