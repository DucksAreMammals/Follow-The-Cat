extends Area

var already_played := false

func _on_KurtisIsHereArea_body_entered(body):
	if not already_played:
		$AnimationPlayer.play($AnimationPlayer.get_animation_list()[0])
		already_played = true
