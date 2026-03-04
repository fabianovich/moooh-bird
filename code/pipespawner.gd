extends Node

#var pipeUpScene = preload("res://scenes/pipe_up.tscn")
#var pipeDownScene = preload("res://scenes/pipe_down.tscn")
#var collisionScene = preload("res://scenes/score_collision.tscn")
var pipeScene = preload("res://scenes/pipes.tscn")
var dt = 0
var pipeInterval = 3

func _process(delta: float) -> void:
	if dt > pipeInterval:
		spawn()
		dt = 0
	else:
		dt += delta
	
func spawn():
	var y = randi_range(200, 600)
	var pipes = pipeScene.instantiate()
	pipes.position = Vector2(700, y)
	add_child(pipes)
	#var pipeUp = pipeUpScene.instantiate()
	#var pipeDown = pipeDownScene.instantiate()
	#var collision = collisionScene.instantiate()
	#pipeDown.position = Vector2(650, y + 100)
	#pipeUp.position = Vector2(650, y - 100)
	#collision.position = Vector2(650, y)
	#add_child(collision)
	#add_child(pipeUp)
	#add_child(pipeDown)
