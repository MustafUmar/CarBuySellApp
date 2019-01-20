requirejs(['axios'], function(axios){

    axios.defaults.baseURL = 'http://localhost:8084/BuySellCar/'
    axios.defaults.headers.common = {
        'X-CSRF-TOKEN' : document.querySelector('meta[name="csrf_token"]').getAttribute('content')
    }

    new Vue({
        el:'#adapp',
        data: {
            saveFile: {
                saveSuccess: false,
                msg: ''
            }
        },
        methods: {
            saveCar() {
                axios.post('admin/local-save').then(res => {
                    console.log(res.data)
                    this.saveFile.msg = res.data
                    this.saveFile.saveSuccess = true
                }).catch(err => {
                    console.log(err.response)
                    this.saveFile.msg = 'Error, unable to save.'
                    this.saveFile.saveSuccess = true
                })
            },
            closeSave() {
                this.saveFile.saveSuccess = false
                this.saveFile.msg = ''
            }
        }
    })
})