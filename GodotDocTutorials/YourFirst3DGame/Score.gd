extends Label

var score: int = 0

func _on_Mob_squashed() -> void:
	score += 1
	text = "Score %s" % score
