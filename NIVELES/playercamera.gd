extends Camera2D

# Tamaño del margen en píxeles antes de que la cámara comience a moverse
@export var margin = Vector2(100, 100)

func _ready():
	set_position_smoothing_speed(0.5)  # Ajusta la velocidad de suavizado de la posición

# Función que ajusta la posición de la cámara en cada frame
func _process(delta):
	if get_parent() != null:
		var target_pos = get_parent().global_position
		var offset = target_pos - global_position

		# Solo mueve la cámara si el personaje se sale del margen
		if abs(offset.x) > margin.x:
			global_position.x += offset.x - margin.x * sign(offset.x)
		if abs(offset.y) > margin.y:
			global_position.y += offset.y - margin.y * sign(offset.y)
