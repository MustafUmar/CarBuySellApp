const error = {
    props:['entity'],
    template: `<div v-show="entity.show" class="error">{{entity.message}}</div>`,
//    data() {
//        return {
//            entity: {
//                show: false,
//                message: '',
//            }
//        }
//    }
}

define(function() {
    return error
})


