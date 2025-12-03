class_name Player
extends CharacterBody3D

var coins: int = 0

const SPEED = 5.0
const JUMP_VELOCITY = 8
@export var sens: float = 0.001

func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	$CanvasLayer/Control/Label.text = "Coins: " + str(coins)

func _input(event):
	if event.is_action_pressed("salir"):
		get_tree().quit()
	if event is InputEventMouseMotion:
		rotate_y(-event.relative.x * sens)

func _physics_process(delta: float) -> void:

	if not is_on_floor():
		velocity += get_gravity() * delta
		ComprobarAltura()


	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY


	var input_dir := Input.get_vector("izquierda", "derecha", "adelante", "atras")
	var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()

func ComprobarAltura():
	if global_position.y <= -15.0:
		Die()


func Die():
	get_tree().reload_current_scene()
	

func AgregarMoneda():
	coins += 1
	$CanvasLayer/Control/Label.text = "Coins: " + str(coins)
