extends Node


signal Saludar(nombre: String)

func _ready() -> void:
	await get_tree().create_timer(5).timeout
	Saludar.emit(name)
