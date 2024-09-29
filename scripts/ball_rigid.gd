class_name Ball

extends RigidBody2D

var position0 = Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.Ball = self
	position0 = self.global_position

	self.freeze = true
	print("_ready", position0)


 #Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	self.freeze = !Global.isStateActive(Global.GameState.RUNNING)

func reset() -> void : 
	print("reset", position0)
	PhysicsServer2D.body_set_state(
	get_rid(),
	PhysicsServer2D.BODY_STATE_TRANSFORM,
	Transform2D.IDENTITY.translated(position0)
)
	
	
