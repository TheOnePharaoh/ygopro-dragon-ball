--Spirit Bomb
function c96661043.initial_effect(c)
	c:EnableCounterPermit(0x1)
	c:SetCounterLimit(0x1,5)
	--activate
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_ACTIVATE)
	e1:SetCode(EVENT_FREE_CHAIN)
	e1:SetCondition(c96661043.condition)
	c:RegisterEffect(e1)
	--place counter
	local e2=Effect.CreateEffect(c)
	e2:SetRange(LOCATION_SZONE)
	e2:SetType(EFFECT_TYPE_FIELD+EFFECT_TYPE_CONTINUOUS)
	e2:SetCode(EVENT_PHASE+PHASE_STANDBY)
	e2:SetCountLimit(1)
	e2:SetCondition(c96661043.countercondition)
	e2:SetOperation(c96661043.counteroperation)
	c:RegisterEffect(e2)
	--activate
	local e3=Effect.CreateEffect(c)
	e3:SetCategory(CATEGORY_ATKCHANGE+CATEGORY_COUNTER)
	e3:SetProperty(EFFECT_FLAG_CARD_TARGET)
	e3:SetType(EFFECT_TYPE_IGNITION)
	e3:SetRange(LOCATION_SZONE)
	e3:SetTarget(c96661043.atktarget)
	e3:SetOperation(c96661043.atkoperation)
	c:RegisterEffect(e3)
end
function c96661043.condition(e,tp)
	local ph=Duel.GetCurrentPhase()
	return ph==PHASE_MAIN1 and Duel.GetTurnPlayer()==tp
end
function c96661043.countercondition(e,tp)
	return Duel.GetTurnPlayer()==tp
end
function c96661043.counteroperation(e,tp)
	local c=e:GetHandler()
	c:AddCounter(0x1,1)
end
function c96661043.filter(c,e)
	return c:IsType(TYPE_MONSTER) and not c:IsImmuneToEffect(e) and c:IsCode(96661011,96661012,96661013,96661014)
end
function c96661043.atktarget(e,tp,eg,ev,ep,re,r,rp,chk)
	local c=e:GetHandler()
	local count=c:GetCounter(0x1)
	if chk==0 then return count~=0 and c:IsCanRemoveCounter(tp,0x1,count,REASON_COST) and Duel.IsExistingTarget(c96661043.filter,tp,LOCATION_MZONE,0,1,nil,e) end
	local tg=Duel.SelectTarget(tp,c96661043.filter,tp,LOCATION_MZONE,0,1,1,nil,e)
	c:RemoveCounter(tp,0x1,count,REASON_COST)
	Duel.SetTargetParam(500*count)
	Duel.SetOperationInfo(0,CATEGORY_ATKCHANGE,tg,1,tp,500*count)
end
function c96661043.atkoperation(e,tp)
	local c=e:GetHandler()
	local tg,val=Duel.GetChainInfo(0,CHAININFO_TARGET_CARDS,CHAININFO_TARGET_PARAM)
	local tc=tg:GetFirst()
	if not tc:IsRelateToEffect(e) then return end
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetCode(EFFECT_UPDATE_ATTACK)
	e1:SetValue(val)
	e1:SetReset(RESET_EVENT+0x1fe0000)
	tc:RegisterEffect(e1)
end
--[[
	c:IsCode(96661011,96661012,96661013,96661014) goku
	0x1 change to counter value
--]]