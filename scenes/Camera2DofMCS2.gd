extends Camera2D

func _process(_delta):
	# Get the visible rectangle of the viewport
	var viewport_rect = get_viewport_rect()

	# Set the limit rectangle to match the viewport
	set_limits(viewport_rect)

func set_limits(rect):
	# Set the limit rectangle of the camera using limit properties
	limit_left = rect.position.x
	limit_top = rect.position.y
	limit_right = rect.position.x + rect.size.x
	limit_bottom = rect.position.y + rect.size.y
