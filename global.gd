extends Node2D

enum GameState {PREPARING=1, RUNNING=2, FAILED=3, FINISHED=4}
var Ball: Ball
var _CurrentGameState: GameState = GameState.PREPARING
var isDragging = false

func setState(newState: GameState):
	_CurrentGameState = newState

func isStateActive(state: GameState) -> bool:
	#print("isStateActive", state, getState())
	return getState() == state

func getState() -> GameState:
	return _CurrentGameState
