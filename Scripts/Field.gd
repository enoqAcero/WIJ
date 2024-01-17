extends Node2D

var panelNode0Button
var panelNode1Button
var panelNode2Button
var panelNode3Button
var panelNode4Button
var panelNode5Button
var panelNode6Button
var panelNode7Button
var panelNode8Button
var panelNode9Button
var panelNode10Button
var panelNode11Button
var panelNode12Button
var panelNode13Button
var panelNode14Button

var panelNode0ProgressBar
var panelNode1ProgressBar
var panelNode2ProgressBar
var panelNode3ProgressBar
var panelNode4ProgressBar
var panelNode5ProgressBar
var panelNode6ProgressBar
var panelNode7ProgressBar
var panelNode8ProgressBar
var panelNode9ProgressBar
var panelNode10ProgressBar
var panelNode11ProgressBar
var panelNode12ProgressBar
var panelNode13ProgressBar
var panelNode14ProgressBar

var panelNode0Timer
var panelNode1Timer
var panelNode2Timer
var panelNode3Timer
var panelNode4Timer
var panelNode5Timer
var panelNode6Timer
var panelNode7Timer
var panelNode8Timer
var panelNode9Timer
var panelNode10Timer
var panelNode11Timer
var panelNode12Timer
var panelNode13Timer
var panelNode14Timer



