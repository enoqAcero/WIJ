extends Node2D

var rng = RandomNumberGenerator.new()

var savePath = "res://Save/PlayerSave.tres"
var controlEscenasField = false
var controlEscenasUpgrades = false
var controlEscenasBoost = false
var controlEscenasMenu = false
var controlEscenasShop = false

var totalTransportCapacity = 0
var totalJuiceHouseCapacity = 0



var mango = preload("res://Scenes/Fruits/Mango.tscn")
var fruits =[mango, mango]
var fruitInstance = []
var runTimerNode
var runButtonControl = false


var multiplierOn = false
var multiplierLabel



# Called when the node enters the scene tree for the first time.
func _ready():

	GlobalVariables.loadResource()
	SignalManager.loadData.connect(loadData)
	
	runTimerNode = $CanvasLayer/runButton/RunTimer
	multiplierLabel = $CanvasLayer/Multiplier

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
		
	if GlobalVariables.multiplier <= GlobalVariables.multiplierSteps/10:
		GlobalVariables.multiplier = 0

	if GlobalVariables.multiplier == 0:
		multiplierLabelUpdate(1)
	else:
		multiplierLabelUpdate(0)
	
	multiplierLabel.text = "x " + str(GlobalVariables.multiplier)
	

func multiplierLabelUpdate(control : int):
	if control == 0:
		multiplierLabel.scale = Vector2(1.2, 1.2)
	else: 
		multiplierLabel.scale = Vector2(1, 1)

#obtener la capacidad total de los transportes
func getTotalTransportCapacity():
	var trasportIdArray = [GlobalVariables.player.transport0Id, GlobalVariables.player.transport1Id,GlobalVariables.player.transport2Id,GlobalVariables.player.transport3Id,GlobalVariables.player.transport4Id,GlobalVariables.player.transport5Id,GlobalVariables.player.transport6Id,GlobalVariables.player.transport7Id,GlobalVariables.player.transport8Id,GlobalVariables.player.transport9Id,GlobalVariables.player.transport10Id,GlobalVariables.player.transport11Id,GlobalVariables.player.transport12Id,GlobalVariables.player.transport13Id,GlobalVariables.player.transport14Id]
	
	for i in range (0, trasportIdArray.size()):
		if trasportIdArray[i] >= 1:
			var id = trasportIdArray[i]
			totalTransportCapacity += GlobalVariables.player.Transport[id - 1].capacity
			
#obtener la capacidad total de las casas de jugo
func getJuiceHouseCapacity():
	var houseIdArray = [GlobalVariables.player.house0Id, GlobalVariables.player.house1Id,GlobalVariables.player.house2Id,GlobalVariables.player.house3Id]
	for i in range (0, houseIdArray.size()):
		if houseIdArray[i] >= 1:
			var id = houseIdArray[i]
			totalJuiceHouseCapacity += GlobalVariables.player.JuiceHouse[id - 1].capacity
			
func countFruits():
	var houseIdArray = [GlobalVariables.player.house0Id, GlobalVariables.player.house1Id,GlobalVariables.player.house2Id,GlobalVariables.player.house3Id]
	for i in range (0, houseIdArray.size()):
		if houseIdArray[i] >= 1:
			GlobalVariables.totalBlueberryCount = GlobalVariables.player.CurrentJuiceHouse[i].blueberryCount
			GlobalVariables.totalCerezaCount = GlobalVariables.player.CurrentJuiceHouse[i].cerezaCount
			GlobalVariables.totalFresaCount = GlobalVariables.player.CurrentJuiceHouse[i].fresaCount
			GlobalVariables.totalLimonCount = GlobalVariables.player.CurrentJuiceHouse[i].limonCount
			GlobalVariables.totalDuraznoCount = GlobalVariables.player.CurrentJuiceHouse[i].duraznoCount
			GlobalVariables.totalManzanaCount = GlobalVariables.player.CurrentJuiceHouse[i].manzanaCount
			GlobalVariables.totalNaranjaCount = GlobalVariables.player.CurrentJuiceHouse[i].naranjaCount
			GlobalVariables.totalAguacateCount = GlobalVariables.player.CurrentJuiceHouse[i].aguacateCount
			GlobalVariables.totalMangoCount = GlobalVariables.player.CurrentJuiceHouse[i].mangoCount
			GlobalVariables.totalDragonfruitCount = GlobalVariables.player.CurrentJuiceHouse[i].dragonfruitCount
			GlobalVariables.totalCocoCount = GlobalVariables.player.CurrentJuiceHouse[i].cocoCount
			GlobalVariables.totalAnanaCount = GlobalVariables.player.CurrentJuiceHouse[i].ananaCount
			GlobalVariables.totalPapayaCount = GlobalVariables.player.CurrentJuiceHouse[i].papayaCount
			GlobalVariables.totalMelonCount = GlobalVariables.player.CurrentJuiceHouse[i].melonCount
			GlobalVariables.totalSandiaCount = GlobalVariables.player.CurrentJuiceHouse[i].sandiaCount
			
