extends Area2D

# Called when the node enters the scene tree for the first time.
func _ready():
	# Connect the "body_entered" signal to a function that will handle the pickup using Godot 4.x syntax.
	body_entered.connect(_on_PickupItem_body_entered)

# This function is called when a body enters the pickup's Area2D.
func _on_PickupItem_body_entered(body):
	if body.name == "CharacterBody2D":  # Ensure the colliding body is your player.
		# Here you can implement what happens when a pickup is collected.
		# For example, increase score, add items to inventory, etc.
		queue_free()  # Removes the pickup from the scene.
