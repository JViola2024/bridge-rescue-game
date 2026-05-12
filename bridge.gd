extends Node2D

var current_bridge_piece = 1

func add_bridge_piece():
	if current_bridge_piece <= 12:
		var piece_name = "Bridge" + str(current_bridge_piece)
		get_node(piece_name).show()
		current_bridge_piece += 1

func remove_bridge_piece():
	if current_bridge_piece > 1:
		current_bridge_piece -= 1
		var piece_name = "Bridge" + str(current_bridge_piece)
		get_node(piece_name).hide()
