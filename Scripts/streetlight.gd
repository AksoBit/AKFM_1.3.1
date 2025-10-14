extends StaticBody2D
var broken = preload("res://Sprites/∞/Interior/LightThingyIFogotBroken.png")

func DESTROY():
	#Код разбивания лампочек ^^
	if $Streetlight.texture == broken:
		return
	collision_layer = 0
	$Bulb.pitch_scale = randf_range(0.7, 1.3)
	$Bulb.play()
	$Streetlight.texture = broken
	$PointLight2D.enabled = false
	$GPUParticles2D.emitting = true
