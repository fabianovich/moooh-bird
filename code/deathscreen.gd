extends Control

var score: int

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	$score.text = "score:" + str(score)


func _on_button_pressed() -> void:
	pass # Replace with function body.
