extends CharacterBody2D

const TILE_SIZE = 16
@export var tilemap: TileMapLayer  # assign in Inspector

func _process(_delta):
	var move = Vector2.ZERO

	if Input.is_action_just_pressed("ui_up"):
		move = Vector2(0, -1)
	elif Input.is_action_just_pressed("ui_down"):
		move = Vector2(0, 1)
	elif Input.is_action_just_pressed("ui_left"):
		move = Vector2(-1, 0)
	elif Input.is_action_just_pressed("ui_right"):
		move = Vector2(1, 0)

	if move != Vector2.ZERO:
		move_one_tile(move)

func move_one_tile(dir: Vector2):
	var target_pos = global_position + dir * TILE_SIZE

	# Check if path is clear before moving
	var space_state = get_world_2d().direct_space_state
	var query = PhysicsRayQueryParameters2D.create(global_position, target_pos)
	query.collide_with_areas = false
	query.collide_with_bodies = true

	var result = space_state.intersect_ray(query)

	if result.is_empty():
		# No collision → move
		global_position = target_pos
	else:
		print("Blocked by wall")

func _check_tile():
	# Get world position → map cell position
	var cell = tilemap.local_to_map(position)

	# Get the tile data in that cell
	var tile_data = tilemap.get_cell_tile_data(cell)

	if tile_data == null:
		return  # no tile here

	var tile_id = tilemap.get_cell_source_id(cell)

	# Example: check if tile is ID 3
	if tile_id == 3:
		_on_landed_on_trap()

func _on_landed_on_trap():
	print("Stepped on a trap!")
	modulate = Color.RED
