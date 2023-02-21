tool
extends HBoxContainer

onready var sheet = $"../../HBoxContainer/Spreadsheet/Control"
func _on_Save_pressed():
	sheetGlobal.saveNodeAsScene(get_parent())


func _on_ButtonFromArray_pressed():
	var t : WindowDialog= $"../../DataFromText" 
	t.popup_centered_ratio(0.5)


var csvPath = ""

func _on_FileDialog_file_selected(path):
	$ButtonFromCSV/csvHeadings.popup_centered()
	csvPath = path
	


func _on_ButtonFromCSV_pressed():
	$ButtonFromCSV/FileDialog.popup()


func _on_ButtonSave_pressed():
	var data = sheet.serializeData()
	var res = load("res://addons/gSheet/scenes/gsheet.gd").new()
	res.data = data
	ResourceSaver.save("res://dbg/savedFormat2.tres",res)
	
	sheetGlobal.saveNodeAsScene(self,"res://dbg/sScen.tscn")


func _on_ButtonLoad_pressed():
	sheet.loadFromFile("res://dbg/savedFormat2.tres")
	sheet.updateSizings()


func _on_addCategory_pressed():
	sheet.addColumn("")
	sheet.updateSizings()





func _on_ButtonDeleteCurSol_pressed():
	sheet.deleteCurRow()
	pass # Replace with function body.


func _on_ButtonDeleteCurCol_pressed():
	sheet.deleteCurCol()


func _on_ButtonAddRow_pressed():
	sheet.addRow()
	sheet.updateSizings()
	


func _on_ButtonUndo_pressed():
	sheet.undo()
	pass # Replace with function body.


func _on_Button_pressed():
	sheet.serializeData()
	pass # Replace with function body.


func _on_ButtonYes_pressed():
	$ButtonFromCSV/csvHeadings.hide()
	sheet.csvImport(csvPath,true)


func _on_ButtonNo_pressed():
	$ButtonFromCSV/csvHeadings.hide()
	sheet.csvImport(csvPath)
	
