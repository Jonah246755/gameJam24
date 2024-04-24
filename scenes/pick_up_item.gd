extends Area2D

signal picked_up  # Signal to emit when the trash is picked up

func _ready():
	# Use Callable for connecting in Godot 4.2.1
	connect("body_entered", Callable(self, "_on_body_entered"))
	print("Trash is ready and listening for collisions.")

func _on_body_entered(body):
	print("Collision detected with: ", body.name)
	if body.is_in_group("Player"):  # Ensure only the player can pick up trash
		print("Collision with Player confirmed. Emitting 'picked_up' signal.")
		emit_signal("picked_up")
		queue_free()  # Remove the trash from the scene
		print("Trash has been picked up and removed.")
