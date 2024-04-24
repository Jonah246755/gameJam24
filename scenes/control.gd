extends Control

signal move_player(direction)

func _on_UpButton_pressed():
	emit_signal("move_player", Vector2.UP)

func _on_DownButton_pressed():
	emit_signal("move_player", Vector2.DOWN)

func _on_LeftButton_pressed():
	emit_signal("move_player", Vector2.LEFT)

func _on_RightButton_pressed():
	emit_signal("move_player", Vector2.RIGHT)