# Called when the node enters the scene tree for the first time.
func _ready():
	panelNode0Button = $ScrollContainer/Control/VBoxContainer/Panel0/Button
	panelNode1Button = $ScrollContainer/Control/VBoxContainer/Panel1/Button
	panelNode2Button = $ScrollContainer/Control/VBoxContainer/Panel2/Button
	panelNode3Button = $ScrollContainer/Control/VBoxContainer/Panel3/Button
	panelNode4Button = $ScrollContainer/Control/VBoxContainer/Panel4/Button
	panelNode5Button = $ScrollContainer/Control/VBoxContainer/Panel5/Button
	panelNode6Button = $ScrollContainer/Control/VBoxContainer/Panel6/Button
	panelNode7Button = $ScrollContainer/Control/VBoxContainer/Panel7/Button
	panelNode8Button = $ScrollContainer/Control/VBoxContainer/Panel8/Button
	panelNode9Button = $ScrollContainer/Control/VBoxContainer/Panel9/Button
	panelNode10Button = $ScrollContainer/Control/VBoxContainer/Panel10/Button
	panelNode11Button = $ScrollContainer/Control/VBoxContainer/Panel11/Button
	panelNode12Button = $ScrollContainer/Control/VBoxContainer/Panel12/Button
	panelNode13Button = $ScrollContainer/Control/VBoxContainer/Panel13/Button
	panelNode14Button = $ScrollContainer/Control/VBoxContainer/Panel14/Button
	
	panelNode0ProgressBar = $ScrollContainer/Control/VBoxContainer/Panel0/ProgressBar
	panelNode1ProgressBar = $ScrollContainer/Control/VBoxContainer/Panel1/ProgressBar
	panelNode2ProgressBar = $ScrollContainer/Control/VBoxContainer/Panel2/ProgressBar
	panelNode3ProgressBar = $ScrollContainer/Control/VBoxContainer/Panel3/ProgressBar
	panelNode4ProgressBar = $ScrollContainer/Control/VBoxContainer/Panel4/ProgressBar
	panelNode5ProgressBar = $ScrollContainer/Control/VBoxContainer/Panel5/ProgressBar
	panelNode6ProgressBar = $ScrollContainer/Control/VBoxContainer/Panel6/ProgressBar
	panelNode7ProgressBar = $ScrollContainer/Control/VBoxContainer/Panel7/ProgressBar
	panelNode8ProgressBar = $ScrollContainer/Control/VBoxContainer/Panel8/ProgressBar
	panelNode9ProgressBar = $ScrollContainer/Control/VBoxContainer/Panel9/ProgressBar
	panelNode10ProgressBar = $ScrollContainer/Control/VBoxContainer/Panel10/ProgressBar
	panelNode11ProgressBar = $ScrollContainer/Control/VBoxContainer/Panel11/ProgressBar
	panelNode12ProgressBar = $ScrollContainer/Control/VBoxContainer/Panel12/ProgressBar
	panelNode13ProgressBar = $ScrollContainer/Control/VBoxContainer/Panel13/ProgressBar
	panelNode14ProgressBar = $ScrollContainer/Control/VBoxContainer/Panel14/ProgressBar

	panelNode0Timer = $ScrollContainer/Control/VBoxContainer/Panel0/Timer
	panelNode1Timer = $ScrollContainer/Control/VBoxContainer/Panel1/Timer
	panelNode2Timer = $ScrollContainer/Control/VBoxContainer/Panel2/Timer
	panelNode3Timer = $ScrollContainer/Control/VBoxContainer/Panel3/Timer
	panelNode4Timer = $ScrollContainer/Control/VBoxContainer/Panel4/Timer
	panelNode5Timer = $ScrollContainer/Control/VBoxContainer/Panel5/Timer
	panelNode6Timer = $ScrollContainer/Control/VBoxContainer/Panel6/Timer
	panelNode7Timer = $ScrollContainer/Control/VBoxContainer/Panel7/Timer
	panelNode8Timer = $ScrollContainer/Control/VBoxContainer/Panel8/Timer
	panelNode9Timer = $ScrollContainer/Control/VBoxContainer/Panel9/Timer
	panelNode10Timer = $ScrollContainer/Control/VBoxContainer/Panel10/Timer
	panelNode11Timer = $ScrollContainer/Control/VBoxContainer/Panel11/Timer
	panelNode12Timer = $ScrollContainer/Control/VBoxContainer/Panel12/Timer
	panelNode13Timer = $ScrollContainer/Control/VBoxContainer/Panel13/Timer
	panelNode14Timer = $ScrollContainer/Control/VBoxContainer/Panel14/Timer
	
	
	panelNode0Button.pressed.connect(Callable(buyFruit).bind(0))
	panelNode1Button.pressed.connect(Callable(buyFruit).bind(1))
	panelNode2Button.pressed.connect(Callable(buyFruit).bind(2))
	panelNode3Button.pressed.connect(Callable(buyFruit).bind(3))
	panelNode4Button.pressed.connect(Callable(buyFruit).bind(4))
	panelNode5Button.pressed.connect(Callable(buyFruit).bind(5))
	panelNode6Button.pressed.connect(Callable(buyFruit).bind(6))
	panelNode7Button.pressed.connect(Callable(buyFruit).bind(7))
	panelNode8Button.pressed.connect(Callable(buyFruit).bind(8))
	panelNode9Button.pressed.connect(Callable(buyFruit).bind(9))
	panelNode10Button.pressed.connect(Callable(buyFruit).bind(10))
	panelNode11Button.pressed.connect(Callable(buyFruit).bind(11))
	panelNode12Button.pressed.connect(Callable(buyFruit).bind(12))
	panelNode13Button.pressed.connect(Callable(buyFruit).bind(13))
	panelNode14Button.pressed.connect(Callable(buyFruit).bind(14))
	
	panelNode0Timer.timeout.connect(Callable(timerTimeout).bind(0))
	panelNode1Timer.timeout.connect(Callable(timerTimeout).bind(1))
	panelNode2Timer.timeout.connect(Callable(timerTimeout).bind(2))
	panelNode3Timer.timeout.connect(Callable(timerTimeout).bind(3))
	panelNode4Timer.timeout.connect(Callable(timerTimeout).bind(4))
	panelNode5Timer.timeout.connect(Callable(timerTimeout).bind(5))
	panelNode6Timer.timeout.connect(Callable(timerTimeout).bind(6))
	panelNode7Timer.timeout.connect(Callable(timerTimeout).bind(7))
	panelNode8Timer.timeout.connect(Callable(timerTimeout).bind(8))
	panelNode9Timer.timeout.connect(Callable(timerTimeout).bind(9))
	panelNode10Timer.timeout.connect(Callable(timerTimeout).bind(10))
	panelNode11Timer.timeout.connect(Callable(timerTimeout).bind(11))
	panelNode12Timer.timeout.connect(Callable(timerTimeout).bind(12))
	panelNode13Timer.timeout.connect(Callable(timerTimeout).bind(13))
	panelNode14Timer.timeout.connect(Callable(timerTimeout).bind(14))
	
	loadAllPanelData()
	
func loadAllPanelData():
	for i in range (0, GlobalVariables.player.Fruits.size()):
		loadPanelData(i)
		
