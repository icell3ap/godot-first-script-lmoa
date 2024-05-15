extends Sprite


var angular_speed = PI * 3
var speed = 600.0
var max_speed = 600
var acc = Vector2.ZERO
var velocity = Vector2.ZERO

func _process(delta: float) -> void:
	
	var direction = 0
	if Input.is_action_pressed("ui_left"):
		direction += -1
	if Input.is_action_pressed("ui_right"):
		direction += 1

	rotation += angular_speed * direction * delta
	
#	if Input.is_action_pressed("ui_up"):
#	position += Vector2.UP.rotated(rotation) * speed * delta
	acc = Vector2.ZERO
	if Input.is_action_pressed("ui_up"):
		acc = Vector2.UP.rotated(rotation) * 1
	if Input.is_action_pressed("ui_down"):
		acc = Vector2.UP.rotated(rotation) * -1
		
	acc *= 2
	
	velocity += acc
	print('before', velocity)
	# applying friction
	velocity += velocity.normalized() * -1 * 0.2
	print('after', velocity)
	velocity = velocity.clamped(max_speed)
	
	position += velocity * delta
