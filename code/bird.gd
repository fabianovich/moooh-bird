extends CharacterBody2D

const JUMP_VELOCITY = -500.0

var game = true
var deathScreen = preload("res://scenes/deathscreen.tscn")
#var flap = false
#var fall = false

func _physics_process(delta: float) -> void:
	velocity += get_gravity() * delta
	if game:
		# position.x = 300
		# Add the gravity.
		

		# Handle jump.
		if Input.is_action_just_pressed("space"):
			velocity.y = JUMP_VELOCITY
			
		
		if position.y > 800 or position.y < 0:
			ded()
		 
		for index in get_slide_collision_count():
				var collision := get_slide_collision(index)
				var body := collision.get_collider()
				print(body.name)
				#game over
				ded()
	move_and_slide()
	
func deathscreen():
	var screen = deathScreen.instantiate()
	screen.score = $"../Control/Score".score
	$"../Control/Score".visible = false
	add_sibling(screen)
	
func ded():
	game = false
	$CollisionShape2D.disabled = true
	deathscreen()
