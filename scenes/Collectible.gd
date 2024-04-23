extends Area2D

signal item_picked_up(item_value)
var item_value = 10

func _ready():
	connect("body_entered", Callable(self, "_on_body_entered"))

func _on_body_entered(body: Node):
	if body.is_in_group("Player"):
		emit_signal("item_picked_up", item_value)
		queue_free()  # Optionally remove the collectible upon pickup
