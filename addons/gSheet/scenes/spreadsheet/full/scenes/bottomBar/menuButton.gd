tool
extends MenuButton

var popup
onready var sheet = $"../../../HBoxContainer/Spreadsheet/Control"


func _ready():
	popup = get_popup()
	popup.connect("id_pressed", self, "_on_item_pressed")


func _on_item_pressed(id):
	if id == 0:
		$"../ButtonFromCSV/FileDialog".popup_centered_ratio(0.5)
	elif id == 1:
		$"../../../../DataFromText".popup_centered_ratio(0.5)
		

	print(id, " pressed")
