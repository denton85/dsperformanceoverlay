@tool
class_name DSOverlay
extends Control

enum layout { horizontal, vertical }

## Select your layout direction.
@export var label_layout_direction: layout = layout.horizontal
## Select which overlays you want to display and give them a label.
@export var selected_overlays: Dictionary[Performance.Monitor, String] = {}

const OVERLAY_LABEL = preload("res://addons/DSPerformanceOverlay/UI/OverlayLabel.tscn")

## Select the color you want for your text.
@export var text_color: Color = Color(1,1,1,1)
## Select the font size for your text.
@export var font_size: int = 25
## Select the background color for the overlay.
@export var background_color: Color = Color(1,1,1,0.2)

@onready var h_box_container: HBoxContainer = %HBoxContainer
@onready var v_box_container: VBoxContainer = %VBoxContainer
@onready var panel_container: PanelContainer = %PanelContainer


func _ready() -> void:
	for i in selected_overlays:
		var label: OverlayLabel = OVERLAY_LABEL.instantiate()
		label.perf_monitor = i
		label.front_label = selected_overlays[i]
		label.add_theme_color_override("font_color", text_color)
		label.add_theme_font_size_override("font_size", font_size)
		panel_container.add_theme_color_override("bg_color", background_color)
		match label_layout_direction:
			layout.horizontal:
				h_box_container.add_child(label)
			layout.vertical:
				v_box_container.add_child(label)
