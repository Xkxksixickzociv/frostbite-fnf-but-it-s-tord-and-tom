--That Code is Made by TheDanny
function goodNoteHit(id, direction, noteType, isSustainNote)
    
 
  if direction==0 then
    doTweenX('camX','camFollowPos',getProperty('camFollowPos.x')-5,0.1,'Linear')
  elseif direction==1 then
    doTweenY('camY','camFollowPos',getProperty('camFollowPos.y')+2,0.1,'Linear')
  elseif direction==2 then
    doTweenY('camY','camFollowPos',getProperty('camFollowPos.y')-5,0.1,'Linear')
  else
    doTweenX('camX','camFollowPos',getProperty('camFollowPos.x')+5,0.1,'Linear')
  end
end


