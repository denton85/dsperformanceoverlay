extends Node3D

func _unhandled_input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("hide"):
		for i in get_children():
			if i.is_in_group("Boxes"):
				i.visible = !i.visible
