--Pump Up
--Scripted by: TheOnePharaoh
--Target 1 "Freeza" or "Cell (Perfect)" monster you control: Double its ATK. During the End Phase, destroy it. You can only activate 1 "Pump Up" per turn.
function c96660004.initial_effect(c)
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_ACTIVATE)
	e1:SetCode(EVENT_FREE_CHAIN)
	e1:SetProperty(EFFECT_FLAG_CARD_TARGET)
	e1:SetTarget(c96660004.tar)
	e1:SetOperation(c96660004.op)
	c:RegisterEffect(e1)
end
function c96660004.filter(c)
	return c:IsFaceup() and (c:IsCode(96660003) or c:IsCode(96660019))
end
function c96660004.tar(e,tp,eg,ep,ev,re,r,rp,chk,chkc)
	if chkc then return  chkc:IsControler(tp) and chkc:IsLocation(LOCATION_MZONE) and chkc:IsFaceup() and c96660004.filter(chkc) end
	if chk==0 then return Duel.IsExistingTarget(c96660004.filter,tp,LOCATION_MZONE,0,1,nil) end
	Duel.Hint(HINT_SELECTMSG,tp,HINTMSG_FACEUP)
	Duel.SelectTarget(tp,c96660004.filter,tp,LOCATION_MZONE,0,1,1,nil)
end
function c96660004.op(e,tp,eg,ep,ev,re,r,rp)
	local tc=Duel.GetFirstTarget()
	if tc:IsFaceup() and tc:IsRelateToEffect(e) then
		local e1=Effect.CreateEffect(e:GetHandler())
		e1:SetType(EFFECT_TYPE_SINGLE)
		e1:SetCode(EFFECT_SET_ATTACK_FINAL)
		e1:SetReset(RESET_EVENT+0x1fe0000)
		e1:SetValue(tc:GetAttack()*2)
		tc:RegisterEffect(e1)
		local e2=Effect.CreateEffect(e:GetHandler())
		e2:SetType(EFFECT_TYPE_FIELD+EFFECT_TYPE_CONTINUOUS)
		e2:SetCode(EVENT_PHASE+PHASE_END)
		e2:SetRange(LOCATION_MZONE)
		e2:SetReset(RESET_EVENT+0x1fe0000+RESET_PHASE+PHASE_END)
		e2:SetCountLimit(1)
		e2:SetOperation(c96660004.desop)
		tc:RegisterEffect(e2)
	end
end
function c96660004.desop(e,tp,eg,ep,ev,re,r,rp)
	Duel.Destroy(e:GetHandler(),REASON_EFFECT)
end
