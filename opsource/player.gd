extends CharacterBody2D
class_name Player

signal died

const MAX_SPEED: float = 200.0
const ACCE: float = 800.0
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var sprite_2d: Sprite2D = $Sprite2D

func _ready():
	Global.player = self

func _physics_process(delta: float) -> void:
	velocity = velocity.move_toward(Input.get_vector("move_left","move_right","move_up", "move_down") * MAX_SPEED, ACCE * delta)
	move_and_slide()
	
	if velocity.length() < .1:
		animation_player.play(&"idle")
	else:
		animation_player.play(&"walk")

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("move_right"):
		sprite_2d.flip_h = true
	if event.is_action_pressed("move_left"):
		sprite_2d.flip_h = false

func _on_hp_hp_updated(new_hp):
	%Healthbar.set_hp(new_hp)
	if new_hp<=0:
		died.emit()
