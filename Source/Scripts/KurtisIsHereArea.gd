extends Area

var already_played := false

func _on_KurtisIsHereArea_body_entered(body):
	if not already_played:
		$AnimationPlayer.play()
		already_played = true
