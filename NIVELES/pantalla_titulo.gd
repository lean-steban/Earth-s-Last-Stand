extends Control

## Script de menú principal.

func _on_jugar_pressed():
	var scene = load("res://NIVELES/NIVEL1.tscn")
	get_tree().change_scene_to_packed(scene)

func _on_salir_pressed():
	get_tree().quit()