func loadPanelData(index : int):
	var currentPanelProgressBar
	var currentPanelSprite
	var currentPanelButtonCost
	var currentPanelButtonAbb
	var currentPanelLvlLabel
	var currentPanelTimer
	
	currentPanelProgressBar = get_node("ScrollContainer/Control/VBoxContainer/Panel" + str(index) + "/ProgressBar")
	currentPanelSprite = get_node("ScrollContainer/Control/VBoxContainer/Panel" + str(index) + "/A")
	currentPanelButtonCost = get_node("ScrollContainer/Control/VBoxContainer/Panel" + str(index) + "/Button/CostNumber")
	currentPanelButtonAbb = get_node("ScrollContainer/Control/VBoxContainer/Panel" + str(index) + "/Button/CostAbb")
	currentPanelLvlLabel = get_node("ScrollContainer/Control/VBoxContainer/Panel" + str(index) + "/Lvl")
	currentPanelTimer = get_node("ScrollContainer/Control/VBoxContainer/Panel" + str(index) + "/Timer")
	
	currentPanelSprite.texture = GlobalVariables.player.Fruits[index].skin
	currentPanelButtonCost.text = str(GlobalVariables.player.Fruits[index].cost)
	currentPanelButtonAbb.text = "NoAbb"
	currentPanelProgressBar = GlobalVariables.player.Fruits[index].currentProgress
	currentPanelTimer.wait_time = (GlobalVariables.player.Fruits[index].speed)/100
	currentPanelTimer.start()
	
	var tierText = calculateTierLevel(index)
	if tierText == 20:
		currentPanelLvlLabel.text = str(GlobalVariables.player.Fruits[index].level) + "/20"
	else:
		currentPanelLvlLabel.text = str(GlobalVariables.player.Fruits[index].level) + "/" + str(tierText)
			
			
			
func calculateTierLevel(index : int):
	var tierText = 20
	if GlobalVariables.player.Fruits[index].level < 20:
		tierText = 20
	elif GlobalVariables.player.Fruits[index].level < 100:
		tierText = ((GlobalVariables.player.Fruits[index].tier) * 20)
	elif GlobalVariables.player.Fruits[index].level < 1000:
		tierText = ((GlobalVariables.player.Fruits[index].tier - 4) * 100)
	elif GlobalVariables.player.Fruits[index].level < 2000:
		tierText = ((GlobalVariables.player.Fruits[index].tier - 9) * 200)
	elif GlobalVariables.player.Fruits[index].level >= 2000:
		tierText = ((GlobalVariables.player.Fruits[index].tier - 15) * 500)
	
	return tierText

func buyFruit(index : int):
	var cost = GlobalVariables.player.Fruits[index].cost
	var mult = GlobalVariables.player.Fruits[index].multiplier
	var level = GlobalVariables.player.Fruits[index].level
	var tierText = calculateTierLevel(index)
	
	GlobalVariables.player.Fruits[index].cost = cost * mult
	GlobalVariables.player.Fruits[index].level += 1
	
	if level >= tierText - 1:
		GlobalVariables.player.Fruits[index].tier += 1
		saveCurrentProgress(index)
		cashOut(index)

	
	loadPanelData(index)
	
func timerTimeout(index : int):
	var currentProgressBar = get_node("ScrollContainer/Control/VBoxContainer/Panel" + str(index) + "/ProgressBar")
	GlobalVariables.player.Fruits[index].currentProgress += 1
	currentProgressBar.value = GlobalVariables.player.Fruits[index].currentProgress
	if currentProgressBar.value >= 100:
		cashOut(index)
		GlobalVariables.player.Fruits[index].currentProgress = 0
		currentProgressBar.value = GlobalVariables.player.Fruits[index].currentProgress

func saveCurrentProgress(index : int):
	var currentProgressBar = get_node("ScrollContainer/Control/VBoxContainer/Panel" + str(index) + "/ProgressBar")
	var currentProgressValueInMin = (GlobalVariables.player.Fruits[index].currentProgress * GlobalVariables.player.Fruits[index].speed)/ 100
	var nextSpeed = GlobalVariables.player.Fruits[index].speed/2
	var nextProgressValueInPer
	
	if currentProgressValueInMin >= GlobalVariables.player.Fruits[index].speed:
		currentProgressValueInMin = 0
	else:
		nextProgressValueInPer = (currentProgressValueInMin * 100)/nextSpeed
		
	if currentProgressValueInMin == 0:
		GlobalVariables.player.Fruits[index].currentProgress = 0
	else:
		GlobalVariables.player.Fruits[index].currentProgress = nextProgressValueInPer
	
	GlobalVariables.player.Fruits[index].speed = GlobalVariables.player.Fruits[index].speed / 2
	currentProgressBar.value = GlobalVariables.player.Fruits[index].currentProgress

func cashOut(index : int):
	pass
	GlobalVariables.player.liters += GlobalVariables.player.Fruits[index].liters * GlobalVariables.player.Fruits[index].level
func _on_button_pressed():
	hide()