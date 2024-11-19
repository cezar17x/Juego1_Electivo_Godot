extends Control


func focus():
	$continue.grab_focus()

func _on_continue_pressed() -> void:
	visible = false


func _on_exit_pressed() -> void:
	get_tree().quit()


func _on_reset_pressed() -> void:
	get_tree().reload_current_scene()
