extends Spatial



func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	OS.window_fullscreen = true

func _load_next():
	get_tree().change_scene("res://Scenes/Screens/Credits.tscn")
