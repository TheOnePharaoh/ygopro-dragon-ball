--Android 13
function c96660039.initial_effect(c)
	--DirectATK
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetCode(EFFECT_DIRECT_ATTACK)
	e1:SetCondition(c96660039.con)
	c:RegisterEffect(e1)
end
function c96660039.filter(c)
	return c:GetAttack()<1600 or c:IsFacedown()
end
function c96660039.con(e)
	local tp=e:GetHandlerPlayer()
	return Duel.GetFieldGroupCount(tp,0,LOCATION_SZONE)==0
		and not Duel.IsExistingMatchingCard(c96660039.filter,tp,0,LOCATION_MZONE,1,nil)
end