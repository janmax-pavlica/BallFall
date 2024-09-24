extends "res://scripts/ramp_parts.gd"

var speeding = false
var speedingValue = 100

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if speeding:
		Global.Ball.apply_central_impulse(Vector2(speedingValue,0))


func _on_speed_area_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if( body_rid == Global.Ball.get_rid()):
		speeding = true


func _on_speed_area_body_shape_exited(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if( body_rid == Global.Ball.get_rid()):
		speeding = false
