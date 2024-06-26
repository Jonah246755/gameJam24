extends CharacterBody2D

const SPEED = 300.0    
const JUMP_VELOCITY = -435.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_up") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

# Whenever you want to update the camera's limit_rect, call this function
func update_camera_limit_rect(rect):
	var camera = $Camera2D
	if camera:
		camera.set_limit_rect(rect)
	else:
		print("Camera2D node not found.")
