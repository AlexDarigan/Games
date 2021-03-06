extends Area2D

var explosion_scene = preload("res://explosion.tscn")
var move_speed = 100.0
var score_emitted = false

signal score

func _process(delta: float) -> void:
	position -= Vector2(move_speed * delta, 0.0)
	if position.x <= -100:
		queue_free()


func _on_asteroid_area_entered(area: Area2D) -> void:
	if area.is_in_group("shot") or area.is_in_group("player"):
		if not score_emitted:
			score_emitted = true
			emit_signal("score")
			queue_free()
			
		var stage = get_parent()
		var explosion = explosion_scene.instance()
		explosion.position = position
		stage.add_child(explosion)
