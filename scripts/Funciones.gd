extends Node3D


func _ready() -> void:
	Saludar("Cristian")
	Saludar("Pepe")

func Saludar(nombre: String):
	OS.alert("Hola: " + nombre)
