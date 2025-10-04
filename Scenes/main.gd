extends Node3D

var xr_interface: XRInterface
@onready var gpu_particles_3d: GPUParticles3D = $XRToolsPickable2/GPUParticles3D

func _ready():
	xr_interface = XRServer.find_interface("OpenXR")
	if xr_interface and xr_interface.is_initialized():
		print("OpenXR initialized successfully")

		# Turn off v-sync!
		DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_DISABLED)

		# Change our main viewport to output to the HMD
		get_viewport().use_xr = true
	else:
		print("OpenXR not initialized, please check if your headset is connected")


func _on_xr_tools_pickable_2_dropped(pickable: Variant) -> void:
	gpu_particles_3d.emitting = true
	pass # Replace with function body.
