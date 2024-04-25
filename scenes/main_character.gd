extends CharacterBody2D


const SPEED = 300.0    
const JUMP_VELOCITY = -435.0

# Get the gravity from th   e project settings to be synced with RigidBody nodes.
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
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

var score = 0  # Player's score
var inventory  # Reference to the inventory node

func _ready():
	inventory = Inventory  # Directly access the autoloaded inventory

	# Assuming PickupDetector is a child of the scene's root node, directly accessible from this script's node
	# Adjust the path as necessary based on your actual scene setup
	var pickupDetectorPath = "Path/To/PickupDetector"
	var pickupDetector = get_node_or_null(pickupDetectorPath)

	if pickupDetector:
		pickupDetector.connect("picked_up", Callable(self, "_on_Trash_picked_up"))
	else:
		print("PickupDetector not found at path:", pickupDetectorPath)


func _on_Trash_picked_up():
	score += 1  # Increase score for each trash picked up
	inventory.add_item("Trash")  # Add trash to inventory
	print("Trash picked up. Current score: ", score)
