local tp = {

           {x=153, y=144, z=7}, 
	   {x=134, y=62, z=7}, 
	   {x=82, y=121, z=7}, 
	   {x=70, y=188, z=7}, 
	   {x=188, y=194, z=7}, 
	   {x=210, y=115, z=7},
           } 
 function onStepIn(cid, item, position, lastPosition, fromPosition, toPosition, actor)
	local temple_pos = {x = 151, y = 149, z = 8} 
	if position.x == temple_pos.x and position.y == temple_pos.y and position.z == temple_pos.z then
		 doTeleportThing(cid, tp[math.random(#tp)])
	end
return TRUE
end