func calculateMoneyFromLiters(litrosPorSegundo : float):
	var currentJuiceLevel = GlobalVariables.player.juiceLevel
	var moneyString : String
	if litrosPorSegundo >= totalTransportCapacity:
		GlobalVariables.maxTransportCapacity = true
	
	GlobalVariables.player.litersPerSecond = litrosPorSegundo
	GlobalVariables.player.money += litrosPorSegundo * GlobalVariables.player.JuiceLevel[currentJuiceLevel].value * (GlobalVariables.multiplier + 1)
	moneyString = GlobalVariables.getMoneyString(GlobalVariables.player.money)
	$CanvasLayer/Money.text ="Money: " + moneyString
	
	
#esta  funcion se manda a ejecturar despues de cargar el recurso en la variabale player
#se usa para evitar utilizar una variable antes de cargar los datos de player
func loadData():
	getTotalTransportCapacity()
	getJuiceHouseCapacity()
	countFruits()
	
func save():
	ResourceSaver.save(GlobalVariables.player, savePath)
	
func _notification(what):
	if what == NOTIFICATION_WM_CLOSE_REQUEST or what == NOTIFICATION_WM_GO_BACK_REQUEST or what == NOTIFICATION_APPLICATION_FOCUS_OUT:
		GlobalVariables.player.time = Time.get_datetime_string_from_system()
		save()
		get_tree().paused = true
	if what == NOTIFICATION_APPLICATION_FOCUS_IN or what == NOTIFICATION_READY:
		get_tree().paused = false
		calculateTime()
		
func calculateTime():
	var prevTime = Time.get_unix_time_from_datetime_string(GlobalVariables.player.time)
	var currentTime = Time.get_unix_time_from_datetime_string(Time.get_datetime_string_from_system())
	var elapsedTime = currentTime - prevTime
	
	calculateMoneyFromTime(elapsedTime)
	
	
func calculateMoneyFromTime(elapsedTime):
	var moneyEarned = GlobalVariables.player.litersPerSecond * elapsedTime
	var moneyEarnedString : String
	var moneyEarnedLabel = $CanvasLayer/WaterTank.get_node("Money")
	moneyEarnedString = GlobalVariables.getMoneyString(moneyEarned)
	moneyEarnedLabel.text = "Money Earned While Away: \n" + moneyEarnedString
	$CanvasLayer/WaterTank.show()
	GlobalVariables.player.money += moneyEarned
	calculateFruitsFromTime(elapsedTime)
	save()
	
