extends Area2D

# Declare the signal for item collection
signal collected_item(item_name)

func _ready():
	# Connect the body_entered signal to the _on_body_entered method
	connect("body_entered", self, "_on_body_entered")
	# Connect the collected_item signal to the _on_Player_collected_item method
	connect("collected_item", self, "_on_Player_collected_item")

func _on_body_entered(body):
	# Check if the body is part of the "Collectibles" group
	if body.is_in_group("Collectibles"):
		# Emit the collected_item signal with the name of the body
		emit_signal("collected_item", body.name)
		# Remove the collectible from the scene
		body.queue_free()

func _on_Player_collected_item(item_name):
	# Print the name of the collected item to the console
	print("Collected: " + item_name)
