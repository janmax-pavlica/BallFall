extends "res://scripts/ramp_parts.gd"

var speeding = false
var speedingValue = 10000

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if speeding:
		var velocity = Global.Ball.get_linear_velocity()
		
		Global.Ball.apply_central_impulse(Vector2(speedingValue * delta,speedingValue * delta))
		#Global.Ball.apply_central_impulse(Vector2(velocity.x + speedingValue * delta,velocity.y + speedingValue * delta))
		print(velocity, delta)


func _on_speed_area_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if( body_rid == Global.Ball.get_rid()):
		speeding = true


func _on_speed_area_body_shape_exited(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if( body_rid == Global.Ball.get_rid()):
		speeding = false
