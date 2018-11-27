const tabs = {
    template: `
                <div class="tab-container">
                    <ul class="tab-menu">
                        <li v-for="tab in tabs" :class="{'tab-item':true, 'active':tab.activeTab}">
                            <span>{{tab.name}}</span>
                        </li>
                    </ul>
                    <div class="tab-content">
                        <slot></slot>
                    </div>
                    <div class="tab-footer">
                        <div v-if="min" style="display:inline;">
                            <button @click="prev">Back</button>
                        </div>
                        <div style="display:inline; float:right;">
                            <button v-if="max" @click.prevent="next">Next</button>
                            <button v-else @click.prevent="complete" :disabled="off">{{btnmsg}}</button>
                        </div>
                    </div>
                </div>
    `,
    mounted() {
        this.tabs = this.$vnode.componentInstance.$children
        
        if(this.tabs.length > 0) {
            this.selectTab(this.activeIndex)
        }
        
//        console.log(this.$parent.count)
//
    },
    data() {
        return {
            tabs:[],
            activeIndex:0,
            off: false,
            btnmsg:'Confirm Order'
        }
    },
    methods: {
        next() {
            this.$parent.clearError()
            if(this.currentTab.validate) {
                if(!this.$parent.validate(this.currentTab.valname)) {
                    this.nextTab()
                }
            } else {
                this.nextTab()
            }            
        },
        prev() {
            if(this.activeIndex > 0) {
                this.activeIndex--
                this.selectTab(this.activeIndex)
            }
        },
        nextTab() {
            if(this.activeIndex < this.tabs.length - 1) {
                this.activeIndex++
                this.selectTab(this.activeIndex)
            }
        },
        complete() {
            if(this.currentTab.validate) {
                if(!this.$parent.validate(this.currentTab.valname)) {
                    this.off = true
                    this.btnmsg = 'Please wait...'
                    this.$emit('confirm')
                }
            }
            
        },
        selectTab(selectedIndex) {
            this.tabs.forEach((tab,index) => tab.activeTab = (index === selectedIndex))
        }
    },
    computed: {
        max() {
            return this.activeIndex < this.tabs.length - 1
        },

        min() {
            return this.activeIndex > 0
        },
        currentTab() {
            return this.tabs[this.activeIndex]
        }
    }
}

const tab = {
    template: `
                <div v-show="activeTab"><slot></slot></div>
              `,
    props: {
        name: { required:true },
        validate: {
            type:Boolean,
            default: false
        },
        valname: {
            type:String,
            default: ''
        }
//        selected: {default:false}
    },
    data() {
        return {
            activeTab:false
        }
    }
    
}

define(function() {
    return {
        tabs : tabs,
        tab : tab
    }
})