--Burter
function c96660010.initial_effect(c)
	--ATKUp
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetProperty(EFFECT_FLAG_SINGLE_RANGE)
	e1:SetCode(EFFECT_UPDATE_ATTACK)
	e1:SetRange(LOCATION_MZONE)
	e1:SetValue(c96660010.val)
	c:RegisterEffect(e1)
	local e2=e1:Clone()
	e2:SetCode(EFFECT_UPDATE_DEFENCE)
	c:RegisterEffect(e2)
end
function c96660010.filter(c)
	return c:IsFaceup() and c:IsCode(96660009)
end
function c96660010.val(e,c)
	return Duel.GetMatchingGroupCount(c96660010.filter,c:GetControler(),LOCATION_MZONE,0,nil)*700
end