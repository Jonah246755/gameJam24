extends Panel

var inventory_items = []  # Store inventory item data
var item_containers = []  # Store references to item containers

func _ready():
	hide()  # Start with the inventory hidden
	set_process_input(true)  # Enable input processing

func _input(event):
	if event.is_action_pressed("toggle_inventory"):
		visible = !visible  # Toggle the visibility of the inventory
		if visible:
			update_inventory_display()
		get_tree().input_handled()  # Mark the input as handled

func add_item(item_type, sprite_path):
	inventory_items.append({"type": item_type, "sprite_path": sprite_path})
	if visible:
		update_inventory_display()

func update_inventory_display():
	clear_inventory_display()  # Clear previous items

	for item_data in inventory_items:
		var item_container = HBoxContainer.new()
		add_child(item_container)
		item_containers.append(item_container)  # Store reference for future updates

		var item_label = Label.new()
		item_label.text = "Item: " + str(item_data["type"])
		item_container.add_child(item_label)

		var item_sprite = Sprite2D.new()
		var texture = load(item_data[""])
		item_sprite.texture = texture
		item_sprite.scale = Vector2(0.5, 0.5)  # Adjust scale if necessary
		item_container.add_child(item_sprite)

func clear_inventory_display():
	for container in item_containers:
		remove_child(container)
		container.queue_free()
	item_containers.clear()  # Clear references
