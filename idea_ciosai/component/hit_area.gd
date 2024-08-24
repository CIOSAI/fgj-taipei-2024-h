extends Area2D

signal hurt(damage:float)

func on_hurt(damage):
	hurt.emit(damage)
