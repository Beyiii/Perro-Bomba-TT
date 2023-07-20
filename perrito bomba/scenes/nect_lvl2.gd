extends Node2D

@onready var volver_al_menu = $"Volver al menu"
@onready var creditos = $Creditos


# Called when the node enters the scene tree for the first time.
func _ready():
	creditos.pressed.connect(_on_creditos_pressed)
	volver_al_menu.pressed.connect(_on_menu_pressed)

func _on_creditos_pressed():
	get_tree().change_scene_to_file("res://scenes/creditos.tscn")


func _on_menu_pressed():
	get_tree().change_scene_to_file("res://ui/main_menu.tscn")
