extends Control

var score: int

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	$score.text = "score: " + str(score)
	if Input.is_action_just_pressed("g"):
		get_tree().reload_current_scene()


func _on_button_pressed() -> void:
	$AnimationPlayer.play("get out")
	get_tree().reload_current_scene()
