extends Node2D

const RAMP_TRIANGLE = preload("res://objects/ramps/ramp_tri.tscn")
const RAMP_SLIDE = preload("res://objects/ramps/ramp_slide.tscn")
const RAMP_SPEED_UP_RIGHT = preload("res://objects/ramps/ramp_speed_up_right.tscn")

const level1 = [
	{
		"ramp":RAMP_SLIDE,
		"count":5
	},
	{
		"ramp":RAMP_TRIANGLE,
		"count":6
	},
	{
		"ramp":RAMP_SPEED_UP_RIGHT,
		"count":2
	}
]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	reset_ramps(level1)

func reset_ramps(level) -> void: 
	print('adding ramps')
	for ramp_index in level.size():
		var selected_ramp = level[ramp_index]
		for count in selected_ramp.count:
			print( count, ramp_index)
			var ramp = selected_ramp.ramp.instantiate()
			ramp.global_position = Vector2(1200+100*count,300+100*ramp_index)
			ramp.add_to_group('ramps')
			add_child(ramp)
	
