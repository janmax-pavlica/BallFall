class_name ResetButton
extends Button


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	self.disabled = !Global.isStateActive(Global.GameState.RUNNING)
	if Input.is_action_just_released("ui_accept") :
		Global.setState(Global.GameState.RUNNING)
		Global.Ball.reset();
	
func _gui_input(event: InputEvent) -> void:
	if event.is_pressed() && !self.disabled:
		Global.setState(Global.GameState.PREPARING)
		Global.Ball.reset();
