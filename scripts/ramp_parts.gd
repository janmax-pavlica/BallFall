extends Node2D

@onready var sprite_2d: Sprite2D = %Sprite2D

var is_dragging = false
var delay = 0.2
var mouse_offset
const min_x = 128
const min_y = 128
const tile_size = 64
const offset = tile_size/2



func _ready() -> void:
	print( 'Ramp ready', global_position	)

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
				if sprite_2d.get_rect().has_point(to_local(event.position)) and is_dragging:
					global_position = get_posistion_in_grid(event.position)
					#get_posistion_in_grid(global_position)
					print( "uo")
					# Stop dragging when mouse button is released
					print( global_position, ' X ', position)
				is_dragging = false
		elif event.button_index == MOUSE_BUTTON_RIGHT:
			if event.pressed:
				if sprite_2d.get_rect().has_point(to_local(event.position)):
					print( "double click")
					rotation_degrees += 90
	elif event is InputEventMouseMotion and is_dragging:
		# Move the object with the mouse
		global_position = event.position - mouse_offset

func get_posistion_in_grid(position: Vector2) -> Vector2:
	var ramps = get_tree().get_nodes_in_group("ramps")
	var new_position = Vector2(round_position_to_grid(position.x, min_x), round_position_to_grid(position.y, min_y))
	for ramp in ramps:
		if new_position == ramp.global_position:
			print('COLISION!')
			new_position = get_posistion_in_grid(Vector2(new_position.x + tile_size, new_position.y) )
	#print(ramps)
	return new_position

func round_position_to_grid(one_position: int, min_position: int) -> int:
	var axis = (one_position - min_position - offset) as int
	var axis_reminder = axis % tile_size
	var axis_division = axis / tile_size
	var new_axis = axis_division * tile_size
	if axis_reminder > tile_size / 2 :
		new_axis += tile_size
	new_axis += offset + min_position 
	print('axis',axis, ' - axis_reminder ', axis_reminder, ' - axis_division', axis_division, ' - new_axis',new_axis, ' - ', one_position)		
	return new_axis
