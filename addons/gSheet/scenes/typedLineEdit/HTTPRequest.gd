tool
extends HTTPRequest
signal gotImage


func _ready():
	connect("request_completed", self, "_http_request_completed")


func fetch(url):
	var http_error = request(url)
	
	if http_error != OK:
		print("An error occurred in the HTTP request.")
		

func _http_request_completed(result, response_code, headers, body):
	var image = Image.new()
	var image_error = image.load_png_from_buffer(body)
	if image_error != OK:
		print("An error occurred while trying to display the image.")

	var textureImg = ImageTexture.new()
	textureImg.create_from_image(image)
	emit_signal("gotImage",textureImg)
	
