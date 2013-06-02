local PeekPosition = {
    {x=33385, y=31139, z=8}, 
    {x=33385, y=31134, z=8},
    {x=33385, y=31126, z=8},
    {x=33385, y=31119, z=8},
    {x=33385, y=31118, z=8}
}

function ClosetoOpen()
	for _, v in ipairs(PeekPosition) do
		doRemoveItem(getTileItemById(v, 12214).uid)
		doCreateItem(12213, 1, v)
	end
	addEvent(OpentoClose, 6000)
end

function OpentoClose()
	for _, v in ipairs(PeekPosition) do
		doRemoveItem(getTileItemById(v, 12213).uid)
		doCreateItem(12214, 1, v)
	end
	addEvent(ClosetoOpen, 2000)
end

function onStartup()
	addEvent(ClosetoOpen, 5000)
	return true
end
