--[[

Bounces a display object from it's current y position

Example usage:

local transition = require("transition2")

transition.bounce(rect, { 
    height = 400, -- Set to negative value to bounce downwards
    time = 1000,        
    iterations = 0,
})

Markus Ranner 2017

--]]
return {
    getStartValue = function(displayObject, params)     
        return displayObject.y
    end,

    getEndValue = function(displayObject, params)
        return displayObject.y - params.height
    end,

    onValue = function(displayObject, params, value)
        displayObject.y = value
    end,
 
    getParams = function(displayObject, params)        
        params.transition = easing.outSine
        params.transitionReverse = easing.inSine
        params.reverse = true
        
        -- params.time specifies the time for a full bounce cycle, so we just divide by 2 to get time for half cycle
        params.time = (params.time ~= nil) and (params.time/2) or 500
        
        return params
    end
}