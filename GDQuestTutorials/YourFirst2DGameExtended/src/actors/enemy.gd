extends Actor

export var score := 100

func _ready() -> void:
	set_physics_process(false)
	velocity.x = -speed.x

func _on_StompDetector_body_entered(body: Node) -> void:
	if body.global_position.y > get_node("StompDetector").global_position.y:
		return
	get_node("CollisionShape2D").set_deferred("disabled", true)
	die()

func _physics_process(delta: float) -> void:
	velocity.y += gravity * delta
	if is_on_wall():
		velocity.x *= -1.0 
	velocity.y = move_and_slide(velocity, Vector2.UP).y

func die() -> void:
	PlayerData.score += score
	queue_free()
