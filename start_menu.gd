extends Control

func _on_irodalom_pressed():
	GameManager.tema = "irodalom"
	get_tree().change_scene_to_file("res://main.tscn")
	
func _on_történelem_pressed():
	GameManager.tema = "történelem"
	get_tree().change_scene_to_file("res://main.tscn")
	
func _on_informatika_pressed():
	GameManager.tema = "informatika"
	get_tree().change_scene_to_file("res://main.tscn")
