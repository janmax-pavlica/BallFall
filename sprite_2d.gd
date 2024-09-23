extends Sprite2D

var is_dragging = false
var delay = 0.2
var mouse_offset

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:
				# Check if the mouse is over the object
				print( "pressed, event position", event.position)
				if get_rect().has_point(to_local(event.position)):
					
					print( "clicked on sprite", event.position)
					is_dragging = true
					mouse_offset = event.position - global_position
			else:
				print( "uo")
				# Stop dragging when mouse button is released
				is_dragging = false
	elif event is InputEventMouseMotion and is_dragging:
		# Move the object with the mouse
		global_position = event.position - mouse_offset


			
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

		
#extends Node2D
#
## To track the dragging state
#var is_dragging = false
#
## Offset for smooth dragging
#var drag_offset = Vector2.ZERO
#
## Reference to the child Sprite2D node
#var sprite_node: Sprite2D
#
## Called when the node is ready
#func _ready():
	#sprite_node = $Sprite2D  # Adjust the path if your Sprite2D is deeper
#
## Called when the node is clicked
#func _input(event):
	#if event is InputEventMouseButton:
		#if event.button_index == MOUSE_BUTTON_LEFT:
			#if event.pressed:
				## Convert the event position to the local coordinates of the Node2D
				#var local_mouse_position = to_local(event.position)
				#print( local_mouse_position)
				## Check if the mouse is over the Sprite2D object
				#if get_sprite_rect().has_point(local_mouse_position):
					#is_dragging = true
					#drag_offset = local_mouse_position - position
			#else:
				## Stop dragging when mouse button is released
				#is_dragging = false
	#elif event is InputEventMouseMotion and is_dragging:
		## Move the Node2D with the mouse in global coordinates
		#global_position = event.position - drag_offset
#
## Get the rectangle bounds of the Sprite2D
#func get_sprite_rect() -> Rect2:
	#if sprite_node and sprite_node.texture:
		#return Rect2(Vector2.ZERO, sprite_node.texture.get_size())
	#else:
		#return Rect2(Vector2.ZERO, Vector2.ZERO)  # Fallback if no texture is set


#
#extends Sprite2D
#
#@onready var sprite_2d: Sprite2D = %Sprite2D
#
#var is_dragging = false
#var mouse_offset 
#var delay = 0.2
#
#func _physics_process(delta: float) -> void:
	#if is_dragging == true:
		#var tween = get_tree().create_tween()
		#tween.tween_property(self, "position", get_global_mouse_position() , delay * delta)
		#
#
## Called when the node is clicked
#func _input(event):
	#if event is InputEventMouseButton:
		#if event.button_index == MOUSE_BUTTON_LEFT:
			#if event.pressed:
				## Check if the mouse is over the object
				#print( "pressed, event position", event.position)
#
				##
				#if get_rect().has_point(to_local(event.position)):
					#
					#print( "clicked on sprite", event.position)
					#is_dragging = true
					##mouse_offset = get_global_mouse_position() - global_position
			#else:
				#print( "uo")
				#is_dragging = false
