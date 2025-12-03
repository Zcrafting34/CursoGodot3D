extends CharacterBody3D

var velocidad: float = 5.4

func _physics_process(delta: float) -> void:
	
	if not is_on_floor():
		velocity.y -= 1
	
	var direction: Vector2 = Input.get_vector(
		"izquierda",
		"derecha",
		"adelante",
		"atras"
		)
	
	velocity.x = direction.x * velocidad
	velocity.z = direction.y * velocidad
	
	move_and_slide()
