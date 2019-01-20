const sellcar = {
    template: `
        <div>
            <multiform>
                <formpart slot="fmpart" title="Car Details" v-bind:validate="false">
                    <div class="form">
                        <div>
                            <label>Select Manufacturer: </label>
                            <select v-model="carforsale.makeid" @change="loadModels">
                                <option selected disabled value="">Select Manufacturer</option>
                                <option v-for="make in carmakes" :value="make[0]">{{make[1]}}</option>
                            </select>
                            <span v-if="invalids.makeid">Please choose make</span>
                        </div>
                        <div>
                            <label>Select Model: </label>
                            <select v-model="carforsale.modelid">
                                <option selected disabled value="">Select Model</option>
                                <option v-for="model in filteredmodels" :value="model[0]">{{model[2]}}</option>
                            </select>
                            <span v-if="invalids.modelid">Please choose model</span>
                        </div>
                        <div>
                            <label>Model Year: </label>
                            <input type="text" v-model="carforsale.year"/>
                            <span v-if="invalids.year">Please enter car year</span>
                        </div>
                        <div>
                            <label>Mileage: </label>
                            <input type="text" v-model="carforsale.mileage"/>
                            <span v-if="invalids.mileage">Please enter mileage</span>
                        </div>
                        <div>
                            <label>Engine Capacity: </label>
                            <input type="text" v-model="carforsale.engine"/>
                            <span v-if="invalids.engine">Please enter engine capacity</span>
                        </div>
                        <div>
                            <label>Transmission: </label>
                            <select v-model="carforsale.transmission">
                                <option selected disabled vlaue="">--Choose transmission--</option>
                                <option>4-shift automatic</option>
                                <option>4-shift manual</option>
                                <option>5-shift automatic</option>
                                <option>5-shift manual</option>
                                <option>6-shift automatic</option>
                                <option>6-shift manual</option>
                                <option>7-shift automatic</option>
                                <option>7-shift manual</option>
                                <option>8-shift automatic</option>
                                <option>8-shift manual</option>
                                <option>9-shift automatic</option>
                                <option>9-shift manual</option>
                                <option>Automatic CVT</option>
                            </select>
                            <span v-if="invalids.transmission">Please choose transmission</span>
                        </div>
                        <div>
                            <label>Drivetrain: </label>
                            <select v-model="carforsale.drivetrain">
                                <option selected disabled value="">Select drivetrain</option>
                                <option>FWD</option>
                                <option>RWD</option>
                                <option>AWD</option>
                            </select>
                            <span v-if="invalids.drivetrain">Please choose drivetrain</span>
                        </div>
                        <div>
                            <label>Fuel type: </label>
                            <select v-model="carforsale.fueltype">
                                <option selected disabled>Select fuel type</option>
                                <option>Gasoline</option>
                                <option>Diesel</option>
                                <option>Hybrid</option>
                            </select>
                            <span v-if="invalids.fueltype">Please choose fueltype</span>
                        </div>
                        <div>
                            <label>Car type: </label>
                            <select v-model="carforsale.cartype">
                                <option selected disabled>--Choose body type--</option>
                                <option>Bus</option>
                                <option>Coupe</option>
                                <option>Hatchback</option>
                                <option>Pickup</option>
                                <option>Sedan</option>
                                <option>Supercar</option>
                                <option>SUV</option>
                                <option>Van</option>
                                <option>Wagon</option>
                            </select>
                            <span v-if="invalids.fueltype">Please choose cartype</span>
                        </div>
                        <div>
                            <label>Passenger Count: </label>
                            <input type="number" v-model="carforsale.psng_count"/>
                            <span v-if="invalids.psng_count">Please enter number of passengers limits</span>
                        </div>
                        <div>
                            <label>Interior Color: </label>
                            <input type="text" v-model="carforsale.interior_color"/>
                            <span v-if="invalids.interior_color">Please enter interior color of the car</span>
                        </div>
                        <div>
                            <label>Exterior Color: </label>
                            <input type="text" v-model="carforsale.exterior_color"/>
                            <span v-if="invalids.exterior_color">Please enter exterior color of the car</span>
                        </div>
                        <div>
                            <label>Proposed Price: </label>
                            <input type="text" v-model="carforsale.proposed_price"/>
                            <span v-if="invalids.proposed_price">Please enter your car price</span>
                        </div>
                    </div>
                </formpart>
    
                <formpart slot="fmpart" title="Car photos">
                    <h5>Photos</h5>
                    <form enctype="multipart/form-data">
                        <div class="split-container">
                            <div class="split-content">
                                <p class="photo-label">Front</p>
                                <div class="image-view"><img src="" alt="no image"/></div>
                                <div class="file-label">
                                    <button class="file-button">Add image</button>
                                    <input type=file class="input-file"/>
                                </div>
                            </div>
                            <div class="split-content">
                                <div><img src="" alt="no image"/></div>
                                <p>Back</p>
                            </div>
                            <div class="split-content">
                                <div><img src="" alt="no image"/></div>
                                <p>Left</p>
                            </div>
                            <div class="split-content">
                                <div><img src="" alt="no image"/></div>
                                <p>Right</p>
                            </div>
                        </div>
                    </form>
                </formpart>
    
                <formpart slot="fmpart" title="Additional Details">
                    <h5>Car additional info</h5>
                </formpart>
    
                <formpart slot="fmpart" title="Status Health">
                    <h5>Does your car have any problems?</h5>
                    <h5>Are there parts that are damaged?</h5>
                </formpart>
            </multiform>
        </div>
    `,
    mounted() {
        let _self = this
        requirejs(['util/carmakes','util/carmodels'], function(cmake, cmodel) {
            _self.carmakes = cmake
            _self.carmodels = cmodel
        })
    },
    data() {
        return {
            carmakes:[],
            carmodels:[],
            filteredmodels: [],
            carforsale : {
                makeid: '',
                modelid: '',
                year: '',
                mileage: '',
                engine: '',
                transmission: '',
                drivetrain: '',
                fueltype: '',
                cartype: '',
                psng_count: '',
                interior_color: '',
                exterior_color: '',
                proposed_price: '',
                agreed_price: '',
                photos: '',
            },
            photos: {
                front:'',
                back:'',
                rside:'',
                lside:'',
                other: []
            },
            invalids: { }
        }
    },
    methods: {
        loadModels() {
            this.filteredmodels = this.carmodels.filter(x => x[1] === this.carforsale.makeid)
        },
        validate(activeIndex) {
            this.clearError()
            let invalid = false
            switch(activeIndex) {
                case 0:
                    for(c in this.carforsale) {
                        console.log(c)
                        if(this.carforsale[c] === '') {
                            this.invalids[c] = true
                            if(!invalid)
                                invalid = true
                        }    
                    }
                break;
                
            }
            return invalid
        },
        clearError() {
            this.invalids = {}
        }
    }
}

define(function() {
    return sellcar
})