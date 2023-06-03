extends Pickable


@onready var collision_shape_cc = $"CollisionShape-CC"
@onready var area_2d = $Area2D




"""
func _on_area_entered(area: Area2D):
	if area.has_method("cortar"):
		area.cortar()
		
func cortar():
	print("corte")
"""



func _on_area_2d_area_entered(area):
	if area.has_method("cortar"):
		area.cortar()
		
func cortar():
	print("corte")
