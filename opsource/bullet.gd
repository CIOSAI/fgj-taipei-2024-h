extends Area2D
class_name Bullet

var damage: DamageStats
@export var base_damage: DamageStats
@export var penetrating: bool = false
#@export var life_time: float = 1.0:
	#set(new_time):
		#life_time = new_time
		#if life_time <= 0.0:
			#queue_free()
@export var travel_speed: float = 1000.0
@export var travel_direction:= Vector2.ZERO
var shooter: Node2D

func _physics_process(delta: float) -> void:
	position += travel_direction * travel_speed * delta
	#life_time -= delta

func _draw() -> void:
	var bullet_color: Color
	match base_damage.damage_type:
		DamageStats.DamageType.NONE:
			bullet_color = Color.BURLYWOOD
		DamageStats.DamageType.WIND:
			bullet_color = Color.SKY_BLUE
		DamageStats.DamageType.ICE:
			bullet_color = Color.CYAN
		DamageStats.DamageType.FIRE:
			bullet_color = Color.PALE_VIOLET_RED
	draw_circle(Vector2.ZERO, 10, bullet_color)
	%Particles.color = bullet_color

func deactivate() -> void:
	queue_free()
	#%CollisionShape2D.set_deferred("disabled", true)
	#process_mode = PROCESS_MODE_DISABLED
	#%Particles.emitting = false

func _on_life_timer_timeout():
	queue_free()
