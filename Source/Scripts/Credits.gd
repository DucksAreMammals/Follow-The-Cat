extends RichTextLabel

func _on_RichTextLabel_meta_clicked(meta):
	OS.shell_open(str(meta))

func _ready():
	yield(get_tree().create_timer(5.0), "timeout")
	visible = true
