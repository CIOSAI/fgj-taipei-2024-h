extends CharacterBody2D

signal died

var hp:float = 20 : 
	set(f):
		hp = f
		if f<=0:
			died.emit()

func _physics_process(delta):
	var dir:Vector2
	if Input.is_action_pressed("move_up"):
		dir.y -= 1
	if Input.is_action_pressed("move_down"):
		dir.y += 1
	if Input.is_action_pressed("move_left"):
		dir.x -= 1
	if Input.is_action_pressed("move_right"):
		dir.x += 1
	
	velocity = dir.normalized()*100
	move_and_slide()

func _on_hit_area_hurt(damage):
	hp -= damage
	%Label.text = str(hp)
