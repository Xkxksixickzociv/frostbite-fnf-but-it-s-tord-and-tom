function onCreate()
	-- background shit
	makeLuaSprite('Back', 'bg', -600, -600);

	makeLuaSprite('Charizard', 'Charizard', -50, -200);
	scaleObject('Charizard', 0.5, 0.5);

	makeLuaSprite('Blastoise', 'Blastoise', -650, -200);
	scaleObject('Blastoise', 0.55, 0.55);

	makeLuaSprite('Pokemon', 'pokemons', 350, 0);
	scaleObject('Pokemon', 0.25, 0.25);

	

	makeLuaSprite('Fog', 'fog', 0, 0);
	setObjectCamera('Fog', 'hud')
	setObjectOrder('Fog', 20)
	setGraphicSize('Fog', screenWidth, screenHeight);
	

	addLuaSprite('Back', false);
	addLuaSprite('Charizard', false);
	addLuaSprite('Blastoise', false);
	addLuaSprite('Pokemon', false);

	addLuaSprite('Fog', true);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end