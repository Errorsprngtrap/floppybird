class_name manager
extends Node2D

@export var pipescene:PackedScene
@onready var pipe_timer: Timer = $PipeTimer
@onready var pipe: Node2D = $Pipe
@onready var player: Player = $Player
@onready var bgarea: Node2D = $bgarea
@onready var floor : Floor = $Floor
@onready var theme: AudioStreamPlayer = $Theme

var scroll : float = 0
var scroll_spd : float = 2

func _ready() -> void:
	theme.play()

func _process(_delta: float) -> void:
	if Global.run == true :
		scroll += scroll_spd
		if scroll > get_window().size.x :
			scroll = 0
		floor.position.x = -scroll
		bgarea.position.x = -scroll
	
func spawnpipe():
	if Global.run == true :
		var pipeinstance:Node2D = pipescene.instantiate()
		pipeinstance.position = Vector2(1250,randf_range(100,350))
		pipe.add_child(pipeinstance)

func _on_pipe_timer_timeout() -> void:
	spawnpipe()
