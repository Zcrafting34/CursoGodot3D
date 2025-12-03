extends Node3D

var max_up := deg_to_rad(60)
var min_down := deg_to_rad(-60)
var sens:= 0.003
var pitch := 0.0

func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		
		pitch -= event.relative.y * sens
		
		pitch = clamp(pitch, min_down, max_up)
		
		rotation.x = pitch
