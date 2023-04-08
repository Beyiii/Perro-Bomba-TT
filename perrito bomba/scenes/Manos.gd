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
@onready var animation_tree = $AnimationTree
@onready var playback = animation_tree.get("parameters/playback")

var manoDer = false
var Izq = false


func _ready():
	animation_tree.active = true
	
func _process(delta):
	
	
	if InputEventMouseMotion:
		var mouse_pos = get_global_mouse_position()
		self.position = self.position.move_toward(mouse_pos, 200 * delta)
		playback.travel("idle")
		

	
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
