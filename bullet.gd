extends Area2D

@export var speed = 500
@export var direction = Vector2(1, 0)

func _ready():
	set_process(true)

func _process(delta):
	position += direction * speed * delta

	if position.x > 1024 or position.x < 0 or position.y > 768 or position.y < 0:
		queue_free()

func _on_area_entered(area):
	# Manejar lo que sucede cuando el bullet entra en contacto con un área
	queue_free()

