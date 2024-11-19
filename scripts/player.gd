extends CharacterBody2D

var direction: Vector2 = Vector2.ZERO

@export var speed: float = 200.0
@export var anim: AnimationPlayer
@export var characteranim: AnimatedSprite2D
@onready var lose: Control = $"../UI/lose"

func get_input():
	direction.x = Input.get_axis("left", "right")
	direction.y = Input.get_axis("up", "down")
	direction = direction.normalized()


@warning_ignore("unused_parameter")
func _physics_process(delta: float) -> void:
	get_input()
	velocity = direction * speed
	if direction.x > 0:
		characteranim.play("run")
		characteranim.flip_h = false
	elif direction.x < 0:
		characteranim.play("run")
		characteranim.flip_h = true
	elif direction.y < 0 or direction.y > 0:
		characteranim.play("run")
	else:
		characteranim.play("idle")
	move_and_slide()


func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("llave"):
		area.queue_free()
		anim.play("open1")
	if area.is_in_group("enemy"):
		queue_free()
		lose.visible = true


@warning_ignore("unused_parameter")
func _on_estrella_area_entered(area: Area2D) -> void:
	get_tree().reload_current_scene()
