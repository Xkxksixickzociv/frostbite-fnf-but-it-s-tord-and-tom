--That Code is Made by TheDanny_

function onCreate()
  Cold=0
  CanUse=11
  ColdDown=false
  GuideCan=false
  coldnessRate=1

  precacheSound('TyphlosionUse')
  precacheSound('TyphlosionDeath')

  makeLuaSprite('Thermometer_BarBG', nil, 35, 218);
  makeGraphic('Thermometer_BarBG', 15, 320, '133551')
  setObjectCamera('Thermometer_BarBG', 'hud')
  addLuaSprite('Thermometer_BarBG',false)

  makeLuaSprite('Thermometer_Bar', nil, 35, 218);
  makeGraphic('Thermometer_Bar', 15, 1, 'AAD6FF')
  setObjectCamera('Thermometer_Bar', 'hud')
  addLuaSprite('Thermometer_Bar',false)

  makeAnimatedLuaSprite('Typhlosion_Thermometer', 'TyphlosionVit', 5, 148)
  addAnimationByPrefix('Typhlosion_Thermometer', '-10', 'Typh1 instance ', 24,true)
  addAnimationByPrefix('Typhlosion_Thermometer', '-8', 'Typh2 instance ', 24,true)
  addAnimationByPrefix('Typhlosion_Thermometer', '-6', 'Typh3 instance ', 24,true)
  addAnimationByPrefix('Typhlosion_Thermometer', '-4', 'Typh4 instance ', 24,true)
  addAnimationByPrefix('Typhlosion_Thermometer', '-2', 'Typh5 instance ', 24,true)
	setObjectCamera('Typhlosion_Thermometer', 'hud')
  addLuaSprite('Typhlosion_Thermometer', false);
  playAnim('Typhlosion_Thermometer', '-10', true)

  makeAnimatedLuaSprite('Thermometer', 'Thermometer', 0, 200)
  addAnimationByPrefix('Thermometer', 'cold', 'Therm1', 24,false)
  addAnimationByPrefix('Thermometer', 'veryCold', 'Therm2', 24,false)
  addAnimationByPrefix('Thermometer', 'Frozen', 'Therm3', 24,false)
	setObjectCamera('Thermometer', 'hud')
  addLuaSprite('Thermometer', false);
  playAnim('Thermometer', 'cold', true)

  
  makeAnimatedLuaSprite('Typhlosion', 'characters/TYPHLOSION_MECHANIC', getCharacterX('bf')+150,getCharacterY('bf')+450)
  addAnimationByIndicesLoop('Typhlosion', 'idle','TYPHLOSION MECHANIC','0,1,2,3,4,5,6,7,8,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14',24)
  addAnimationByIndices('Typhlosion', 'Flame', 'TYPHLOSION MECHANIC', '15,16,17,18,19,20,21,22,23,24,25,26,27,28,29',24)
  setObjectOrder('Typhlosion', 20)
  addLuaSprite('Typhlosion', false);
  playAnim('Typhlosion', 'idle', true)

  makeAnimatedLuaSprite('Guide', 'Extras', 0, 0)
  addAnimationByPrefix('Guide', 'idle', 'Spacebar', 24,true)
	setObjectCamera('Guide', 'hud')
  addLuaSprite('Guide', false);
  playAnim('Guide', 'idle', true)
  screenCenter('Guide','xy')
  setProperty('Guide.alpha',0)
  

end
function onBeatHit()
  Cold=Cold+coldnessRate
  
end
function onUpdate(elapsed)
  setProperty('Fog.alpha',Cold/100)
if keyJustPressed('space') and CanUse> 0 and ColdDown==false then
  CanUse=CanUse-1
  playSound('TyphlosionUse',0.5)
  ColdDown=true
  Change_TyphlosionVit()
  runTimer('Coldown',1,1)
runTimer('use',0.02,35)
doTweenAlpha('Guiade', 'Guide', 0, 0.5, 'cubeInOut')
end
setGraphicSize('Thermometer_Bar',15,getProperty('Thermometer_BarBG.height')*Cold/100)
  
  setProperty('Thermometer_Bar.y',getProperty('Thermometer_BarBG.y')+getProperty('Thermometer_BarBG.height')-getProperty('Thermometer_Bar.height'))
if botPlay and CanUse> 0 and ColdDown==false and Cold>40 then
  CanUse=CanUse-1
  playSound('TyphlosionUse',0.5)
  ColdDown=true
  Change_TyphlosionVit()
  runTimer('Coldown',1,1)
  runTimer('use',0.02,35)
  doTweenAlpha('Guiade', 'Guide', 0, 0.5, 'cubeInOut')
 end
  if Cold~=0 and not seenCutscene and getProperty('iconP1.alpha')==1 then
    addHealth(-(((Cold/1000)*0.00300) * ((elapsed) * 120)))
    
  end
end


function onUpdatePost()
if Cold<=0 then
  Cold=1
  cancelTimer('use')
end
if Cold>=100 then
setHealth(-1)
end
if Cold<33 then
  playAnim('Thermometer', 'cold', true)
  
 
elseif Cold<66  then
playAnim('Thermometer', 'veryCold', true)
else
  playAnim('Thermometer', 'Frozen', true)
end
if Cold>35 and GuideCan==false then
  GuideCan=true
  doTweenAlpha('Guiade', 'Guide', 1, 0.5, 'cubeInOut')
end

end
function onTimerCompleted(tag, loops, loopsLeft)
	if tag =='use' then
    Cold=Cold-1
    setGraphicSize('Thermometer_Bar',15,getProperty('Thermometer_BarBG.height')*Cold/100)
  setProperty('Thermometer_Bar.y',getProperty('Thermometer_BarBG.y')+getProperty('Thermometer_BarBG.height')-getProperty('Thermometer_Bar.height'))
  end
  if tag =='Coldown'then
    ColdDown=false
  end
  if tag =='change'then
    playAnim('Typhlosion', 'idle', true)
  end
end
function Change_TyphlosionVit()

  if CanUse<=2 then
    playAnim('Typhlosion_Thermometer', '-2', true)
  elseif CanUse<=4 then
    playAnim('Typhlosion_Thermometer', '-4', true)
  elseif CanUse<=6 then
    playAnim('Typhlosion_Thermometer', '-6', true)
  elseif CanUse<=8 then
    playAnim('Typhlosion_Thermometer', '-8', true)
  else
    playAnim('Typhlosion_Thermometer', '-10', true)
  end
  playAnim('Typhlosion', 'Flame', true)
runTimer('change',0.5,1)
if CanUse==0 then
  playSound('TyphlosionDeath',1)
  doTweenY('death','Typhlosion',getProperty('Typhlosion.y')+300,1,'Linear')
end
end
function onEvent(tag,v1,v2)
  if tag =='Tylosion_Cry' then
    Change_TyphlosionVit()
    runTimer('Coldown',1,1)
  runTimer('use',0.02,40)
  end
  if tag=='End_Frostbite' then
    coldnessRate=0
    CanUse=-1
end
end




