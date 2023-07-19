extends Control

@onready var label = $ColorRect/Label


# Called when the node enters the scene tree for the first time.
func _ready():
	label.text = "Blue: Has leído el tutorial?"

