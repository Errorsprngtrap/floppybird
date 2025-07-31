class_name Scorer
extends Control

@onready var label: Label = $ColorRect/Label
@onready var label_2: Label = $ColorRect/Label2
@onready var restart: AudioStreamPlayer = $Restart

func _ready() -> void:
	label.text = "Score: " + str(Global.score)	
	label_2.text = "Highest Score: " + str(GameData.bestscore)

func _on_button_pressed() -> void:
	Global.run = true
	Global.score = 0
	get_tree().reload_current_scene()

func _on_button_mouse_entered() -> void:
	restart.play()
