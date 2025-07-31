class_name Pipe
extends Area2D

func _on_body_entered(_body: Node2D) -> void:
	Global.death.emit()
