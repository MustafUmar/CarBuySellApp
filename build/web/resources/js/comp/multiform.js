const multiform = {
    template: `
        <div class="tab-container">
            <div class="tab-menu">
                <div v-for="(tab,index) in formtabs" :key="index" :class="{'tab-item':true, 'active':tab.activeTab}">
                    <div class="title">{{tab.title}}</div>
                    <div class="description">{{tab.description}}</div>
                </div>
            </div>
    
            <div class="tab-content">   
                <slot name="fmpart"></slot>
            </div>
                
            <div class="footer">
                <div v-if="min" style="display:inline;">
                    <button @click="prev">Back</button>
                </div>
                <div style="display:inline; float:right;">
                    <div  v-if="max">
                        <button @click="next">Next >></button>
                    </div>
                    <div v-else>
                        <button class="button" @click="submit">Finish</button>
                    </div>
                </div>
            </div>
        </div>
    `,
    props: {
        formaction: {
            type: String,
        },
        formid: {
            type: String,
            default: 'sellform'
        },
        invalid: {
            type: Boolean,
        default: false
        }
    },
    provide() {
        return {
            addTab:this.addTab
        }
    },
    mounted() {
      if(this.formtabs.length > 0) {
            this.selectTab(this.activeIndex)
        }  
    },
    data() {
        return {
            formtabs: [],
            activeIndex: 0
        }
    },
    methods: {
        addTab(tab) {
            let index = this.$slots.fmpart.indexOf(tab.$vnode)
            this.formtabs.splice(index, 0, tab)
        },
        next() {
            this.performValidation()
            .then(() => {
                if(this.activeIndex < this.formtabs.length - 1) {
                    this.activeIndex++
                    this.selectTab(this.activeIndex)
                }
            }).catch(error => {
                console.log(error)
            })
           
        },
        prev() {
            if(this.activeIndex > 0) {
                this.activeIndex--
                this.selectTab(this.activeIndex)
            }
        },
        selectTab(selectedIndex) {
            this.formtabs.forEach((tab,index) => tab.activeTab = (index === selectedIndex))
        },
        performValidation() {
            return new Promise((resolve,reject) => {
                if(this.formtabs[this.activeIndex].validate) {
                    let invalid = true
                    invalid = this.$parent.validate(this.activeIndex)

                    if(invalid) {
                        reject('Invalid data')
                    } else resolve()

                } else {
                    resolve()
                }
            })
        },
        submit() {
            
        }
    },
    computed: {
        max() {
            return this.activeIndex < this.formtabs.length - 1
        },

        min() {
            return this.activeIndex > 0
        },
    }
}

//////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////

const formpart = {
    template:`
        <div v-show="activeTab">
            <slot></slot>
        </div>
    `,
    props: {
        title: {
            type:String,
            required: true
        },

        description : {
            type:String,
            default:''
        },

        validate: {
            type:Boolean,
            default: false
        },

        validateMethodName: {
            type:String,
        },

        stepicon: {
            type:String,
            default: 'train'
        }
    },
    inject:['addTab'],

    mounted() {
        this.addTab(this)
    },
    data() {
        return {
            activeTab:false
        }
    },
}

define(function() {
    return {
        multiform : multiform,
        formpart : formpart
    }
})