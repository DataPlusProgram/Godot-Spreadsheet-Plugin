tool
extends Resource
class_name gsheet


export(Dictionary) var  data = {"meta":{"hasId":false,"rowOrder":["0"],"enumColumns":{},"colNames":[],"enumColumnsPrefix":{}},"0":{"0":""}}


func get_data():
	var dat = data.duplicate()
	dat.pop_front()
	return dat

func getRowKeys():
	return data["meta"]["rowOrder"]

func getRow(rowKey : String) -> Dictionary:
	var retDict = {}
	var entry = data[rowKey]
	
	for key in entry.keys():
		if typeof(entry[key]) == TYPE_STRING:
			if entry[key] == "":
				continue
		
		retDict[key] = entry[key]
		
	return retDict


func hasKey(rowKey):
	return data.has(rowKey)

func getColumn(colKey):
	var ret = []
	
	for key in data.keys():
		if data[key].has(colKey):
			if data[key][colKey] != "":
				ret.append(data[key][colKey])
			
			
	return ret

func getRowsAsArray() -> Array:
	var ret = []
	
	for key in data.keys():
		if key!="meta":
			ret.append(data[key])
		
	return ret

func getRowsAsArrayExcludeEmptyColumns() -> Array:
	var ret : Array = []
	
	for key in data.keys():
		if key!="meta":
			
			var line : Dictionary = data[key]
			var minDict : Dictionary = {}
			
			
			for value in line:
				var d = line[value]
				
				if d != null:
					if typeof(d) == TYPE_STRING:
						if line[value].empty():
							continue
							
					minDict[value] = line[value]
			ret.append(minDict)
			#ret.append(data[key])
		
		
	return ret
