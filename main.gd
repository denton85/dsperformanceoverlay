extends Node3D

func _unhandled_input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("hide"):
		toggle_boxes()

func toggle_boxes() -> void:
	for i in get_children():
			if i.is_in_group("Boxes"):
				i.visible = !i.visible

func _on_show_hide_pressed() -> void:
	toggle_boxes()


func _on_quit_pressed() -> void:
	get_tree().quit()
