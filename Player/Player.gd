extends CharacterBody2D

const ACCELERATION = 500
const FRICTION = 500
const MAX_SPEED = 100

var pVelocity = Vector2.ZERO
# delta is time last frame took. Also, this is called every tick.
func _physics_process(delta):
	
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_vector = input_vector.normalized()
	
	if input_vector != Vector2.ZERO:
		pVelocity = pVelocity.move_toward(input_vector*MAX_SPEED, ACCELERATION*delta)
		pVelocity = pVelocity.limit_length(MAX_SPEED)
	else:
		pVelocity = pVelocity.move_toward(Vector2.ZERO, FRICTION * delta)
	
	velocity = pVelocity;
	move_and_slide()




## Get the gravity from the project settings to be synced with RigidBody nodes.
#var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
#
#
#func _physics_process(delta):
#	# Add the gravity.
#	if not is_on_floor():
#		velocity.y += gravity * delta
#
#	# Handle Jump.
#	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
#		velocity.y = JUMP_VELOCITY
#
#	# Get the input direction and handle the movement/deceleration.
#	# As good practice, you should replace UI actions with custom gameplay actions.
#	var direction = Input.get_axis("ui_left", "ui_right")
#	if direction:
#		velocity.x = direction * SPEED
#	else:
#		velocity.x = move_toward(velocity.x, 0, SPEED)
#
#	move_and_slide()
