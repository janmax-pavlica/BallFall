extends Node2D

const BALL_RIGID = preload("res://objects/ball_rigid_without_script.tscn")


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass  # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_timer_timeout() -> void:
	print("je cas")
	var ball = BALL_RIGID.instantiate()
	ball.freeze = false

	add_child(ball)
	pass  # Replace with function body.
