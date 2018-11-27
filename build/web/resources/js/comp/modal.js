const modal = {
    prop:['emitter'],
    template: `
                <div class="modalbg">
                    <div class="modal-wrapper">
                        <div class="modal-container">
                            
                            <div class="modal-header">
                                <span id="close-modal" @click.prevent="$emit('close')"><b>X</b></span>
                                <slot name="modal-header"></slot>
                            </div>
    
                            <div class="modal-content">
                                <div><slot name="modal-content"></slot></div>
                            </div>
    
                            <div class="modal-footer">
                                <button @click.prevent="$emit('emitter')">Submit</button>
                                <button @click.prevent="$emit('close')">Cancel</button>
                            </div>
                            
                        </div>
                    </div>
                </div>
              `
}

define(function() {
    return modal;
})



