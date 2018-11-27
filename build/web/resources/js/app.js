function searchInit() {
    var searchbtn = document.getElementById('search')
    var text = document.getElementById('searchtext')
    if(searchbtn !== null && text !== null && searchbtn !== undefined && text !== undefined) {
        searchbtn.addEventListener('click', searchQuery)
    //                searchbtn.onclick = searchQuery;
        text.onkeypress = function(e) {
            console.log('pressed')
            if(e.keyCode == 13)
                searchQuery()
        }    
    }
}

function searchQuery() {
    var text = document.getElementById('searchtext')
    console.log(text.value)
    if(text.value !== '' && text.value !== null) {
        window.location.href = 'http://localhost:8084/BuySellCar/searchquery?q='+text.value
    }
}

window.onload = searchInit



requirejs(['http://localhost:8084/BuySellCar/resources/js/ven/rqconfig.js'], function() {

    
//console.log(requirejs(['modal'], function(modal){return modal}))
    requirejs(['axios','tb','profile','error','modal'], function(axios,tb,profile,error){
        
        axios.defaults.baseURL = 'http://localhost:8084/BuySellCar/'
        axios.defaults.headers.common = {
            'X-CSRF-TOKEN' : document.querySelector('meta[name="csrf_token"]').getAttribute('content')
        }
//        headers: {'X-Requested-With': 'XMLHttpRequest'},
        Vue.component('shopcart', {
      // camelCase in JavaScript
          props: {
              'items':{ type:Number, default:0}
          },
          template:`<div style="float:right; padding:.3rem .8rem;">
                        <span><a href="http://localhost:8084/BuySellCar/user/cart">Cart Items: {{items}}</a></span>
                    </div>`,
        })

        Vue.component('cart-action', {
            template: `<a href="http://localhost:8084/BuySellCar/user/cart">Check cart</a>`,
        })

        Vue.component('buy-action', {
            props:['carid'],
            template: `<button @click="$emit('cart-action', carid)">Buy Car</button>`,
        })

        Vue.component('profile', profile)
        Vue.component('tabs',tb.tabs)
        Vue.component('tab',tb.tab)
        Vue.component('error',error)
        Vue.component('modal',modal)

        Vue.component('shopitems', {
            //<modal v-if="showmodal" @close="showmodal = false"></modal>
            props:['cart'],
            template: `
                        <div style="width: 70%; margin: 0 auto;">
                            <div v-if="cart.length > 0">
                                <div v-for="(car,i) in cart" style="border-bottom: 1px solid black;">
                                    <p>{{car.make}} {{car.modelname}} {{car.typename}}</p>
                                    <p>{{car.price}}</p>
                                    <button @click="$emit('remove_item', car.carid, i)">Remove from cart</button>
                                </div>
                                <button><a href="http://localhost:8084/BuySellCar/user/order">Place Order</a></button>
                                <button>Book for Test Drive</button>
                                <button @click="$emit('clear_all')">Remove all</button>

                                
                            </div>
                            <div v-else>
                                <div>No cars added to cart.</div>
                            </div>
                        </div>
                      `,
        })

        new Vue({

            el:'#vapp',
            data: {
                cart:[],
                count:0,
                order: {
                    address:'',
                    payment:''
                },
                error: {
                    show: false,
                    message: ''
                },
                showmodal: false,
                showtext:'',
                cancel: {
                    reason:'',
                    other: false,
                }
            },
            mounted() {
              axios.get('cart').then(res => {
                  this.cart = res.data.cars
    //              this.count = this.cart.length
              })
              
              searchInit()
            },
            methods: {
                addToCart(id) {
                    axios.post('cart/add/'+id).then(res => {
                        if(res.data !== null && res.data !== undefined)
                            this.cart = res.data.cars
                    }).catch(err => {
                        if(err.response.status)
                            if(err.response.status === 401)
                                window.location.reload()
                    })
                },
                removeFromCart(id,i) {
                    axios.post('cart/remove/'+id).then(res => {
                        console.log(res.data)
                        this.cart.pop(i)
    //                    this.cart.splice(i,1)
                    }).catch(err => {
                        if(err.response.status)
                            if(err.response.status === 401)
                                window.location.reload()
                    })
                },
                removeAll() {
                    axios.post('cart/clear').then(res => {
                        console.log(res.data)
                        this.cart = []
                    }).catch(err => {
                        if(err.response.status)
                            if(err.response.status === 401)
                                window.location.reload()
                    })
                },
                contains(id) {
                    return this.cart.some(item => item.carid === id)
                },
                placeOrder() {
                    axios.post('user/prepare-order', this.order).then(res => {
                        console.log(res.data)
                        window.location.replace(`http://localhost:8383/pay?pkey=${res.data.pkey}&envoy=${res.data.envoy}`)
                    }).catch(err => {
                        if(err.response.status)
                            if(err.response.status === 401)
                                window.location.reload()
                    })
                },
                cancelOrder() {
                    const form = document.getElementById('reasonform')
                    form.submit()
                },
                validate(op) {
                    switch(op) {
                        case 'address':
                            if(this.order.address === null || this.order.address === undefined || this.order.address === '') {
                                this.error.show = true
                                this.error.message = 'Please select address!'
                            }
                            return this.error.show
                        case 'payment':
                            if(this.order.payment === null || this.order.payment === undefined || this.order.payment === '') {
                                this.error.show = true
                                this.error.message = 'Please select payment option!'
                            }
                            return this.error.show
                    }
                },
                clearError() {
                    this.error = {
                        show: false,
                        message: ''
                    }
                },
                openModal(or,py) {
                    let form = document.getElementById('reasonform')
                    let oid = document.createElement('input')
                    oid.setAttribute('type', 'hidden')
                    oid.setAttribute('name', 'myorder')
                    oid.setAttribute('value', or)
                    form.appendChild(oid)
                    
                    let pay = document.createElement('input')
                    pay.setAttribute('type', 'hidden')
                    pay.setAttribute('name', 'myreceipt')
                    pay.setAttribute('value', py)
                    form.appendChild(pay)
                    
                    this.showmodal = true
                }
            },
    //        components: {
    //            BuyAction
    //        }
        })
    })
})