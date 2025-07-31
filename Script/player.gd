class_name Player
extends CharacterBody2D

const JUMP_VELOCITY : float  = -300.0
var GroundTouch : bool = false

@onready var sprite_2d: Sprite2D = $Sprite2D
@export var scorer : PackedScene
@onready var main_game: manager = $".."
@onready var crash: AudioStreamPlayer = $Crash

func _ready() -> void :
	Global.death.connect(_on_death)
	Global.ground.connect(_on_ground)
	
func _physics_process(delta: float) -> void:
	velocity += get_gravity() * delta

	if Input.is_action_just_pressed("ui_accept") and Global.run == true :
		velocity.y = JUMP_VELOCITY
	if GroundTouch == false :
		move_and_collide(velocity * delta)
		set_rotation(deg_to_rad(velocity.y * 0.025))

func _on_death():
	if Global.run == true :
		Global.run = false
		sprite_2d.rotate(PI/2)
		if GameData.bestscore < Global.score :
			GameData.bestscore = Global.score
			GameData.save_data()
		var scorer_instance = scorer.instantiate()
		scorer_instance.position = Vector2(get_window().size.x/2,get_window().size.y/2)
		main_game.add_child(scorer_instance)

func _on_ground() :
	GroundTouch = true
	crash.play()
	_on_death()
