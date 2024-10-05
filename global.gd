extends Node2D
@onready var Ball: Ball = $osBallRigid

enum GameState { PREPARING = 1, RUNNING = 2, FAILED = 3, FINISHED = 4 }
var _CurrentGameState: GameState = GameState.PREPARING
var isDragging = false


func _draw() -> void:
	for n in 12:
		draw_line(
			Vector2(128, 128 + 64 * n), Vector2(128 + 64 * 14, 128 + 64 * n), Color.DIM_GRAY, 1
		)
	for n in 14:
		draw_line(
			Vector2(128 + 64 * n, 128), Vector2(128 + 64 * n, 128 + 64 * 14), Color.DIM_GRAY, 1
		)
	#draw_multiline([Vector2(128,128),Vector2(128*12,128)],Color.RED,1)


func setState(newState: GameState):
	_CurrentGameState = newState


func isStateActive(state: GameState) -> bool:
	#print("isStateActive", state, getState())
	return getState() == state


func getState() -> GameState:
	return _CurrentGameState
