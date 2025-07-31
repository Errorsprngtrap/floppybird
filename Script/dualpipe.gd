class_name dual_pipe
extends Node2D

@onready var point: AudioStreamPlayer = $Point
@onready var timer: Timer = $Timer
var touched:bool = false

func _process(_delta: float) -> void:
	if Global.run == true :
		position.x -= 2

func _on_timer_timeout() -> void:
	if Global.run == true :
		queue_free()
	else :
		timer.autostart = false

func _on_area_2d_body_entered(_body: Node2D) -> void:
	if touched == false : 
		touched = true
		point.play()
		Global.score += 1
		Global.scorechange.emit(Global.score)
