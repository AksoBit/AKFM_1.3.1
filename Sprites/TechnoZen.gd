extends CharacterBody2D

var MIKUMIKUBEEEEEEEEAAAAAAAAAAAM = preload("res://Scenes/BEAM.tscn")
var IHateMyLife = preload("res://Scenes/NonvericalBEAM.tscn")
var NEWMIKUMIKUBEEEEEEEEAAAAAAAAAAAM = MIKUMIKUBEEEEEEEEAAAAAAAAAAAM.instantiate()
var FUCK = IHateMyLife.instantiate()
var Parts = preload("res://Scenes/TechnoBody.tscn").instantiate()
@onready var MC = get_parent().get_parent().get_node("UwUGG/UwUGG")
var Twenty_O_Seven_IS_ETERNAL = preload("res://Scenes/BeamFollowing.tscn")
var idkreally = Twenty_O_Seven_IS_ETERNAL.instantiate()
var energy = 150
var AttackCount = 0
var IsAttaking = false
var EnForOVERDRIVE = 0
var IsChillin = true
var rng = RandomNumberGenerator.new()
var Activated = false
var ASYNC = 0.01
var Attacks = [shoot1FOLLOWING, shoot1HORIZONTAL, shoot3VERTICAL]
const SPEED = 300.0
const JUMP_VELOCITY = -400.0
@onready var Face = $Main/AnimatedSprite2D
func _ready() -> void:
	$AnimatedSprite2D.play()
	while Activated == false:
		if $"." == null:
			pass
		await get_tree().create_timer(0.01).timeout
	await get_tree().create_timer(ASYNC).timeout
	rng.randomize()
	var AttackNow = Attacks[rng.randi() % Attacks.size()]
	AttackNow.call()
	EnForOVERDRIVE += 1
	await get_tree().create_timer(0.01).timeout
	while 1 == 1:
		if EnForOVERDRIVE >= 3 and not IsAttaking:
			await get_tree().create_timer(5).timeout
			OVERDRIVE()
		elif IsAttaking:
			await get_tree().create_timer(0.01).timeout
		else:
			await get_tree().create_timer(5).timeout
			rng.randomize()
			Attacks = [shoot1FOLLOWING, shoot1HORIZONTAL, shoot3VERTICAL]
			AttackNow = Attacks[rng.randi() % Attacks.size()]
			AttackNow.call()
			EnForOVERDRIVE += 1
			await get_tree().create_timer(0.01).timeout
func _physics_process(delta: float) -> void:
	if velocity.y > 0:
		velocity.y -= 0.5
	if velocity.y < 0:
		velocity.y += 0.5
	if velocity.x > 0:
		velocity.x -= 0.5
	if velocity.x < 0:
		velocity.x += 0.5
	if is_on_floor():
		velocity.y -= 100
	move_and_slide()
func shoot3VERTICAL():
		IsAttaking = true
		if Face.animation == "OVERDRIVE":
			pass
		else:
			Face.play("Vertical")
		NEWMIKUMIKUBEEEEEEEEAAAAAAAAAAAM = MIKUMIKUBEEEEEEEEAAAAAAAAAAAM.instantiate()
		get_parent().get_parent().add_child(NEWMIKUMIKUBEEEEEEEEAAAAAAAAAAAM)
		await get_tree().create_timer(0.5).timeout
		NEWMIKUMIKUBEEEEEEEEAAAAAAAAAAAM = MIKUMIKUBEEEEEEEEAAAAAAAAAAAM.instantiate()
		get_parent().get_parent().add_child(NEWMIKUMIKUBEEEEEEEEAAAAAAAAAAAM)
		await get_tree().create_timer(0.5).timeout
		NEWMIKUMIKUBEEEEEEEEAAAAAAAAAAAM = MIKUMIKUBEEEEEEEEAAAAAAAAAAAM.instantiate()
		get_parent().get_parent().add_child(NEWMIKUMIKUBEEEEEEEEAAAAAAAAAAAM)
		await get_tree().create_timer(1.5).timeout
		Face.play("default")
		IsAttaking = false
func shoot1HORIZONTAL():
		IsAttaking = true
		if Face.animation == "OVERDRIVE":
			pass
		else:
			Face.play("Horizontal")
		FUCK = IHateMyLife.instantiate()
		get_parent().get_parent().add_child(FUCK)
		await get_tree().create_timer(2).timeout
		Face.play("default")
		IsAttaking = false
func shoot1FOLLOWING():
		IsAttaking = true
		if Face.animation == "OVERDRIVE":
			pass
		else:
			Face.play("IDK")
		idkreally = Twenty_O_Seven_IS_ETERNAL.instantiate()
		get_parent().get_parent().add_child(idkreally)
		await get_tree().create_timer(5.5).timeout
		Face.play("default")
		IsAttaking = false
func OVERDRIVE():
	IsAttaking = true
	EnForOVERDRIVE = 0
	$AudioStreamPlayer2D.play()
	Face.play("OVERDRIVE")
	idkreally = Twenty_O_Seven_IS_ETERNAL.instantiate()
	get_parent().get_parent().add_child(idkreally)
	for i in 5:
		await get_tree().create_timer(1).timeout
		NEWMIKUMIKUBEEEEEEEEAAAAAAAAAAAM = MIKUMIKUBEEEEEEEEAAAAAAAAAAAM.instantiate()
		get_parent().get_parent().add_child(NEWMIKUMIKUBEEEEEEEEAAAAAAAAAAAM)
	Face.play("default")
	IsAttaking = false
func take_damage(damage):
	energy -= damage
	if energy <= 0:
		get_parent().get_parent().add_child(Parts)
		Parts.global_position = global_position
		Global.TechnoDeath()
		queue_free()
	$RichTextLabel.text = str(energy)
	$Main/AnimatedSprite2D/Sprite2D	.visible = true
	await get_tree().create_timer(0.5).timeout
	$Main/AnimatedSprite2D/Sprite2D.visible = false
func IDC():
	while IsChillin == true:
		$Main/AnimatedSprite2D/Sprite2D2.visible = true
		await get_tree().create_timer(0.2).timeout
	$Main/AnimatedSprite2D/Sprite2D2.visible = false


func _on_area_2d_body_entered(body: Node2D) -> void:
	pass # Replace with function body.


func _on_area_2d_body_exited(body: Node2D) -> void:
	pass # Replace with function body.

func activate():
	print(name, " активирован")
	Activated = true
