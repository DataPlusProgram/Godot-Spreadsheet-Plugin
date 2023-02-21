tool
extends Control
signal dictChanged



func dictChanged(dict):
	emit_signal("dictChanged",dict)

func setTitle(text):
	$VBoxContainer/Label.text = text
