extends Area3D




func _on_body_entered(body: Player) -> void:
	if body.is_in_group("player"):
		body.AgregarMoneda()
		queue_free()
