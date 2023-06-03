extends MarginContainer

@onready var start = %Start
@onready var exit = %Exit
@onready var tutorial = %Tutorial
@onready var ajustes = %Ajustes
@onready var creditos = %Creditos


@export var main_scene: PackedScene

func _ready():
	start.pressed.connect(_on_start_pressed)
	tutorial.pressed.connect(_on_tutorial_pressed)
	exit.pressed.connect(_on_exit_pressed)
	ajustes.pressed.connect(_on_ajustes_pressed)
	creditos.pressed.connect(_on_creditos_pressed)
	
func _on_start_pressed():
#	get_tree().change_scene_to_file("res://scenes/main.tscn")
	get_tree().change_scene_to_packed(main_scene)


func _on_exit_pressed():
	get_tree().quit()
	
func _on_tutorial_pressed():
	get_tree().change_scene_to_file("res://scenes/tutorial.tscn")
#cambioTT
# oli
func _on_ajustes_pressed():
	get_tree().change_scene_to_file("res://scenes/ajustes.tscn")

func _on_creditos_pressed():
	get_tree().change_scene_to_file("res://scenes/creditos.tscn")
