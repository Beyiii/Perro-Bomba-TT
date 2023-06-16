extends Node2D
@onready var next_lvl = $"Next lvl"
@onready var volver_al_menu = $"Volver al menu"


# Called when the node enters the scene tree for the first time.
func _ready():
	next_lvl.pressed.connect(_on_lvl_pressed)
	volver_al_menu.pressed.connect(_on_menu_pressed)


func _on_lvl_pressed():
	get_tree().change_scene_to_file("res://ui/main_menu.tscn")


func _on_menu_pressed():
	get_tree().change_scene_to_file("res://ui/main_menu.tscn")
