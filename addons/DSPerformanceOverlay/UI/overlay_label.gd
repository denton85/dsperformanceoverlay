class_name OverlayLabel
extends Label

var perf_monitor: Performance.Monitor
var front_label: String
var tick: int = 0

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	if tick < 59:
		tick += 1
		return
	else:
		text = front_label + ": " + str(Performance.get_monitor(perf_monitor)) + " |"
		tick = 0
