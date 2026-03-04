extends Node

var dt = 10
var cloudScene = preload("res://scenes/cloud.tscn")

func _process(delta: float) -> void:
	var wolkInterval = randi_range(3, 30)
	if dt > wolkInterval:
		spawn()
		dt = 0
	else:
		dt += delta
		
func spawn():
	var y = randi_range(0, 200)
	var cloud = cloudScene.instantiate()
	cloud.position = Vector2(700, y)
	cloud.frame = randi_range(0, 5)
	add_child(cloud)
