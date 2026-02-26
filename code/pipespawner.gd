extends Node

var pipeScene = preload("res://scenes/pipes.tscn")
var dt = 0
var pipeInterval = 4

func _process(delta: float) -> void:
	if dt > pipeInterval:
		spawn()
		dt = 0
	else:
		dt += delta
	
func spawn():
	var y = randi_range(200, 600)
	var instance = pipeScene.instantiate()
	instance.position = Vector2(650, y)
	add_child(instance)
