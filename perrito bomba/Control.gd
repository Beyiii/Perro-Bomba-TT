extends Control


@onready var volver_al_menu = %"Volver al menu"

var music_bus = AudioServer.get_bus_index('Musica')
var master_bus = AudioServer.get_bus_index('Master')

func _ready():
	volver_al_menu.pressed.connect(_volver_menu)


func _volver_menu():
	get_tree().change_scene_to_file("res://ui/main_menu.tscn")
	
	
func _on_h_slider_value_changed(value):
	AudioServer.set_bus_volume_db(music_bus,value)
	if value== -30:
		AudioServer.set_bus_mute(music_bus,true)
	else:
		AudioServer.set_bus_mute(music_bus,false)
	


func _on_volumen_general_value_changed(value):
	AudioServer.set_bus_volume_db(master_bus,value)
	if value== -30:
		AudioServer.set_bus_mute(master_bus,true)
	else:
		AudioServer.set_bus_mute(master_bus,false)
