extends WorldEnvironment

func _ready():
	pass

func _process(delta):
	$hud/VBoxContainer/lblFps.text = str("FPS: ", Engine.get_frames_per_second())
	if has_node("Ship"):
		$hud/VBoxContainer/lblSpeed.text = str("Speed: ", round($Ship.currentSpeed*3500)/100, "km/s")
	if Input.is_action_just_pressed("toggle_colored_faces"):
		Global.coloredFaces = !Global.coloredFaces
	if Input.is_action_just_pressed("toggle_wireframe"):
		Global.wireframe = !Global.wireframe
		VisualServer.set_debug_generate_wireframes(Global.wireframe)
		if Global.wireframe:
			get_viewport().set_debug_draw(Viewport.DEBUG_DRAW_WIREFRAME)
		else: 
			get_viewport().set_debug_draw(Viewport.DEBUG_DRAW_DISABLED);
