extends Spatial

var target : Vector3
var frame = 0

func _ready():
	target = Vector3(rand_range(-1,1), rand_range(-1,1), rand_range(-1,1))
	yield(get_tree().create_timer(0.5),"timeout")
	frame = 0

func _process(_delta):
	if frame > 5:
		$light.light_energy = .75 + rand_range(-.25, .25)
		frame = 0
	$light.translation = lerp($light.translation, target, _delta*2)
	target = Vector3(rand_range(-1,1), rand_range(-1,1), rand_range(-1,1))
	frame = frame+1
