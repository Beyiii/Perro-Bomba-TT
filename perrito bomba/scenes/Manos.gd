extends CharacterBody2D


@onready var pivot = $Pivot
@onready var animation_player = $AnimationPlayer
@onready var animation_tree_izq = $AnimationTreeManoIzq
@onready var animation_tree_der = $AnimationTreeManoDer
@onready var perrito = $"../Perrito/AnimationPlayer"
@onready var perrito_tree = $"../Perrito/AnimationTree"

@onready var marker_der = $"Manito der/MarkerDer"
@onready var marker_izq = $"Manito izq/MarkerIzq"

@onready var pickable_area_der = $"Manito der/PickableAreaDer"
@onready var collision_shape_2d = $"Manito izq/PickableAreaIzq/CollisionShape2D"



@onready var playback_der = animation_tree_der.get("parameters/playback")
@onready var playback_izq = animation_tree_izq.get("parameters/playback")
@onready var playback_perrito = perrito_tree.get("parameters/playback")

@onready var manitoDer = $"Manito der"
@onready var manitoIzq = $"Manito izq"

enum MANOS {AMBAS, IZQ, DER}
var mano_actual = MANOS.AMBAS

var pickable: Pickable = null
var grabbed = false

var scale_factor = 1.05  # El factor de escala que se usará para aumentar el tamaño.
var max_scale = 0.15  # El tamaño máximo que el Sprite2D puede alcanzar.
var min_scale = 0.05 # El tamaño mínimo que el Sprite2D puede alcanzar.

func _ready():
	animation_tree_izq.active = true
	animation_tree_der.active = true
	perrito_tree.active = true
	pickable_area_der.body_entered.connect(_on_pickable_enter)
	
	
func _process(delta):
	
	var mouse_pos = get_global_mouse_position()
	playback_izq.travel("idleIzq")
	playback_der.travel("idleDer")
	playback_perrito.travel("perrito")
	
	
	if Input.is_action_just_pressed("Cambiar_mano"):
		if mano_actual == MANOS.AMBAS:
			mano_actual = MANOS.DER
			
		elif mano_actual == MANOS.IZQ:
			mano_actual = MANOS.DER
			
		else:
			mano_actual = MANOS.IZQ

	if Input.is_action_just_pressed("Ambas_manos"):
		mano_actual = MANOS.AMBAS
		
	#Aleja la mano de la mesa
	if Input.is_action_just_released("Alejar"):
		if mano_actual == MANOS.IZQ:
			if manitoIzq.scale.x > min_scale and manitoIzq.scale.y > min_scale: 
				manitoIzq.scale /= scale_factor 
			
		if mano_actual == MANOS.DER:
			if manitoDer.scale.x > min_scale and manitoDer.scale.y > min_scale:  
				manitoDer.scale /= scale_factor  
				
		else: 
			if manitoIzq.scale.x > min_scale and manitoIzq.scale.y > min_scale and manitoDer.scale.x > min_scale and manitoDer.scale.y > min_scale: 
				manitoIzq.scale /= scale_factor 
				manitoDer.scale /= scale_factor  
		
	#Acerca la mano a la mesa
	if Input.is_action_just_released("Acercar"):
		if mano_actual == MANOS.IZQ:
			if manitoIzq.scale.x < max_scale and manitoIzq.scale.y < max_scale: 
				manitoIzq.scale *= scale_factor 
			
		if mano_actual == MANOS.DER:
			if manitoDer.scale.x < max_scale and manitoDer.scale.y < max_scale:  
				manitoDer.scale *= scale_factor  
				
		else:
			if manitoIzq.scale.x < max_scale and manitoIzq.scale.y < max_scale and manitoDer.scale.x < max_scale and manitoDer.scale.y < max_scale:
				manitoIzq.scale *= scale_factor 
				manitoDer.scale *= scale_factor
		
		
	#Cierra toda la mano
	if Input.is_action_pressed("Dedo_1") and Input.is_action_pressed("Dedo_2") and Input.is_action_pressed("Dedo_3") and Input.is_action_pressed("Dedo_4"):
		if mano_actual == MANOS.IZQ:
			playback_izq.travel("CerrarIzq")
			grabbed = true
			pickable.freeze = grabbed
			
		if mano_actual == MANOS.DER:
			playback_der.travel("CerrarDer")
			grabbed = true
			pickable.freeze = grabbed
		
	if !(Input.is_action_pressed("Dedo_1") and Input.is_action_pressed("Dedo_2") and Input.is_action_pressed("Dedo_3") and Input.is_action_pressed("Dedo_4")):
		grabbed = false
		
	if pickable and grabbed:
		#pickable.global_position = lerp(pickable.global_position, marker_der.global_position, 0.1)
		if mano_actual == MANOS.IZQ:
			pickable.global_position = lerp(pickable.global_position, marker_izq.global_position, 1)
			
		if mano_actual == MANOS.DER:
			pickable.global_position = lerp(pickable.global_position, marker_der.global_position, 1)
		
		
	#Cierra los dos primeros dedos
	if Input.is_action_pressed("Dedo_1") and Input.is_action_pressed("Dedo_2") and !(Input.is_action_pressed("Dedo_3") or Input.is_action_pressed("Dedo_4")):
		if mano_actual == MANOS.IZQ:
			playback_izq.travel("IzquierdosCerrarIzq")
			
		if mano_actual == MANOS.DER:
			playback_der.travel("IzquierdosCerrarDer")
			
	#Cierra los dos dedos del medio
	if Input.is_action_pressed("Dedo_2") and Input.is_action_pressed("Dedo_3") and !(Input.is_action_pressed("Dedo_1") or Input.is_action_pressed("Dedo_4")):
		if mano_actual == MANOS.IZQ:
			playback_izq.travel("MediosCerrarIzq")
			
		if mano_actual == MANOS.DER:
			playback_der.travel("MediosCerrarDer")
			
	#Cierra los dos ultimos dedos 
	if Input.is_action_pressed("Dedo_3") and Input.is_action_pressed("Dedo_4") and !(Input.is_action_pressed("Dedo_1") or Input.is_action_pressed("Dedo_2")):
		if mano_actual == MANOS.IZQ:
			playback_izq.travel("DerechosCerrarIzq")
			
		if mano_actual == MANOS.DER:
			playback_der.travel("DerechosCerrarDer")
			
			
		
	if mano_actual == MANOS.AMBAS:
		self.position = self.position.move_toward(mouse_pos, 400 * delta)
	
		
	if mano_actual == MANOS.DER:
		var der = Vector2(40,0)
		manitoDer.position = manitoDer.position.move_toward(mouse_pos - self.position - der, 400* delta)
	
		
	if mano_actual == MANOS.IZQ:
		var izq = Vector2(-40,0)
		manitoIzq.position = manitoIzq.position.move_toward(mouse_pos - self.position - izq, 400 * delta)
	
			
func _on_pickable_enter(body: Node):
	if body is Pickable:
		pickable = body


#func _on_pickable_exit(body: Node):
#	if body == pickable and not grabbed:
#		pickable = null
		
		
	

	

		
		
