extends CharacterBody2D

"""
const SPEED = 0
const JUMP_VELOCITY = -200.0
const GRAVITY = 400
const ACCELERATION = 0

const MAX_JUMP_TIME = 0.2
const MAX_AIRBORNE_TIME = 0.1

var current_jump_time = 0
var current_airborne_time = 0
var jumping = false

var Enemy = preload("res://scenes/enemy.tscn")

@onready var pivot = $Pivot
@onready var animation_player = $AnimationPlayer
@onready var animation_tree = $AnimationTree
@onready var playback = animation_tree.get("parameters/playback")

"""

@onready var pivot = $Pivot
@onready var animation_player = $AnimationPlayer
@onready var animation_tree_izq = $AnimationTreeManoIzq
@onready var animation_tree_der = $AnimationTreeManoDer
@onready var perrito = $"../Perrito/AnimationPlayer"
@onready var perrito_tree = $"../Perrito/AnimationTree"

@onready var playback_der = animation_tree_der.get("parameters/playback")
@onready var playback_izq = animation_tree_izq.get("parameters/playback")
@onready var playback_perrito = perrito_tree.get("parameters/playback")

@onready var manitoDer = $"Manito der"
@onready var manitoIzq = $"Manito izq"

enum MANOS {AMBAS, IZQ, DER}
var mano_actual = MANOS.AMBAS

var click_manoDer = false
var click_manoIzq = true
var click_manos = true

var scale_factor = 1.05  # El factor de escala que se usará para aumentar el tamaño.
var max_scale = 0.15  # El tamaño máximo que el Sprite2D puede alcanzar.
var min_scale = 0.05 # El tamaño mínimo que el Sprite2D puede alcanzar.

func _ready():
	animation_tree_izq.active = true
	animation_tree_der.active = true
	perrito_tree.active = true

	
func _process(delta):
	
	var mouse_pos = get_global_mouse_position()
	playback_izq.travel("idleIzq")
	playback_der.travel("idleDer")
	playback_perrito.travel("perrito")
	
	
	
	
	if Input.is_action_just_pressed("Cambiar_mano"):
		click_manos = false
		click_manoDer = not click_manoDer
		click_manoIzq = not click_manoIzq


	if Input.is_action_just_pressed("Ambas_manos"):
		click_manos = true
		
	#Aleja la mano de la mesa
	if Input.is_action_just_released("Alejar"):
		if click_manoIzq == true and click_manos == false:
			if manitoIzq.scale.x > min_scale and manitoIzq.scale.y > min_scale: 
				manitoIzq.scale /= scale_factor 
			
		if click_manoDer == true and click_manos == false:
			if manitoDer.scale.x > min_scale and manitoDer.scale.y > min_scale:  
				manitoDer.scale /= scale_factor  
		
	#Acerca la mano a la mesa
	if Input.is_action_just_released("Acercar"):
		if click_manoIzq == true and click_manos == false:
			if manitoIzq.scale.x < max_scale and manitoIzq.scale.y < max_scale: 
				manitoIzq.scale *= scale_factor 
			
		if click_manoDer == true and click_manos == false:
			if manitoDer.scale.x < max_scale and manitoDer.scale.y < max_scale:  
				manitoDer.scale *= scale_factor  
		
		
	#Cierra toda la mano
	if Input.is_action_pressed("Dedo_1") and Input.is_action_pressed("Dedo_2") and Input.is_action_pressed("Dedo_3") and Input.is_action_pressed("Dedo_4"):
		if click_manoIzq == true and click_manos == false:
			playback_izq.travel("CerrarIzq")
			
		if click_manoDer == true and click_manos == false:
			playback_der.travel("CerrarDer")
			
			
			
	#Cierra los dos primeros dedos
	if Input.is_action_pressed("Dedo_1") and Input.is_action_pressed("Dedo_2") and !(Input.is_action_pressed("Dedo_3") or Input.is_action_pressed("Dedo_4")):
		if click_manoIzq == true and click_manos == false:
			playback_izq.travel("IzquierdosCerrarIzq")
			
		if click_manoDer == true and click_manos == false:
			playback_der.travel("IzquierdosCerrarDer")
			
	#Cierra los dos dedos del medio
	if Input.is_action_pressed("Dedo_2") and Input.is_action_pressed("Dedo_3") and !(Input.is_action_pressed("Dedo_1") or Input.is_action_pressed("Dedo_4")):
		if click_manoIzq == true and click_manos == false:
			playback_izq.travel("MediosCerrarIzq")
			
		if click_manoDer == true and click_manos == false:
			playback_der.travel("MediosCerrarDer")
			
	#Cierra los dos ultimos dedos 
	if Input.is_action_pressed("Dedo_3") and Input.is_action_pressed("Dedo_4") and !(Input.is_action_pressed("Dedo_1") or Input.is_action_pressed("Dedo_2")):
		if click_manoIzq == true and click_manos == false:
			playback_izq.travel("DerechosCerrarIzq")
			
		if click_manoDer == true and click_manos == false:
			playback_der.travel("DerechosCerrarDer")
			
			
		
	if click_manos == true:
		self.position = self.position.move_toward(mouse_pos, 400 * delta)
	
		
	if click_manos == false:
		if click_manoDer == true:
			#var der = Vector2(305,100)
			var der = Vector2(40,0)
			manitoDer.position = manitoDer.position.move_toward(mouse_pos - self.position - der, 400* delta)
	
		
		if click_manoIzq == true:
			var izq = Vector2(-40,0)
			manitoIzq.position = manitoIzq.position.move_toward(mouse_pos - self.position - izq, 400 * delta)
	
			
	
		
	

	

		
		
