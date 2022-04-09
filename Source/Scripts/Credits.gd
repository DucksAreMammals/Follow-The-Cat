extends RichTextLabel

func _on_RichTextLabel_meta_clicked(meta):
	OS.shell_open(str(meta))

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	yield(get_tree().create_timer(5.0), "timeout")
	visible = true
