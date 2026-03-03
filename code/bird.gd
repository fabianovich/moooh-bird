extends CharacterBody2D

const JUMP_VELOCITY = -500.0

var game = true

func _physics_process(delta: float) -> void:
	if game:
		# position.x = 300
		# Add the gravity.
		if not is_on_floor():
			velocity += get_gravity() * delta

		# Handle jump.
		if Input.is_action_just_pressed("ui_accept"):
			velocity.y = JUMP_VELOCITY
		
		for index in get_slide_collision_count():
				var collision := get_slide_collision(index)
				var body := collision.get_collider()
				print(body.name)
				#game over
				game = false
		move_and_slide()
