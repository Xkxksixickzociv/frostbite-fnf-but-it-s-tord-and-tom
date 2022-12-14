function onEvent(tag,v1,v2)
    if tag=='summonFreakachu'then
        doTweenZoom('zom', 'camGame',getProperty('defaultCamZoom')+ 1.15, 0.6, 'linear')
        triggerEvent('Camera Follow Pos','600','300')
        triggerEvent('','','')
        runTimer('Read_dead',2.7,1)
        runTimer('morezonm',0.6,1)
        runTimer('Shake',0.86,1)
        runTimer('DeadRED',2.042,1)
    end
    if tag=='End_Frostbite' then
        FreakachuActive=false
    end
end
function onTimerCompleted(tag)
if tag=='Read_dead'then
    
    triggerEvent('Camera Follow Pos','','')
    
    FreakachuActive=true
    
    doTweenZoom('zom', 'camGame', 0.8, 0.5, 'quartInOut')
end
if tag=='morezonm'then
    doTweenZoom('zom', 'camGame',getProperty('defaultCamZoom')+ 2, 0.6, 'quartInOut')
end
if tag=='Shake'then
    
    cameraShake('Game',0.001,0.8)
end
if tag=='Idle' then
    playAnim('Freakachu','idle',true)
end
if tag=='DeadRED' then
    addLuaSprite('Freakachu', false);
    triggerEvent('','','')
end
end
function onCreate()
    ColdownSplit=30
    ChanceSplit=0.1
    FreakachuActive=false
    makeAnimatedLuaSprite('Freakachu', 'characters/nogf', 500, 260)
    addAnimationByPrefix('Freakachu', 'idle', 'Freakachu IDLE', 24,true)
    addAnimationByPrefix('Freakachu', 'Split', 'Freakachu PAIN SPLIT', 24,true)
    addOffset('Freakachu', 'Split', -6, 37)
    addOffset('Freakachu', 'idle', 0, 0)
    scaleObject('Freakachu', 1.45, 1.45)
    precacheSound('Frostbite_bite')
end
function onBeatHit()
if FreakachuActive==true then
    ChanceSplit=ChanceSplit+0.1
    ColdownSplit=ColdownSplit-1
end
if FreakachuActive==true and ColdownSplit<=0 and getRandomBool(ChanceSplit)==true and getHealth()>1.25 then
    ChanceSplit = 0.5;
    ColdownSplit = 30;
    playAnim('boyfriend','singDOWNmiss')
 playAnim('Freakachu','Split',true)
 addHealth(-(0.2 + (getHealth() / 2.856)))
 playSound('Frostbite_bite',0.7)
 runTimer('Idle',1.2,1)
 setProperty('Freakachu.x',516)
 setProperty('Freakachu.y',297)
end
end

