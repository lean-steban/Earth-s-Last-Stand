extends Node2D

@onready var AnimationPlayerEndless: AnimationPlayer = $AnimationPlayerEndless
@onready var AnimationPlayerDreamriftstudios: AnimationPlayer = $AnimationPlayerDreamriftstudios

# Variable para almacenar la escena del menú principal
var menu_scene

func _ready():
	print("Ready: Mostrando logo de Endless")
	AnimationPlayerEndless.play("Endless")
	menu_scene = load("res://NIVELES/pantalla_titulo.tscn")

func _input(event):
	if event is InputEventKey and event.is_action_pressed("ui_accept"):
		print("Input: Botón presionado")
		_go_title_screen()

func _go_title_screen():
	print("Cambiando a la escena del título")
	var tree = get_tree()
	if tree and menu_scene:
		# Instanciar la escena del menú principal
		var menu_instance = menu_scene.instance()
		
		# Cambiar la escena actual
		tree.set_current_scene(menu_instance)

func _on_animation_player_endless_animation_finished(anim_name):
	print("Animación de Endless terminada: Mostrando logo de Dreamriftstudios")
	AnimationPlayerDreamriftstudios.play("new_animation")

func _on_animation_player_dreamriftstudios_animation_finished(anim_name):
	print("Animación de Dreamriftstudios terminada: Cambiando a la escena del título")
	_go_title_screen()
