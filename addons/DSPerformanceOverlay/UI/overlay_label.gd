class_name OverlayLabel
extends Label

var perf_monitor: Performance.Monitor
var front_label: String

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	text = front_label + ": " + str(Performance.get_monitor(perf_monitor)) + " |"
