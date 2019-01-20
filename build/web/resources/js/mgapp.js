//function searchInit() {
//    var searchbtn = document.getElementById('search')
//    var text = document.getElementById('searchtext')
//    if(searchbtn !== null && text !== null && searchbtn !== undefined && text !== undefined) {
//        searchbtn.addEventListener('click', searchQuery)
//    //                searchbtn.onclick = searchQuery;
//        text.onkeypress = function(e) {
//            console.log('pressed')
//            if(e.keyCode == 13)
//                searchQuery()
//        }    
//    }
//}
//
//function searchQuery() {
//    var text = document.getElementById('searchtext')
//    console.log(text.value)
//    if(text.value !== '' && text.value !== null) {
//        window.location.href = 'http://localhost:8084/BuySellCar/searchquery?q='+text.value
//    }
//}
//
//window.onload = searchInit


    
requirejs(['axios'], function(axios){

    axios.defaults.baseURL = 'http://localhost:8084/BuySellCar/'
    axios.defaults.headers.common = {
        'X-CSRF-TOKEN' : document.querySelector('meta[name="csrf_token"]').getAttribute('content')
    }
//        headers: {'X-Requested-With': 'XMLHttpRequest'},


    new Vue({

        el:'#mgapp',
        data: {
            nameOfModels: [{name:''}],
            emp: {
                showemp: false,
                selected: '',
                couriers:[]
            }
        },
        methods: {
            addModel() {
                if(this.nameOfModels.length < 10)
                    this.nameOfModels.push({name:''})
            },
            removeModel(i) {
                if(this.nameOfModels.length > 1)
                    this.nameOfModels.pop(i)
            },
            loadEmployees(curemp) {
                this.emp.showemp = true
                axios.get('mg/couriers?emp='+curemp).then(res => {
                    console.log(res.data)
                    this.emp.couriers = res.data
                })
            },
//            changeCourier(delvid) {
//                let empid = this.emp.couriers[this.emp.selected]
//                axios.post('mg/courier/change', {did:delvid,eid:empid}).then(res => {
//                    this.emp.showemp = true
//                })
//            }
        }
    })
})