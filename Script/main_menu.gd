extends Control
class_name main_menu

@onready var play_2: AudioStreamPlayer = $Play2
@onready var quit_2: AudioStreamPlayer = $Quit2

func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://Scene/main_game.tscn")


func _on_play_mouse_entered() -> void:
	play_2.play()


func _on_quit_pressed() -> void:
	get_tree().quit()


func _on_quit_mouse_entered() -> void:
	quit_2.play()
