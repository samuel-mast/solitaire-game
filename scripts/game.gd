extends Node2D

func _process(delta: float) -> void:
	if Input.is_action_just_released("reset"):
		get_tree().reload_current_scene()
