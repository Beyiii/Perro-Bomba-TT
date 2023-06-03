extends MarginContainer

@onready var volver_al_menu = $"PanelContainer/MarginContainer/VBoxContainer/Volver al menu"

# Called when the node enters the scene tree for the first time.
func _ready():
	volver_al_menu.pressed.connect(_volver_menu)


func _volver_menu():
	get_tree().change_scene_to_file("res://ui/main_menu.tscn")