func calculateFruitsFromTime(elapsedTime):
	
	var frutasTotal : int = 0
	var fruitsEarnedString : String
	var fruitsEarnedLabel = $CanvasLayer/WaterTank.get_node("Fruits")
	
	var BlueberryCount : int = 0
	var CerezaCount : int = 0
	var FresaCount : int = 0
	var LimonCount : int = 0
	var DuraznoCount : int = 0
	var ManzanaCount : int = 0
	var NaranjaCount : int = 0
	var AguacateCount : int = 0
	var MangoCount : int = 0
	var DragonfruitCount : int = 0
	var CocoCount : int = 0
	var AnanaCount : int = 0
	var PapayaCount : int = 0
	var MelonCount : int = 0
	var SandiaCount : int = 0
	
	var houseIdArray = [GlobalVariables.player.house0Id, GlobalVariables.player.house1Id,GlobalVariables.player.house2Id,GlobalVariables.player.house3Id]
	var houseCount = 0
	
	BlueberryCount = (elapsedTime / GlobalVariables.player.Fruits[0].speed) * GlobalVariables.player.Fruits[0].level
	CerezaCount = (elapsedTime / GlobalVariables.player.Fruits[1].speed) * GlobalVariables.player.Fruits[1].level
	FresaCount = (elapsedTime / GlobalVariables.player.Fruits[2].speed) * GlobalVariables.player.Fruits[2].level
	LimonCount = (elapsedTime / GlobalVariables.player.Fruits[3].speed) * GlobalVariables.player.Fruits[3].level
	DuraznoCount = (elapsedTime / GlobalVariables.player.Fruits[4].speed) * GlobalVariables.player.Fruits[4].level
	ManzanaCount = (elapsedTime / GlobalVariables.player.Fruits[5].speed) * GlobalVariables.player.Fruits[5].level
	NaranjaCount = (elapsedTime / GlobalVariables.player.Fruits[6].speed) * GlobalVariables.player.Fruits[6].level
	AguacateCount = (elapsedTime / GlobalVariables.player.Fruits[7].speed) * GlobalVariables.player.Fruits[7].level
	MangoCount = (elapsedTime / GlobalVariables.player.Fruits[8].speed) * GlobalVariables.player.Fruits[8].level
	DragonfruitCount = (elapsedTime / GlobalVariables.player.Fruits[9].speed) * GlobalVariables.player.Fruits[9].level
	CocoCount = (elapsedTime / GlobalVariables.player.Fruits[10].speed) * GlobalVariables.player.Fruits[10].level
	AnanaCount = (elapsedTime / GlobalVariables.player.Fruits[11].speed) * GlobalVariables.player.Fruits[11].level
	PapayaCount = (elapsedTime / GlobalVariables.player.Fruits[12].speed) * GlobalVariables.player.Fruits[12].level
	MelonCount = (elapsedTime / GlobalVariables.player.Fruits[13].speed) * GlobalVariables.player.Fruits[13].level
	SandiaCount = (elapsedTime / GlobalVariables.player.Fruits[14].speed) * GlobalVariables.player.Fruits[14].level
	frutasTotal = BlueberryCount+CerezaCount+FresaCount+LimonCount+DuraznoCount+ManzanaCount+NaranjaCount+AguacateCount+MangoCount+DragonfruitCount+CocoCount+AnanaCount+PapayaCount+MelonCount+SandiaCount
	
	
	
	for i in range (0, houseIdArray.size()):
		if houseIdArray[i] >= 1:
			houseCount += 1
			
	for i in range (0, houseIdArray.size()):
		if houseIdArray[i] >= 1:
			GlobalVariables.player.CurrentJuiceHouse[i].blueberryCount += (BlueberryCount - 1) / houseCount
			GlobalVariables.player.CurrentJuiceHouse[i].cerezaCount += (CerezaCount - 1) / houseCount
			GlobalVariables.player.CurrentJuiceHouse[i].fresaCount += (FresaCount - 1) / houseCount
			GlobalVariables.player.CurrentJuiceHouse[i].limonCount += (LimonCount - 1) / houseCount
			GlobalVariables.player.CurrentJuiceHouse[i].duraznoCount += (DuraznoCount - 1) / houseCount
			GlobalVariables.player.CurrentJuiceHouse[i].manzanaCount += (ManzanaCount - 1) / houseCount
			GlobalVariables.player.CurrentJuiceHouse[i].naranjaCount += (NaranjaCount - 1) / houseCount
			GlobalVariables.player.CurrentJuiceHouse[i].aguacateCount += (AguacateCount - 1) / houseCount
			GlobalVariables.player.CurrentJuiceHouse[i].mangoCount += (MangoCount - 1) / houseCount
			GlobalVariables.player.CurrentJuiceHouse[i].dragonfruitCount += (DragonfruitCount - 1) / houseCount
			GlobalVariables.player.CurrentJuiceHouse[i].cocoCount += (CocoCount - 1) / houseCount
			GlobalVariables.player.CurrentJuiceHouse[i].ananaCount += (AnanaCount - 1) / houseCount
			GlobalVariables.player.CurrentJuiceHouse[i].papayaCount += (PapayaCount - 1) / houseCount
			GlobalVariables.player.CurrentJuiceHouse[i].melonCount += (MelonCount - 1) / houseCount
			GlobalVariables.player.CurrentJuiceHouse[i].sandiaCount += (SandiaCount - 1) / houseCount
			
	
	
	
	fruitsEarnedString = GlobalVariables.getMoneyString(frutasTotal)
	fruitsEarnedLabel.text = "Fruits Earned While Away: \n" + fruitsEarnedString
	
	countFruits()
	
	
