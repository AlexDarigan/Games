extends Node

onready var Goal: AudioStreamPlayer = $Goal
onready var ScoreLeft: Score = $LeftScore
onready var ScoreRight: Score = $RightScore

func _on_Ball_goal_scored(goal: Vector2) -> void:
	if goal == Vector2.LEFT:
		ScoreRight.value += 1
	elif goal == Vector2.RIGHT:
		ScoreLeft.value += 1
	Goal.play()
