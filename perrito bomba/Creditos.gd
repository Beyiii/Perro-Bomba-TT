extends Node2D
@onready var timer = $Timer
@onready var label1 = %"Titulos creditos"
@onready var label2 = %"Contendio creditos"
@onready var button = $Button


var indice = 0

var titulos_creditos = ['Creditos',
	'Música',
	'Fondos',
	'Assets',
	'Fonts',''
]
var contenido_creditos = ['Un juego de: \nGrupito Fantastico👾',
"Adventures of Flying Jack \nAlexander Nakarada \n \nSurvivor's Lament\nTungerman",
 'Modern Cities \nCraftpix' , '\nPerros,Herramientas y Bomba\n Google imagenes\n \n
Dibujos \nBeyiii \n \nExplosiones \nLuis Zuno \n' ,
'Chonkly \nItMeArcadia \n \nAlpha Prota \nGGBotNet','Gracias por jugar'] 
var titulos = 'Creditos'
var contenido = ''



# Called when the node enters the scene tree for the first time.
func _ready():
	button.pressed.connect(_volver_menu)
	timer.set_wait_time(5)
	timer.start()
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if indice < len(titulos_creditos):
		label1.set_text(titulos_creditos[indice])
		label2.set_text(contenido_creditos[indice])
	else:
		get_tree().change_scene_to_file("res://ui/main_menu.tscn")

func _volver_menu():
	get_tree().change_scene_to_file("res://ui/main_menu.tscn")
func _on_timer_timeout():
		indice += 1
