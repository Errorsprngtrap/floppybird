class_name score_hud
extends Control

@onready var label: Label = $Label

func _ready() -> void:
	Global.scorechange.connect(_on_score_change)
	label.text = "score:" + str(Global.score)

func _on_score_change(newscore:int) -> void:
	label.text = "score:" + str(Global.score)
