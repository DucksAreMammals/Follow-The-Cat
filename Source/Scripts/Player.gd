extends KinematicBody

var mouse_sensitivity := 0.45

var acceleration_speed := 1.5

var friction := 0.5
var gravity := 8.0

var velocity := Vector3.ZERO

func _process(delta):
	_apply_gravity()
	_apply_movement()
	
	velocity = move_and_slide(velocity, Vector3.UP, true)

func _input(event):
	if event is InputEventMouseMotion and Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		rotation_degrees.y += -event.relative.x * mouse_sensitivity
		$Camera.rotation_degrees.x = clamp($Camera.rotation_degrees.x + -event.relative.y * mouse_sensitivity, -90, 90)


func _apply_gravity():
	velocity.y -= gravity
	velocity *= friction


func _apply_movement():
	var back = 1 if Input.is_action_pressed("Back") else 0
	var forward = 1 if Input.is_action_pressed("Forward") else 0
	var left = 1 if Input.is_action_pressed("Left") else 0
	var right = 1 if Input.is_action_pressed("Right") else 0
	
	var acceleration = Vector2(forward - back, left - right).rotated(deg2rad(rotation_degrees.y))
	
	if acceleration.length_squared() > 1:
		acceleration *= 1 / acceleration.length()
	
	velocity.x += acceleration.x * acceleration_speed
	velocity.z += -acceleration.y * acceleration_speed
	
