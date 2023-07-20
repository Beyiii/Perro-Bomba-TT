extends Node2D

@onready var cable_1 = $cable1
@onready var cable_2 = $cable2
@onready var cable_3 = $cable3

@onready var area_cable_1 = $cable1/AreaCable1
@onready var area_cable_2 = $cable2/AreaCable2
@onready var area_cable_3 = $cable3/AreaCable3

@onready var animation_player = $AnimationPlayer

@onready var timer = $"../../Timer2"

var nuevo_color = Color(100, 100, 100)
var default_color = Color(1, 1, 1)

var on_cable1 = false
var on_cable2 = false
var on_cable3 = false

var no_corte = false

signal c_mantequilla
signal noCM

#cables buenos rojo y amarillo
func _process(delta):
	if Input.is_action_just_pressed("Cortar"):
		if on_cable2 and on_cable3:
			animation_player.play("Cable_Azul")
			animation_player.play("Cable_Rojo")
			timer.stop()
			get_tree().change_scene_to_file("res://scenes/nect_lvl2.tscn")
		
		if on_cable1 or (on_cable2 and !on_cable3) or (on_cable3 and !on_cable2) or no_corte:
			get_tree().change_scene_to_file("res://scenes/fuiste_weno2.tscn")
			
func _on_area_cable_1_area_entered(area: Area2D):
	if area.is_in_group("Corte"):
		on_cable1 = true
		cambiar_color(cable_1, nuevo_color)
		
	if area.is_in_group("NoCorte"):
		no_corte = true
		cambiar_color(cable_1, nuevo_color)
		emit_signal("c_mantequilla")

		
func _on_area_cable_1_area_exited(area: Area2D):
	if area.is_in_group("Corte"):
		on_cable1 = false
		cambiar_color(cable_1, default_color)
		
	if area.is_in_group("NoCorte"):
		no_corte = false
		cambiar_color(cable_1, default_color)
		emit_signal("noCM")


func _on_area_cable_2_area_entered(area):
	if area.is_in_group("Corte"):
		on_cable2 = true
		cambiar_color(cable_2, nuevo_color)
		
	if area.is_in_group("NoCorte"):
		no_corte = true
		cambiar_color(cable_2, nuevo_color)
		emit_signal("c_mantequilla")
		
	
func _on_area_cable_2_area_exited(area: Area2D):
	if area.is_in_group("Corte"):
		on_cable2 = false
		cambiar_color(cable_2, default_color)
		
	if area.is_in_group("NoCorte"):
		no_corte = false
		cambiar_color(cable_2, default_color)
		emit_signal("noCM")
		
		
func _on_area_cable_3_area_entered(area):
	if area.is_in_group("Corte"):
		on_cable3 = true
		cambiar_color(cable_3, nuevo_color)
		
	if area.is_in_group("NoCorte"):
		no_corte = true
		cambiar_color(cable_3, nuevo_color)
		emit_signal("c_mantequilla")

func _on_area_cable_3_area_exited(area):
	if area.is_in_group("Corte"):
		on_cable3 = false
		cambiar_color(cable_3, default_color)
		
	if area.is_in_group("NoCorte"):
		no_corte = false
		cambiar_color(cable_3, default_color)
		emit_signal("noCM")
	
func cambiar_color(sprite: Sprite2D, color: Color):
	sprite.set_modulate(color)
	


