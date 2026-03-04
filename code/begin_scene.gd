extends Node2D

var lines = [["I ducking hate cows!!", "All they do is fart and eat grass all day!!", "Milk and beef don't even taste that good!!"], 
			["What if I got rid of them?", "It's not like people are gonna miss them", "Only, how do I do that?"], 
			["Ah hah!", "What if I poisoned their grass?", "..."] ]
@onready var label: RichTextLabel = $dialog


var dt = 0
var bar = 0
var display = ""
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if bar == 0 or (Input.is_action_pressed("space") and bar < 4):
		for line in lines[bar]:
			typewriter(line, 50.0)
			
	


func typewriter(text: String, chars_per_second: float = 20.0) -> void:
	label.text = text
	label.visible_characters = 0
	
	var tween = create_tween()
	tween.tween_property(label, "visible_characters", label.get_total_character_count(), 
						 label.get_total_character_count() / chars_per_second)
