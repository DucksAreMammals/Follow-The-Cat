extends Spatial

export (NodePath) var animation_player = null
export (NodePath) var player = null

var activation_index := 0.35
var animation_index := 0

func _ready():
	if animation_player:
		animation_player = get_node(animation_player)
	
	if player:
		player = get_node(player)

func _process(delta):
	if animation_player and \
		player and \
		not animation_player.is_playing() and \
		animation_index < animation_player.get_animation_list().size():
			var distance = Vector3(player.translation - translation)
			distance.y = 0
			
			if distance.length() < activation_index:
				animation_player.play(animation_player.get_animation_list()[animation_index])
				animation_index += 1
