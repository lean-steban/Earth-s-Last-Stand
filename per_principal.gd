extends CharacterBody2D

# Variables para controlar el movimiento
@export var speed = 200
@export var jump_velocity = -400
@export var gravity = 800
@export var bullet_scene = preload("res://PERSONAJES/PJ_princ/bullet.tscn")

@onready var area = $Area2D
@onready var animated_sprite = $AnimatedSprite2D  # Asegúrate de que este nombre coincida con el nodo en tu escena

func _physics_process(delta):
	# Aplicar gravedad si no está en el suelo
	if not is_on_floor():
		velocity.y += gravity * delta
	else:
		# Saltar si se presiona el botón de aceptar
		if Input.is_action_just_pressed("ui_accept"):  # Espacio para saltar
			velocity.y = jump_velocity
	
	# Restablecer la velocidad horizontal
	velocity.x = 0

	# Mover a la derecha
	if Input.is_action_pressed("move_right"):  # 'D' para moverse a la derecha
		velocity.x += speed
		animated_sprite.flip_h = false  # Asegúrate de usar el nombre correcto
	
	# Mover a la izquierda
	if Input.is_action_pressed("move_left"):  # 'A' para moverse a la izquierda
		velocity.x -= speed
		animated_sprite.flip_h = true  # Asegúrate de usar el nombre correcto

	# Disparar al presionar 'J'
	if Input.is_action_just_pressed("shoot_j"):
		shoot()

	# Mover el personaje
	move_and_slide()

# Función llamada cuando el personaje principal entra en contacto con un cuerpo
func _on_area_2d_body_entered(body):
	if body.name == "alien":
		get_tree().reload_current_scene()

func shoot():
	# Instanciar la bala
	var bullet = bullet_scene.instantiate()
	bullet.position = position
	bullet.direction = Vector2(1, 0) if animated_sprite.flip_h == false else Vector2(-1, 0)
	get_parent().add_child(bullet)
