local callTo = require(script.Parent.callTo)
local internalsSymbol = require(script.Parent.Parent.internal.internalsSymbol)

return function (method, ...)
	local parent = method[internalsSymbol].parent
	if parent == nil then
		error("Attempt to call method on object which is not a faked method:", method)
	end
	return callTo(method, parent, ...)
end
