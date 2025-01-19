class_name DialogueVoicePlayer
extends AudioStreamPlayer

var _random_number_gen := RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_random_number_gen.randomize()

# Custom play method with random pitch
func play_random_pitch(from_position := 0.0) -> void:
	pitch_scale = _random_number_gen.randf_range(0.95, 1.08)
	play(from_position)

# Wrapper method to replace the default play method
func start_playing(from_position := 0.0) -> void:
	play_random_pitch(from_position)
