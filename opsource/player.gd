extends CharacterBody2D
class_name Player

signal died

@export var canon_template: PackedScene
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
		Global.player_died.emit()
		leave_lagacy()

func append_canon(canon: AutoCanon):
	add_child(canon)

func leave_lagacy() -> void:
	var picker_to_leave:= CanonPicker.new()
	for child in get_children():
		if child is AutoCanon:
			child.time_gap_between_shoot *= 1.7
			picker_to_leave.lagacy_canons.append(child.duplicate())
	
	var my_canon: AutoCanon = canon_template.instantiate()
	var my_money: int = 0
	var top_type: int = 0
	var top_type_money: int = 0
	var top_money_occuered_times: int = 1
	for i: int in $MoneyAccepter.collected_money.size():
		my_money += $MoneyAccepter.collected_money[i]
		if $MoneyAccepter.collected_money[i] > top_type_money:
			top_type_money = $MoneyAccepter.collected_money[i]
			top_type = i
			top_money_occuered_times = 1
		elif $MoneyAccepter.collected_money[i] == top_type_money:
			top_money_occuered_times += 1
	
	if top_money_occuered_times > 1:
		top_type = 0
	my_canon.damage_modifiers.append(ChangeDamageType.new(top_type))
	my_canon.damage_modifiers.append(IncreaseDamage.new(my_money))
	
	picker_to_leave.new_canon = my_canon
	get_tree().current_scene.add_child(picker_to_leave)
