extends Node2D

@onready var sprite_2d: Sprite2D = %Sprite2D

var is_dragging = false
var delay = 0.2
var mouse_offset

func _input(event):
	if event is InputEventMouseButton:
		
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:
				# Check if the mouse is over the object
				print( "pressed, event position", event.position)
				if sprite_2d.get_rect().has_point(to_local(event.position)):
					
					print( "clicked on sprite", event.position)
					is_dragging = true
					mouse_offset = event.position - global_position
			else:
				print( "uo")
				# Stop dragging when mouse button is released
				is_dragging = false
		elif event.button_index == MOUSE_BUTTON_RIGHT:
			if event.pressed:
				if sprite_2d.get_rect().has_point(to_local(event.position)):
					print( "double click")
					rotation_degrees += 90
	elif event is InputEventMouseMotion and is_dragging:
		# Move the object with the mouse
		global_position = event.position - mouse_offset
