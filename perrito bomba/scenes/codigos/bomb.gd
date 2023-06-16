extends Node2D

@onready var cable_1 = $cable1
@onready var cable_2 = $cable2
@onready var animation_player = $AnimationPlayer

@onready var area_cable_1 = $cable1/AreaCable1
@onready var area_cable_2 = $cable2/AreaCable2

@onready var timer = $"../../../Timer"

var nuevo_color = Color(100, 100, 100)
var default_color = Color(1, 1, 1)

var on_cable1 = false
var on_cable2 = false

signal show_text

# cable amarillo malo
# cable azul bueno 

func _process(delta):
	if Input.is_action_just_pressed("Cortar"):
		if on_cable1:
			animation_player.play("Cable_Azul")
			timer.stop()
			get_tree().change_scene_to_file("res://scenes/nect_lvl.tscn")
			
		if on_cable2:
			animation_player.play("Cable_Amarilo")
			get_tree().change_scene_to_file("res://scenes/fuiste_weno.tscn")

func _on_area_entered(area: Area2D):
	if area.is_in_group("Corte"):
		on_cable1 = true
		cambiar_color(cable_1, nuevo_color)
		
	if area.is_in_group("NoCorte"):
		emit_signal("show_text")
		
func _on_area_cable_1_area_exited(area: Area2D):
	if area.is_in_group("Corte"):
		on_cable1 = false
		cambiar_color(cable_1, default_color)

func _on_area_cable_2_area_entered(area):
	if area.is_in_group("Corte"):
		cambiar_color(cable_2, nuevo_color)
		on_cable2 = true
		
	if area.is_in_group("NoCorte"):
		emit_signal("show_text")
		
func _on_area_cable_2_area_exited(area: Area2D):
	if area.is_in_group("Corte"):
		cambiar_color(cable_2, default_color)
		on_cable2 = false
	
func cambiar_color(sprite: Sprite2D, color: Color):
	sprite.set_modulate(color)
	







