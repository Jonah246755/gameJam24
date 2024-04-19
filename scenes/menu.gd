extends Control

func _on_play_pressed():
	pass # Replace with function body.


func _on_level_select_pressed():
	get_tree().change_scene_to_file("res://scenes/levelmenu.tscn")


func _on_button_pressed():
	get_tree().change_scene_to_file("res://scenes/settings.tscn")


func _on_resume_pressed():
	get_tree().change_scene_to_file("res://scenes/level1.tscn")

