extends Node2D

@export var anim: AnimationPlayer

func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("Player"):
		anim.play("open")
		queue_free()
