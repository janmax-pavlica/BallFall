extends Node2D

var draggable = false
var isInsideDroppable = false
var bodyRef
var isDragging = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#print(Input)
	if Input.is_action_pressed("click"):
		print("if Input.is_action_pressed(\"click\"):")
	if draggable:
		if Input.is_action_pressed("click"):
			global_position = get_global_mouse_position()
		elif Input.is_action_just_released("click"):
			Global.isDragging = false
			
func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.is_pressed():
			if get_rect()
			print("down")
		else:
			print("up")
			
#func _input(event: InputEvent) -> void:
	#if draggable:
		#if event is InputEventMouseButton:
			#print( event)
			##print( Input.action_press(""))
			#if event.is_released():
				#Global.isDragging = false
				#print('click released')
			#else:
				#global_position = get_global_mouse_position()
				#print('click pressed')
			#print(event.button_index, event.is_released())
			


#func _on_ramp_body_entered(body: Node2D) -> void:
#
#
#func _on_ramp_body_exited(body: Node2D) -> void:




func _on_area_2d_mouse_exited() -> void:
	print("mouse exited")
	if not Global.isDragging:
		draggable = true
		scale = Vector2(1,1)

func _on_area_2d_mouse_entered() -> void:
	print("mouse entered")
	if not Global.isDragging:
		draggable = true
		scale = Vector2(1.05,1.05)
