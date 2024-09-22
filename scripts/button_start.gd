class_name StartButton
extends Button


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	self.disabled = !Global.isStateActive(Global.GameState.PREPARING)
	
func _gui_input(event: InputEvent) -> void:
	if event.is_pressed() && !self.disabled:
		Global.setState(Global.GameState.RUNNING)
