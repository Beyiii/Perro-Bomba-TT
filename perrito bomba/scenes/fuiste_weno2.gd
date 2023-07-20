extends Node2D

@onready var menu = $"Volver al menu"
@onready var reintentar = $Reintentar


# Called when the node enters the scene tree for the first time.
func _ready():
	menu.pressed.connect(_on_menu_pressed)
	reintentar.pressed.connect(_on_reintentar_pressed)

func _on_reintentar_pressed():
	get_tree().change_scene_to_file("res://scenes/nivel_2.tscn")

func _on_menu_pressed():
	get_tree().change_scene_to_file("res://ui/main_menu.tscn")

