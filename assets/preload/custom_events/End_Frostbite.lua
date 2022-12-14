function onCreate()
makeLuaSprite('jumpscare','Pikachu')
setGraphicSize('jumpscare', screenWidth , screenHeight )
setObjectCamera('jumpscare','other')
screenCenter('jumpscare','xy')
Frostbitending=false
precacheSound('Frostbite_ending')


  
end
function onEvent(tag)
if tag=='End_Frostbite' then
    Frostbitending=true
   
    playSound('Frostbite_ending',1)
    getProperty('seenCutscene',true)
    setProperty('camGame.visible',false)
    setProperty('camHUD.visible',false)
    runTimer('Jumpscare',10.12,1)
end
end
function onTimerCompleted(tag)
if tag=='Jumpscare' then
    addLuaSprite('jumpscare',true)
    cameraShake('other',0.008, 3.08)
    runTimer('EndSong',3.08,1)
end
if tag == 'EndSong' then
    Frostbitending=false
    exitSong(true)
end
end
function onEndSong()
	if Frostbitending ==false then
	    return Function_Continue;
    else
        return Function_Stop;
    end
end

