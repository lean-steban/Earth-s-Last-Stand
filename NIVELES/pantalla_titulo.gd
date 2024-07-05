extends Control

## Script de menú principal.

func _on_jugar_pressed():
	var scene = load("res://NIVELES/NIVEL1.tscn")
	get_tree().set_auto_load_scene(scene)
	get_tree().change_scene("res://NIVELES/NIVEL1.tscn")

func _on_salir_pressed():
	get_tree().quit()
