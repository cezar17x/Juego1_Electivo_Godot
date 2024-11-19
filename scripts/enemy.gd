extends CharacterBody2D

var speed = 100
var player_chase = false
var player = null

var health = 100
var player_inattack_zone = false
var can_take_damage = true

@warning_ignore("unused_parameter")
func _physics_process(delta):
	if player_chase:
		
		var direction = (player.global_position - global_position).normalized()
		
		velocity = direction * speed
		
		move_and_slide()
		
		$AnimatedSprite2D.play("walk")
		
		if (player.position.x - position.x) < 0:
			$AnimatedSprite2D.flip_h = true
		else:
			$AnimatedSprite2D.flip_h = false

	else:
		$AnimatedSprite2D.play("idle")


func _on_detection_area_body_entered(body: Node2D):
	player = body
	player_chase = true
	print("entro")


@warning_ignore("unused_parameter")
func _on_detection_area_body_exited(body: Node2D):
	player = null
	player_chase = false
	
func enemy():
	pass
