extends KinematicBody2D

onready var sprite: Sprite = $TriangleRed
const DISTANCE_THRESHOLD := 3.0
export var max_speed: int = 500
export var slow_radius := 200.0
var _velocity := Vector2.ZERO
var target_global_position := Vector2.ZERO

func _ready() -> void:
	set_physics_process(false)

func _unhandled_input(event) -> void:
	if event.is_action_pressed("click"):
		target_global_position = get_global_mouse_position()
		set_physics_process(true)

func _physics_process(delta: float) -> void:
	if Input.is_action_pressed("click"):
		target_global_position = get_global_mouse_position()
	if global_position.distance_to(target_global_position) < DISTANCE_THRESHOLD:
		return
	_velocity = Steering.arrive_to(
		_velocity,
		global_position,
		target_global_position,
		max_speed,
		slow_radius
	)
	_velocity = move_and_slide(_velocity)
	sprite.look_at(target_global_position)
