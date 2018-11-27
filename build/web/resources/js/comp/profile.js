define(['axios'],function(axios) {
   axios.defaults.headers.common = {
            'X-CSRF-TOKEN' : document.querySelector('meta[name="csrf_token"]').getAttribute('content')
        }
    return {
        template: `
            <div>
                <h2>Personal Information</h2>
                <div>
                    <label>First Name:</label>
                    <input type="text" v-model="profile.user.firstname" disabled/>
                </div>
                <div>
                    <label>Last Name:</label>
                    <input type="text" v-model="profile.user.lastname"/>
                </div>
                <div>
                    <label>Email:</label>
                    <input type="text" v-model="profile.user.email"/>
                </div>
                <div>
                    <label>Phone Number:</label>
                    <input type="text" v-model="profile.user.phonenum"/>
                </div>
                <hr/>
                <h2>Billing Address</h2>
                <div v-if="profile.user.addresses.length > 0">
                    <div v-for="(address,index) in profile.user.addresses">
                        <div>Address {{index + 1}}</div>
                        <p @click="delAddress(index)" style="float:right">Remove</p>
                        <div>
                            <label>Country:</label>
                            <select v-model="address.country">
                                <option v-for="(val,k) in loc">{{val}}</option>
                            </select>
                        </div>
                        <div>
                            <label>State:</label>
                            <select v-model="address.state" @change="loadCities(index)">
                                <option v-for="(val,k) in loadStates(address.country)">{{val}}</option>
                            </select>
                        </div>
                        <div>
                            <label>City:</label>
                            <select v-model="address.city">
                                <option v-for="(val,k) in loadCities(address.country, address.state)">{{val}}</option>
                            </select>
                        </div>
                        <div>
                            <label style="vertical-align:top;">Street:</label>
                            <textarea v-model="address.street"></textarea>
                        </div>
                    <!--<div>
                            <label style="vertical-align:top;">Other address information</label>
                            <textarea v-model="profile.moreinfo"
                                placeholder="Add more information about your address if it's hard to find">
                            </textarea>
                        </div>-->
                    </div>
                </div>
                <div v-else>
                    <p>No billing address</p>
                </div>
                <div><button @click="addAddress">Add New Address</button></div>
                <hr/>
                <h2>User Account</h2>
                <div>
                    <button>Change Password</button>
                <!--<div>
                        <div>
                            <label>Old Password:</label>
                            <input type="password" v-model="pass.current"/>
                        </div>
                        <div>
                            <label>New Password:</label>
                            <input type="password" v-model="pass.newpass"/>
                        </div>
                        <div>
                            <label>Confirm Password:</label>
                            <input type="password" v-model="pass.confirm"/>
                        </div>
                    </div>-->
                </div>
                <div style="padding: 1rem 1rem;">
                    <button @click="submitData">Save</button>
                </div>
            </div>
        `,
        mounted() {
            const _self = this
            requirejs(['locations'], function(loc) {
                _self.locations = loc
                _self.loc = Object.keys(_self.locations)
            })
            
            axios.get('/user/user-profile').then(res => {
                this.profile = res.data
            })
//            this.loc = Object.keys(this.locations)
        },
        data() {
            return {
                profile: {
                    user: {
                        firstname:'',
                        lastname:'',
                        email:'',
                        phonenum:'',
                        addresses:[]
                    },
                    deletes:[],
//                    inserts:[]
                },
                edit: false,
                locations: [],
                loc:[],
                states: [],
                cities:[],
                

            }
        },
        methods: {
            addAddress() {
                if(this.profile.user.addresses.length < 4) {
                    if(this.profile.deletes.length > 0) {
                        this.profile.user.addresses.push(this.profile.deletes.pop())
                    } else {
                        this.profile.user.addresses.push({
                            street:'',
                            city:'',
                            state:'',
                            country:'',
                            moreinfo:''
                        })  
                    }
                }   
            },
            delAddress(i) {
                if(this.profile.user.addresses[i].id) {
                    Array.prototype.push.apply(this.profile.deletes, this.profile.user.addresses.splice(i,1))
//                    this.profile.deletes.push(this.profile.user.addresses.splice(i,1))
                } else {
                    this.profile.user.addresses.splice(i,1)
                }
            },
            submitData() {
                axios.post('/user/profile/save', this.profile).then(res => {
                    window.location.href="/BuySellCar/"
                })
            },
            loadStates(i) {
                if(this.locations[`${i}`])
                    return Object.keys(this.locations[`${i}`].states)
            },
            loadCities(i,j) {
                if(this.locations[`${i}`])
                    if(this.locations[`${i}`].states[`${j}`])
                        return this.locations[`${i}`].states[`${j}`]
            }
        }
    }

})

