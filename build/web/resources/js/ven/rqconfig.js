//define('jquery',['jquery'], function($) {
//    console.log('im axios')
//})
requirejs.config({
    skipDataMain: true,
    baseUrl: '/BuySellCar/resources/js',
    paths: {
//        jquery:'ven/jquery-3.2.1.min',
//        vue:'ven/vue.min',
        axios:'ven/axios.min',
        tb:'comp/tb',
        profile:'comp/profile',
        error:'comp/error',
        locations:'util/locations',
        modal:'comp/modal'
    }
    
})


//define(['axios'], function(axios){
//    console.log('reqiure ready')
//    window.axios = axios
//    axios.defaults.baseURL = 'http://localhost:8084/BuySellCar/'
//})

//requirejs(['axios'], function(axios) {
//    console.log(axios)
//})


