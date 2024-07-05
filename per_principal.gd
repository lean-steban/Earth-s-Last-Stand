extends CharacterBody2D

# Variables para controlar el movimiento
@export var speed = 200
@export var jump_velocity = -400
@export var gravity = 800
@export var bullet_scene = preload("res://PERSONAJES/PJ_princ/bullet.tscn")

@onready var area = $Area2D



func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta
	else:
		if Input.is_action_just_pressed("ui_accept"):  # Espacio para saltar
			velocity.y = jump_velocity
	
	velocity.x = 0
	if Input.is_action_pressed("ui_right"):  # 'D' para moverse a la derecha
		velocity.x += speed
	if Input.is_action_pressed("ui_left"):  # 'A' para moverse a la izquierda
		velocity.x -= speed

	# Disparar al presionar 'J'
	if Input.is_action_just_pressed("ui_select"):
		shoot()



# Función llamada cuando el personaje principal entra en contacto con un cuerpo
func _on_area_2d_body_entered(body):
	if body.name == "alien":
		get_tree().reload_current_scene()

func shoot():
	# Instanciar la bala
	var bullet = bullet_scene.instance()
	bullet.position = position
	bullet.direction = Vector2(1, 0) if $AnimatedSprite.flip_h == false else Vector2(-1, 0)
	get_parent().add_child(bullet)
