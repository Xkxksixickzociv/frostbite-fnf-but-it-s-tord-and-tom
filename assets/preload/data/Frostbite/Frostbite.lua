--That Code is Made by TheDanny

function onCreatePost()
    PositionX={defaultPlayerStrumX0,defaultPlayerStrumX1,defaultPlayerStrumX2,defaultPlayerStrumX3,defaultOpponentStrumX0,defaultOpponentStrumX1,defaultOpponentStrumX2,defaultOpponentStrumX3}
    for i=0,#PositionX-1 do
        noteTweenX('x'..tostring(i), i,PositionX[i+1], 0.00001, 'circInOut')   

      
    end
end
function onUpdatePost(elapsed)
    setProperty('iconP2.x',XoffsetP2)
    setProperty('iconP1.x',XoffsetP1) 
end
function onUpdate(elapsed)
    healthBarPercent = getProperty('healthBar.percent')
    XoffsetP2=healthBarX+(healthBarWidth*healthBarPercent*0.01)+(150 *getProperty('iconP1.scale.x') - 150) / 2 - 26
    XoffsetP1=healthBarX+(healthBarWidth*healthBarPercent*0.01)-(150 *getProperty('iconP2.scale.x')) / 2 - 26* 2
    setProperty('iconP2.x',XoffsetP2)
    setProperty('iconP1.x',XoffsetP1) 


    setShaderFloat('ShaderCont','time',getShaderFloat('ShaderCont','time')+0.01)
 
end
function onCreate()
    setProperty('skipCountdown',true)
    addHaxeLibrary('Application', 'lime.app')
    setProperty('healthBar.flipX',true)
    addCharacterToList('Red_Dead', 'dad')
    addCharacterToList('Freakachu_entrance', 'dad')
    healthBarWidth= getProperty('healthBar.width')
    setProperty('iconP1.flipX',true)
    healthBarX = getProperty('healthBar.x')
    IconP1ScaleX = getProperty('iconP1.scale.x')
    AmountSnow=100
    makeLuaSprite("ShaderCont")

  


if shadersEnabled then
    initLuaShader('snowfall',150)
    local Shader='snowfall'
    runHaxeCode([[
        var shaderName = "]]..Shader..[[";
        
        game.initLuaShader(shaderName);
        
        var shader0 = game.createRuntimeShader(shaderName);
        //game.camGame.setFilters([new ShaderFilter(shader0)]);
        game.camHUD.setFilters([new ShaderFilter(shader0)]);
        game.getLuaObject("ShaderCont").shader = shader0; // setting it into temporary sprite so luas can set its shader uniforms/properties
        
        
        shader0.setFloat('intensity', 0.2);
        shader0.setInt('amount', 100);
        shader0.setFloat('time', 1);
    ]])
    if lowQuality then
        d=2
    else
        d=1
    end
end
   

    runHaxeCode([[
   Application.current.window.title="]]..songName..'-'..Dificulty(difficulty)..[[";
   ]])
    
end
function onEvent(tag,v1,v2)
if tag =='SnowFall_amount' then
   setShaderInt('ShaderCont','amount',tonumber(v1)/d)
   AmountSnow=tonumber(v1)
  

end
if tag =='SnowFall_intensity' then
    
   setShaderFloat('ShaderCont','intensity',tonumber(v1))
end
--130.435=stepCrochet
end
function onTimerCompleted(tag, loops, loopsLeft)
  
end
function Dificulty(a)
    if a==0 then
        return 'Normal'
    elseif a==1 then
        return 'Normal'
    elseif a==2 then
        return 'Hard'
    end
end
function onDestroy()
    runHaxeCode([[
        Application.current.window.title="Friday Night Funkin': Psych Engine";
        ]])
end


