@tool
extends Marker3D
 
@onready var ray := $RayCast3D
 
func _process(delta):
	if ray.is_colliding():
		global_position.y = ray.get_collision_point().y
