extends Label
class_name Score

var value: int = 0 setget set_score

func set_score(new_value: int) -> void:
	value = new_value
	text = value as String
