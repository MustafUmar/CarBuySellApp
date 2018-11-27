const cancel = {
    template:
    `
        <modal v-show="showmodal" @emitter="cancelOrder" @close="showmodal=false">
            <h4 slot="modal-header">
                Please tell us the reason for cancelling your order? It can help us improve our service for you.
            </h4>
            <form slot="modal-content" id="reasonform" method="post" action="${pageContext.request.contextPath}/user/cancel-order">
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                <div>
                    <label>
                        <input type="radio" name="reason" value="I changed my mind." v-model="cancel.reason"/>
                        I changed my mind.
                    </label>
                </div>
                <div>
                    <label>
                        <input type="radio" name="reason" value="Found a better deal." v-model="cancel.reason"/>
                        Found a better deal.
                    </label>
                </div>
                <div>
                    <label>
                        <input type="radio" name="reason" value="" @change="cancel.reason===''?cancel.other=true:cancel.other=false" v-model="cancel.reason"/>
                        Other
                    </label>
                    <textarea v-if="cancel.other" name="reason" v-model="cancel.reason" style="vertical-align: top;" cols="80" rows="3"></textarea>
                </div>
                
            </form>
        </modal>
    `,
    data() {
        return {
            
        }
    }
    methods: {
        
    }
}


define(function() {
    return cancel;
})