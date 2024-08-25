extends CharacterBody2D
class_name Enemy

enum EnemyType{NONE, ICE, FIRE, WIND}
@export var type: EnemyType = EnemyType.NONE:
	set(new_type):
		type = new_type
		if is_instance_valid(sprite_2d):
			sprite_2d.frame = type
@export var movement_speed: float = 90.0
@export var target: Player
var moving_direction:= Vector2.ZERO
var rotating_radius: float = PI / 4
@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var attack_box: AttackBox = $AttackBox
@export var drop: PackedScene

func _ready() -> void:
	##Call setter
	type = type
	update_target()
	Global.player_updated.connect(update_target)

func update_target():
	if is_instance_valid(Global.player):
		target = Global.player

func _physics_process(_delta: float) -> void:
	if is_instance_valid(target):
		moving_direction = - (global_position - target.global_position).normalized()
	else:
		moving_direction = moving_direction.rotated(rotating_radius)
		rotating_radius += randf_range(- PI / 8, PI / 8)
	velocity = moving_direction * movement_speed
	move_and_slide()
	sprite_2d.flip_h = velocity.x < 0

func _on_sprite_update_timer_timeout() -> void:
	sprite_2d.frame = (sprite_2d.frame + 4) % 8

func _on_hp_hp_updated(new_hp: int) -> void:
	%HurtAnim.play("default")
	if new_hp <= 0:
		var drop_money: Money = drop.instantiate()
		drop_money.global_position = global_position
		drop_money.type = type
		get_tree().current_scene.add_child.call_deferred(drop_money)
		queue_free()

func set_attack(attack: int) -> void:
	await ready
	attack_box.damage_modifiers.append(IncreaseDamage.new(attack))
