extends KinematicBody

# States
# searching
# found
# shooting
export var score = 10 

var state = ""
var speed = 1
onready var Scan = $Scanner
var Bullet = preload("res://Scenes/EnemyBullet.tscn")
onready var Score = get_node("/root/Game/HUD/Score")
var health = 100 


func take_damage(d):
	health -= d
	if health <= 0:
		queue_free()


func change_state(s):
	state = s
	if state == "scanning":
		pass
		
	if state == "found":
		pass
	
	if state == "shooting":
		pass
		
	


func _ready():
	change_state("searching")

func _physics_process(delta):
	if state == "searching":
		rotate(Vector3(0, 1, 0), speed*delta)
		var c = Scan.get_collider()
		if c != null and c.name == 'Player':
			change_state("found")
	if state == "found":
		print("found")
		$Timer.start()
		change_state("shooting")
	if state == "shooting":
		var b = Bullet.instance()
		b.start($Muzzle.global_transform)
		get_node("/root/Game/EnemyBullets").fire(b)
		$Timer.start()
		change_state("shooting")
		change_state("searching")


func _on_Timer_timeout():
	print("timeout")
	var c = Scan.get_collider()
	if c != null and c.name == "Player":
		if state == "waiting":
			$Timer.start
			change_state("shooting")
		if state == "shoot_waiting":
			change_state("shooting")
	else: 
		change_state("searching")
