extends Node2D
@onready var timer = $Timer
@onready var label1 = %"Titulos creditos"
@onready var label2 = %"Contendio creditos"


var indice = 0

var titulos_creditos = ['Creditos',
	'Música',
	'Fondos',
	'Assets',
	'Fonts'
]
var contenido_creditos = ['','Linkin Park \nRihanna \nPerro Chocolo', '' ,'',''] 
var titulos = 'Creditos'
var contenido = ''



# Called when the node enters the scene tree for the first time.
func _ready():
	timer.set_wait_time(5)
	timer.start()
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if indice < len(titulos_creditos):
		label1.set_text(titulos_creditos[indice])
		label2.set_text(contenido_creditos[indice])
	else:
		get_tree().change_scene_to_file("res://ui/main_menu.tscn")


func _on_timer_timeout():
		indice += 1
