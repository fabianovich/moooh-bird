extends Area2D
@onready var label = get_node("../../../Control/Label")

func _on_body_entered(body: Node2D) -> void:
	print(body.name)
	label.score += 1
