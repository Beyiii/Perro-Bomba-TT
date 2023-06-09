extends Control

@onready var label = $ColorRect/Label
@onready var timer = $Timer

var show_time = 3

# Called when the node enters the scene tree for the first time.
func _ready():
	label.visible = false
	timer.start(show_time)
func _on_timer_timeout():
	label.visible = false
	
# provisorio 
func _on_show_text():
	label.text = "Es un cuchillo de mantequilla, no corta :c"
	label.visible = true
