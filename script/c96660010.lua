--Burter
--Fixed by: TheOnePharaoh
--If "Jeice" is face-up on your side of the Field, this card gains 700 ATK and DEF.
function c96660010.initial_effect(c)
	--ATKUp
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetProperty(EFFECT_FLAG_SINGLE_RANGE)
	e1:SetCode(EFFECT_UPDATE_ATTACK)
	e1:SetRange(LOCATION_MZONE)
	e1:SetValue(700)
	e1:SetCondition(c96660010.con)
	c:RegisterEffect(e1)
	local e2=e1:Clone()
	e2:SetCode(EFFECT_UPDATE_DEFENCE)
	c:RegisterEffect(e2)
end
function c96660010.filter(c)
	return c:IsFaceup() and c:IsCode(96660009)
end
function c96660010.con(e,c)
	return Duel.IsExistingMatchingCard(c96660010.filter,c:GetControler(),LOCATION_MZONE,0,nil)
end