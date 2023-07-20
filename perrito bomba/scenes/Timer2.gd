extends Timer

@onready var contador = $"../ColorRect2/Contador"
@onready var timer = $"."


var Tiempo = 65
var min = 0
var seg = 0

func _ready():
	timer.set_wait_time(0)
	timer.start()

func _process(delta):
	if Tiempo >= 60:
		min = int( Tiempo/60)
	if Tiempo < 60:
		min = 0
	seg = Tiempo - min * 60
	if seg < 10:
		seg = str(0) + str(seg)
	var tiempo_restante = str(min) + ':' + str(seg)
	contador.set_text(str(tiempo_restante))


func _on_timeout():
	Tiempo -= 1
	if Tiempo ==0:
		get_tree().change_scene_to_file("res://scenes/fuiste_weno.tscn")
