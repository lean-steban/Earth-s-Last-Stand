extends CanvasLayer
## Script de objeto para cambio de escena.
##
## Es un nodo que representa un objeto y al entrar en contacto cambia a una siguiente escena
## Cambio de escenas: https://docs.google.com/document/d/1eIBtgr8wln1pT0aZ4c-YWk_pqngyBg4HDsgdYLAXv28/edit?usp=sharing
## Uso de señales: https://docs.google.com/document/d/1vFSOuJkBy7xr5jksgCBNaTpqJHE_K87ZNafB5ZJ_I0M/edit?usp=sharing
## Uso de objetos para cambio de escena: https://docs.google.com/document/d/1DeAuU4dYa7DsWs-ht5Aiq4mFraOOu7hraNgIeSZn4lA/edit?usp=sharing


# Variable (públicas) de vida y puntuación
var life = 10 # Variable para menejo de vida


# Índice desde donde empieza el número 1 en la imagen atlas de letras y números
var _index_number_1 = 8
# Índice exacto del número 0, en la imagen atlas de letras y números
var _index_number_0 = 17

# Referencias hacia la barra de vida y los números de la puntuación
@onready var bar = $LifeBar/Bar


# Función de inicialización
func _ready():
	self.visible = false


# Agrega vida del personaje principal, según el valor proporcionado
func add_life(value: int):
	life += value
	if life > 10:
		life = 10
	_set_life_progress(life)


# Quita vida del personaje principal, según el valor proporcionado
func remove_life(value: int):
	life -= value
	if life < 0:
		life = 0
	_set_life_progress(life)



# Función para resetear los valores de vida 
func restart():
	life = 10
	_set_life_progress(life)

# Actualiza la barra de progreso de la vida en el valor proporcionado
func _set_life_progress(value: int):
	bar.value = value



# Genera una región (Rect2) para la posición del caracter según el "Atlas de imágenes"
# Se pasa posición de la letra de 0 a N, y retorna un Rect2, para dibujar la letra o número específico
func _get_text_region(position: int):
	var w = 10 # Ancho de la letra (siempre es 10)
	var h = 11 # Alto de la letra (siempre es 11)
	var x = 4.0 # Valor de la posición X (inicia con el valor 4)
	var y = 4.0 # Valor de la posición Y (inicia con el valor 4)
	var delta = 20.0 # Separación entre letras
	var column_count = 6.0 # Número de columnas según el atlas generado (en este caso 6)
	
	# Generamos un loop, para ir avanzando por cada región (por cada letra)
	for p in range(position):
		if x / delta < column_count - 1.0:
			# Nos vamos moviendo por las columnas
			x += delta # Avanzamos a la siguiente columna
		else:
			# Si llegamos a la última columna, seguimos avanzando desde la siguiente fila
			x = 4 # Volvemos a la primera columna
			y += delta # Avanzamos a la siguiente fila
			
	return Rect2(x, y, w, h)
