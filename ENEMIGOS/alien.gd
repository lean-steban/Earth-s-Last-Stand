extends CharacterBody2D

const AlienCaminar = 10
const Gravedad = 98
func _ready():
	velocity.x = AlienCaminar
	$AnimatedSprite2D.play("Caminar")
	
func _physics_process(delta):
	velocity.y += Gravedad
	
	if is_on_wall():
		if !$AnimatedSprite2D.flip_h:
			velocity.x = AlienCaminar
		else:
			velocity.x = -AlienCaminar
			
	if velocity.x < 0:
		$AnimatedSprite2D.flip_h = false
	elif velocity.x > 0:
		$AnimatedSprite2D.flip_h = true
	
	
	move_and_slide()
