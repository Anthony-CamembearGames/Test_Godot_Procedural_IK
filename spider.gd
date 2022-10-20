extends Node3D

@export var height_offset: float = 2.0
@export var speed: float = 5.0

@export_node_path(Node3D) var fl_leg_path
@export_node_path(Node3D) var fr_leg_path
@export_node_path(Node3D) var bl_leg_path
@export_node_path(Node3D) var br_leg_path

@onready var fl_leg := get_node(fl_leg_path) as Node3D
@onready var fr_leg := get_node(fr_leg_path) as Node3D
@onready var bl_leg := get_node(bl_leg_path) as Node3D
@onready var br_leg := get_node(br_leg_path) as Node3D


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	translate(Vector3.FORWARD * speed * delta)
	
	var avg_y: float = (fl_leg.global_position.y + fr_leg.global_position.y + bl_leg.global_position.y + br_leg.global_position.y) / 4
	#global_position.y = lerp(global_position.y, avg_y + height_offset, speed * delta)
	
	var avg_left := (fl_leg.global_position + bl_leg.global_position) / 2
	var avg_right := (fr_leg.global_position + br_leg.global_position) / 2

	var diff = Vector2(avg_left.x, avg_left.y).angle_to_point(Vector2(avg_right.x, avg_right.y))
	#global_rotation.z = lerp(global_rotation.z, diff, speed * delta)
	
	var avg_back := (bl_leg.global_position + br_leg.global_position) / 2
	var avg_fwd := (fl_leg.global_position + fr_leg.global_position) / 2

	var diff2 = Vector2(avg_fwd.z, avg_fwd.y).angle_to_point(Vector2(avg_back.z, avg_back.y))
	#global_rotation.x = lerp(global_rotation.x, -diff2, speed * delta)

