StateMachine = Class{}

function StateMachine:init(states)
    self.empty = {
        render = function() end,
        update = function() end,
        enter = function() end,
        exit = function() end
    }

    self.states = states or {}
    self.current = self.empty
end

function StateMachine:change(state_name, enter_params)
    assert(self.states[state_name])
    self.current:exit()
    self.current = self.states[state_name]()
    self.current:enter(enter_params)
end

function StateMachine:update(dt)
    self.current:update(dt)
end

function StateMachine:render()
    self.current:render()
end