extends CharacterBody3D


const velocidad = 10

func _physics_process(delta: float) -> void:
	
	if not is_on_floor():
		velocity = get_gravity()
	
	var direction = Input.get_vector("izquierda", "derecha", "adelante", "atras")
	
	if direction:
		velocity.x = direction.x * velocidad
		velocity.z = direction.y * velocidad
	else:
		velocity.x = direction.x * move_toward(velocidad, 0, delta)
		velocity.z = direction.y * move_toward(velocidad, 0, delta)
	
	move_and_slide()
