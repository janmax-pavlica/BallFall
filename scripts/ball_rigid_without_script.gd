extends RigidBody2D

var speeding := false
var speedingValue := 0


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass  # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if speedingValue > 0:
		print("Speeding", speedingValue)
		var velocity = get_linear_velocity()
		#apply_central_impulse(Vector2(speedingValue * delta, speedingValue * delta))
		apply_central_impulse( Vector2(velocity.x + speedingValue * delta/10000, velocity.y + speedingValue * delta/10000) )


func speed_up(speeding := 0) -> void:
	speedingValue = speeding


func _on_timer_timeout() -> void:
	queue_free()
