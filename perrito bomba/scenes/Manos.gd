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

var click_manoDer = false
var click_manoIzq = true
var click_manos = true
var mano_cerrada = false

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
		
	if Input.is_action_pressed("Dedo_1"):
		mano_cerrada = true
		if click_manoIzq == true and click_manos == false:
			playback_izq.travel("CerrarIzq")
			
		if click_manoDer == true:
			playback_der.travel("CerrarDer")
			
	if not Input.is_action_pressed("Dedo_1") and mano_cerrada:
		if click_manoIzq == true:
			playback_izq.travel("CerrarIzq")
			mano_cerrada = false
			
		if click_manoDer == true:
			playback_der.travel("CerrarDer")
			mano_cerrada = false
			
		
		
	if click_manos == true:
		self.position = self.position.move_toward(mouse_pos, 200 * delta)
		
	if click_manos == false:
		if click_manoDer == true:
			var der = Vector2(305,100)
			manitoDer.position = manitoDer.position.move_toward(mouse_pos - der, 400* delta)
		
		if click_manoIzq == true:
			var izq = Vector2(100,100)
			manitoIzq.position = manitoIzq.position.move_toward(mouse_pos - izq, 200 * delta)
			
			
	
		
	

	
	# animation
	"""
	if is_on_floor():
		if abs(velocity.x) > 10 or move_input:
			playback.travel("run")
		else:
			playback.travel("idle")
	else:
		if velocity.y < 0:
			playback.travel("jump")
		else:
			playback.travel("fall")	
		
		
	"""


"""


func _ready():
	animation_tree.active = true
#	Engine.time_scale = 0.2

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += GRAVITY * delta
	
	if is_on_floor():
		current_airborne_time = 0

	if Input.is_action_just_pressed("jump") and current_airborne_time < MAX_AIRBORNE_TIME:
		jumping = true
		current_jump_time = 0
		Game.jumps += 1
	
	if jumping and current_jump_time <= MAX_JUMP_TIME:
		velocity.y = JUMP_VELOCITY
	
	current_jump_time += delta
	current_airborne_time += delta
	
	if Input.is_action_just_released("jump"):
		jumping = false
	

	var move_input = Input.get_axis("move_left", "move_right")
	
	velocity.x = move_toward(velocity.x, move_input * SPEED, ACCELERATION * delta)

	move_and_slide()

	if Input.is_action_just_pressed("spawn"):
		_spawn()
	
	# animation
	
	if is_on_floor():
		if abs(velocity.x) > 10 or move_input:
			playback.travel("run")
		else:
			playback.travel("idle")
	else:
		if velocity.y < 0:
			playback.travel("jump")
		else:
			playback.travel("fall")
	
	if move_input:
		pivot.scale.x = sign(move_input)


func _spawn():
	var enemy = Enemy.instantiate()
	enemy.global_position = get_global_mouse_position()
	enemy.rotation = (get_global_mouse_position() - global_position).angle() + PI / 2
	get_parent().add_child(enemy)

""" 