# Oculta todas las escenas
func hideScene():
	$CanvasLayer/Field.visible = false
	$CanvasLayer/Upgrades.visible = false
	$CanvasLayer/Boost.visible = false
	$CanvasLayer/Menu.visible = false
	$CanvasLayer/Shop.visible = false

# Muestra la escena especificada
func showScene(scene, controlEscenas):
	hideScene()
	if !controlEscenas:
		scene.visible = true
	return !controlEscenas

#Abir Field
func _on_field_button_pressed():
	controlEscenasField = showScene($CanvasLayer/Field, controlEscenasField)

#Abir Upgrades
func _on_upgrade_button_pressed():
	controlEscenasUpgrades = showScene($CanvasLayer/Upgrades, controlEscenasUpgrades)

#Abir Boosts
func _on_boost_button_pressed():
	controlEscenasBoost = showScene($CanvasLayer/Boost, controlEscenasBoost)

#Abir Menu
func _on_menu_button_pressed():
	controlEscenasMenu = showScene($CanvasLayer/Menu, controlEscenasMenu)

#Abir Shop
func _on_shop_button_pressed():
	controlEscenasShop = showScene($CanvasLayer/Shop, controlEscenasShop)


func _on_button_pressed():
	$CanvasLayer/JuiceHouse.show()


func _on_button_2_pressed():
	$CanvasLayer/Garage.show()


func _on_run_button_pressed():
	if runButtonControl == false:
		instanceFruit()
		runTimerNode.start()
		runButtonControl = true
	
func instanceFruit():
	var randFruit = randi() % (fruits.size() - 1)
	var fruitType = fruits[randFruit]
	var fruit = fruitType.instantiate()
	var fruitI = fruit
	var dirX
	var dirY
	
	fruitI.add_to_group("fruit")
	
	if randFruit == 0:
		fruitI.add_to_group("mango")
		
	fruit.houseName = "house"

	dirX = rng.randi_range(-20,20)
	dirY = rng.randi_range(-20,20)

	fruit.position.x = $FruitSpawn.position.x + dirX
	fruit.position.y = $FruitSpawn.position.y + dirY

	fruitInstance.append(fruitI)
	add_child(fruit)
	GlobalVariables.multiplier += GlobalVariables.multiplierSteps
	

func _on_run_timer_timeout():
	runButtonControl = false


func _on_produce_juice_timer_timeout():
	var litros = 0
	var litrosPorSegundo : float
	litros += GlobalVariables.totalBlueberryCount * GlobalVariables.player.Fruits[0].liters
	litros += GlobalVariables.totalCerezaCount * GlobalVariables.player.Fruits[1].liters
	litros += GlobalVariables.totalFresaCount * GlobalVariables.player.Fruits[2].liters
	litros += GlobalVariables.totalLimonCount * GlobalVariables.player.Fruits[3].liters
	litros += GlobalVariables.totalDuraznoCount * GlobalVariables.player.Fruits[4].liters
	litros += GlobalVariables.totalManzanaCount * GlobalVariables.player.Fruits[5].liters
	litros += GlobalVariables.totalNaranjaCount * GlobalVariables.player.Fruits[6].liters
	litros += GlobalVariables.totalAguacateCount * GlobalVariables.player.Fruits[7].liters
	litros += GlobalVariables.totalMangoCount * GlobalVariables.player.Fruits[8].liters
	litros += GlobalVariables.totalDragonfruitCount * GlobalVariables.player.Fruits[9].liters
	litros += GlobalVariables.totalCocoCount * GlobalVariables.player.Fruits[10].liters
	litros += GlobalVariables.totalAnanaCount * GlobalVariables.player.Fruits[11].liters
	litros += GlobalVariables.totalPapayaCount * GlobalVariables.player.Fruits[12].liters
	litros += GlobalVariables.totalMelonCount * GlobalVariables.player.Fruits[13].liters
	litros += GlobalVariables.totalSandiaCount * GlobalVariables.player.Fruits[14].liters
	
	litrosPorSegundo = litros * 0.1
	calculateMoneyFromLiters(litrosPorSegundo)





