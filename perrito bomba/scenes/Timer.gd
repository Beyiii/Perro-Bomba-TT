extends Timer


# Called when the node enters the scene tree for the first time.
func _ready()-> void:
	wait_time = 3.0
	connect('timeout',self,'printuwu')
	start()


func printuwu():
	print('uwu')
