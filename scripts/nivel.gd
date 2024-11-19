extends Node2D

@onready var Pause: Control = $Game/UI/pausa

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("escape"):
		Pause.visible = true
		Pause.focus()
