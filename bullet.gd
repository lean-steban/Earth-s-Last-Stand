extends Area2D

@export var speed = 300
@export var direction = Vector2(1, 0)

# Define los límites del área jugable (ejemplo)
var area_width = 800
var area_height = 600

func _ready():
	set_process(true)

func _process(delta):
	position += direction * speed * delta
	
	# Ajusta los límites del área jugable
	if position.x > area_width or position.x < 0 or position.y > area_height or position.y < 0:
		queue_free()
	print("Posición del proyectil:", position)  # Añade esto para depurar la posición del proyectil

func _on_area_entered(area):
	queue_free()  # Eliminar la bala cuando golpea un área

func _on_body_entered(body):
	queue_free()  # Eliminar la bala cuando golpea un cuerpo
