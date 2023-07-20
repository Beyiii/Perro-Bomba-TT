extends Control

@onready var label = $ColorRect/Label


var text = "Pista: Clifford es buen amigo de Pluto."
var text2 = "Estás seguro de cortar con eso?"


# Called when the node enters the scene tree for the first time.
func _ready():
	label.text = text
	
func _on_bomb_2_c_mantequilla():
	label.text = text2


func _on_bomb_2_no_cm():
	label.text = text
