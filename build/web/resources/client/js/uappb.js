/* axios v0.19.0-beta.1 | (c) 2018 by Matt Zabriskie */
!function(e,t){"object"==typeof exports&&"object"==typeof module?module.exports=t():"function"==typeof define&&define.amd?define('axios',[],t):"object"==typeof exports?exports.axios=t():e.axios=t()}(this,function(){return function(e){function t(r){if(n[r])return n[r].exports;var o=n[r]={exports:{},id:r,loaded:!1};return e[r].call(o.exports,o,o.exports,t),o.loaded=!0,o.exports}var n={};return t.m=e,t.c=n,t.p="",t(0)}([function(e,t,n){e.exports=n(1)},function(e,t,n){"use strict";function r(e){var t=new i(e),n=s(i.prototype.request,t);return o.extend(n,i.prototype,t),o.extend(n,t),n}var o=n(2),s=n(3),i=n(5),a=n(22),u=n(11),c=r(u);c.Axios=i,c.create=function(e){return r(a(c.defaults,e))},c.Cancel=n(23),c.CancelToken=n(24),c.isCancel=n(10),c.all=function(e){return Promise.all(e)},c.spread=n(25),e.exports=c,e.exports.default=c},function(e,t,n){"use strict";function r(e){return"[object Array]"===j.call(e)}function o(e){return"[object ArrayBuffer]"===j.call(e)}function s(e){return"undefined"!=typeof FormData&&e instanceof FormData}function i(e){var t;return t="undefined"!=typeof ArrayBuffer&&ArrayBuffer.isView?ArrayBuffer.isView(e):e&&e.buffer&&e.buffer instanceof ArrayBuffer}function a(e){return"string"==typeof e}function u(e){return"number"==typeof e}function c(e){return"undefined"==typeof e}function f(e){return null!==e&&"object"==typeof e}function p(e){return"[object Date]"===j.call(e)}function d(e){return"[object File]"===j.call(e)}function l(e){return"[object Blob]"===j.call(e)}function h(e){return"[object Function]"===j.call(e)}function m(e){return f(e)&&h(e.pipe)}function y(e){return"undefined"!=typeof URLSearchParams&&e instanceof URLSearchParams}function g(e){return e.replace(/^\s*/,"").replace(/\s*$/,"")}function x(){return("undefined"==typeof navigator||"ReactNative"!==navigator.product&&"NativeScript"!==navigator.product&&"NS"!==navigator.product)&&("undefined"!=typeof window&&"undefined"!=typeof document)}function v(e,t){if(null!==e&&"undefined"!=typeof e)if("object"!=typeof e&&(e=[e]),r(e))for(var n=0,o=e.length;n<o;n++)t.call(null,e[n],n,e);else for(var s in e)Object.prototype.hasOwnProperty.call(e,s)&&t.call(null,e[s],s,e)}function w(){function e(e,n){"object"==typeof t[n]&&"object"==typeof e?t[n]=w(t[n],e):t[n]=e}for(var t={},n=0,r=arguments.length;n<r;n++)v(arguments[n],e);return t}function b(){function e(e,n){"object"==typeof t[n]&&"object"==typeof e?t[n]=b(t[n],e):"object"==typeof e?t[n]=b({},e):t[n]=e}for(var t={},n=0,r=arguments.length;n<r;n++)v(arguments[n],e);return t}function E(e,t,n){return v(t,function(t,r){n&&"function"==typeof t?e[r]=S(t,n):e[r]=t}),e}var S=n(3),R=n(4),j=Object.prototype.toString;e.exports={isArray:r,isArrayBuffer:o,isBuffer:R,isFormData:s,isArrayBufferView:i,isString:a,isNumber:u,isObject:f,isUndefined:c,isDate:p,isFile:d,isBlob:l,isFunction:h,isStream:m,isURLSearchParams:y,isStandardBrowserEnv:x,forEach:v,merge:w,deepMerge:b,extend:E,trim:g}},function(e,t){"use strict";e.exports=function(e,t){return function(){for(var n=new Array(arguments.length),r=0;r<n.length;r++)n[r]=arguments[r];return e.apply(t,n)}}},function(e,t){/*!
	 * Determine if an object is a Buffer
	 *
	 * @author   Feross Aboukhadijeh <https://feross.org>
	 * @license  MIT
	 */
e.exports=function(e){return null!=e&&null!=e.constructor&&"function"==typeof e.constructor.isBuffer&&e.constructor.isBuffer(e)}},function(e,t,n){"use strict";function r(e){this.defaults=e,this.interceptors={request:new i,response:new i}}var o=n(2),s=n(6),i=n(7),a=n(8),u=n(22);r.prototype.request=function(e){"string"==typeof e?(e=arguments[1]||{},e.url=arguments[0]):e=e||{},e=u(this.defaults,e),e.method=e.method?e.method.toLowerCase():"get";var t=[a,void 0],n=Promise.resolve(e);for(this.interceptors.request.forEach(function(e){t.unshift(e.fulfilled,e.rejected)}),this.interceptors.response.forEach(function(e){t.push(e.fulfilled,e.rejected)});t.length;)n=n.then(t.shift(),t.shift());return n},r.prototype.getUri=function(e){return e=u(this.defaults,e),s(e.url,e.params,e.paramsSerializer).replace(/^\?/,"")},o.forEach(["delete","get","head","options"],function(e){r.prototype[e]=function(t,n){return this.request(o.merge(n||{},{method:e,url:t}))}}),o.forEach(["post","put","patch"],function(e){r.prototype[e]=function(t,n,r){return this.request(o.merge(r||{},{method:e,url:t,data:n}))}}),e.exports=r},function(e,t,n){"use strict";function r(e){return encodeURIComponent(e).replace(/%40/gi,"@").replace(/%3A/gi,":").replace(/%24/g,"$").replace(/%2C/gi,",").replace(/%20/g,"+").replace(/%5B/gi,"[").replace(/%5D/gi,"]")}var o=n(2);e.exports=function(e,t,n){if(!t)return e;var s;if(n)s=n(t);else if(o.isURLSearchParams(t))s=t.toString();else{var i=[];o.forEach(t,function(e,t){null!==e&&"undefined"!=typeof e&&(o.isArray(e)?t+="[]":e=[e],o.forEach(e,function(e){o.isDate(e)?e=e.toISOString():o.isObject(e)&&(e=JSON.stringify(e)),i.push(r(t)+"="+r(e))}))}),s=i.join("&")}return s&&(e+=(e.indexOf("?")===-1?"?":"&")+s),e}},function(e,t,n){"use strict";function r(){this.handlers=[]}var o=n(2);r.prototype.use=function(e,t){return this.handlers.push({fulfilled:e,rejected:t}),this.handlers.length-1},r.prototype.eject=function(e){this.handlers[e]&&(this.handlers[e]=null)},r.prototype.forEach=function(e){o.forEach(this.handlers,function(t){null!==t&&e(t)})},e.exports=r},function(e,t,n){"use strict";function r(e){e.cancelToken&&e.cancelToken.throwIfRequested()}var o=n(2),s=n(9),i=n(10),a=n(11),u=n(20),c=n(21);e.exports=function(e){r(e),e.baseURL&&!u(e.url)&&(e.url=c(e.baseURL,e.url)),e.headers=e.headers||{},e.data=s(e.data,e.headers,e.transformRequest),e.headers=o.merge(e.headers.common||{},e.headers[e.method]||{},e.headers||{}),o.forEach(["delete","get","head","post","put","patch","common"],function(t){delete e.headers[t]});var t=e.adapter||a.adapter;return t(e).then(function(t){return r(e),t.data=s(t.data,t.headers,e.transformResponse),t},function(t){return i(t)||(r(e),t&&t.response&&(t.response.data=s(t.response.data,t.response.headers,e.transformResponse))),Promise.reject(t)})}},function(e,t,n){"use strict";var r=n(2);e.exports=function(e,t,n){return r.forEach(n,function(n){e=n(e,t)}),e}},function(e,t){"use strict";e.exports=function(e){return!(!e||!e.__CANCEL__)}},function(e,t,n){"use strict";function r(e,t){!s.isUndefined(e)&&s.isUndefined(e["Content-Type"])&&(e["Content-Type"]=t)}function o(){var e;return"undefined"!=typeof process&&"[object process]"===Object.prototype.toString.call(process)?e=n(13):"undefined"!=typeof XMLHttpRequest&&(e=n(13)),e}var s=n(2),i=n(12),a={"Content-Type":"application/x-www-form-urlencoded"},u={adapter:o(),transformRequest:[function(e,t){return i(t,"Accept"),i(t,"Content-Type"),s.isFormData(e)||s.isArrayBuffer(e)||s.isBuffer(e)||s.isStream(e)||s.isFile(e)||s.isBlob(e)?e:s.isArrayBufferView(e)?e.buffer:s.isURLSearchParams(e)?(r(t,"application/x-www-form-urlencoded;charset=utf-8"),e.toString()):s.isObject(e)?(r(t,"application/json;charset=utf-8"),JSON.stringify(e)):e}],transformResponse:[function(e){if("string"==typeof e)try{e=JSON.parse(e)}catch(e){}return e}],timeout:0,xsrfCookieName:"XSRF-TOKEN",xsrfHeaderName:"X-XSRF-TOKEN",maxContentLength:-1,validateStatus:function(e){return e>=200&&e<300}};u.headers={common:{Accept:"application/json, text/plain, */*"}},s.forEach(["delete","get","head"],function(e){u.headers[e]={}}),s.forEach(["post","put","patch"],function(e){u.headers[e]=s.merge(a)}),e.exports=u},function(e,t,n){"use strict";var r=n(2);e.exports=function(e,t){r.forEach(e,function(n,r){r!==t&&r.toUpperCase()===t.toUpperCase()&&(e[t]=n,delete e[r])})}},function(e,t,n){"use strict";var r=n(2),o=n(14),s=n(6),i=n(17),a=n(18),u=n(15);e.exports=function(e){return new Promise(function(t,c){var f=e.data,p=e.headers;r.isFormData(f)&&delete p["Content-Type"];var d=new XMLHttpRequest;if(e.auth){var l=e.auth.username||"",h=e.auth.password||"";p.Authorization="Basic "+btoa(l+":"+h)}if(d.open(e.method.toUpperCase(),s(e.url,e.params,e.paramsSerializer),!0),d.timeout=e.timeout,d.onreadystatechange=function(){if(d&&4===d.readyState&&(0!==d.status||d.responseURL&&0===d.responseURL.indexOf("file:"))){var n="getAllResponseHeaders"in d?i(d.getAllResponseHeaders()):null,r=e.responseType&&"text"!==e.responseType?d.response:d.responseText,s={data:r,status:d.status,statusText:d.statusText,headers:n,config:e,request:d};o(t,c,s),d=null}},d.onabort=function(){d&&(c(u("Request aborted",e,"ECONNABORTED",d)),d=null)},d.onerror=function(){c(u("Network Error",e,null,d)),d=null},d.ontimeout=function(){c(u("timeout of "+e.timeout+"ms exceeded",e,"ECONNABORTED",d)),d=null},r.isStandardBrowserEnv()){var m=n(19),y=(e.withCredentials||a(e.url))&&e.xsrfCookieName?m.read(e.xsrfCookieName):void 0;y&&(p[e.xsrfHeaderName]=y)}if("setRequestHeader"in d&&r.forEach(p,function(e,t){"undefined"==typeof f&&"content-type"===t.toLowerCase()?delete p[t]:d.setRequestHeader(t,e)}),e.withCredentials&&(d.withCredentials=!0),e.responseType)try{d.responseType=e.responseType}catch(t){if("json"!==e.responseType)throw t}"function"==typeof e.onDownloadProgress&&d.addEventListener("progress",e.onDownloadProgress),"function"==typeof e.onUploadProgress&&d.upload&&d.upload.addEventListener("progress",e.onUploadProgress),e.cancelToken&&e.cancelToken.promise.then(function(e){d&&(d.abort(),c(e),d=null)}),void 0===f&&(f=null),d.send(f)})}},function(e,t,n){"use strict";var r=n(15);e.exports=function(e,t,n){var o=n.config.validateStatus;!o||o(n.status)?e(n):t(r("Request failed with status code "+n.status,n.config,null,n.request,n))}},function(e,t,n){"use strict";var r=n(16);e.exports=function(e,t,n,o,s){var i=new Error(e);return r(i,t,n,o,s)}},function(e,t){"use strict";e.exports=function(e,t,n,r,o){return e.config=t,n&&(e.code=n),e.request=r,e.response=o,e.toJSON=function(){return{message:this.message,name:this.name,description:this.description,number:this.number,fileName:this.fileName,lineNumber:this.lineNumber,columnNumber:this.columnNumber,stack:this.stack,config:this.config,code:this.code}},e}},function(e,t,n){"use strict";var r=n(2),o=["age","authorization","content-length","content-type","etag","expires","from","host","if-modified-since","if-unmodified-since","last-modified","location","max-forwards","proxy-authorization","referer","retry-after","user-agent"];e.exports=function(e){var t,n,s,i={};return e?(r.forEach(e.split("\n"),function(e){if(s=e.indexOf(":"),t=r.trim(e.substr(0,s)).toLowerCase(),n=r.trim(e.substr(s+1)),t){if(i[t]&&o.indexOf(t)>=0)return;"set-cookie"===t?i[t]=(i[t]?i[t]:[]).concat([n]):i[t]=i[t]?i[t]+", "+n:n}}),i):i}},function(e,t,n){"use strict";var r=n(2);e.exports=r.isStandardBrowserEnv()?function(){function e(e){var t=e;return n&&(o.setAttribute("href",t),t=o.href),o.setAttribute("href",t),{href:o.href,protocol:o.protocol?o.protocol.replace(/:$/,""):"",host:o.host,search:o.search?o.search.replace(/^\?/,""):"",hash:o.hash?o.hash.replace(/^#/,""):"",hostname:o.hostname,port:o.port,pathname:"/"===o.pathname.charAt(0)?o.pathname:"/"+o.pathname}}var t,n=/(msie|trident)/i.test(navigator.userAgent),o=document.createElement("a");return t=e(window.location.href),function(n){var o=r.isString(n)?e(n):n;return o.protocol===t.protocol&&o.host===t.host}}():function(){return function(){return!0}}()},function(e,t,n){"use strict";var r=n(2);e.exports=r.isStandardBrowserEnv()?function(){return{write:function(e,t,n,o,s,i){var a=[];a.push(e+"="+encodeURIComponent(t)),r.isNumber(n)&&a.push("expires="+new Date(n).toGMTString()),r.isString(o)&&a.push("path="+o),r.isString(s)&&a.push("domain="+s),i===!0&&a.push("secure"),document.cookie=a.join("; ")},read:function(e){var t=document.cookie.match(new RegExp("(^|;\\s*)("+e+")=([^;]*)"));return t?decodeURIComponent(t[3]):null},remove:function(e){this.write(e,"",Date.now()-864e5)}}}():function(){return{write:function(){},read:function(){return null},remove:function(){}}}()},function(e,t){"use strict";e.exports=function(e){return/^([a-z][a-z\d\+\-\.]*:)?\/\//i.test(e)}},function(e,t){"use strict";e.exports=function(e,t){return t?e.replace(/\/+$/,"")+"/"+t.replace(/^\/+/,""):e}},function(e,t,n){"use strict";var r=n(2);e.exports=function(e,t){t=t||{};var n={};return r.forEach(["url","method","params","data"],function(e){"undefined"!=typeof t[e]&&(n[e]=t[e])}),r.forEach(["headers","auth","proxy"],function(o){r.isObject(t[o])?n[o]=r.deepMerge(e[o],t[o]):"undefined"!=typeof t[o]?n[o]=t[o]:r.isObject(e[o])?n[o]=r.deepMerge(e[o]):"undefined"!=typeof e[o]&&(n[o]=e[o])}),r.forEach(["baseURL","transformRequest","transformResponse","paramsSerializer","timeout","withCredentials","adapter","responseType","xsrfCookieName","xsrfHeaderName","onUploadProgress","onDownloadProgress","maxContentLength","validateStatus","maxRedirects","httpAgent","httpsAgent","cancelToken","socketPath"],function(r){"undefined"!=typeof t[r]?n[r]=t[r]:"undefined"!=typeof e[r]&&(n[r]=e[r])}),n}},function(e,t){"use strict";function n(e){this.message=e}n.prototype.toString=function(){return"Cancel"+(this.message?": "+this.message:"")},n.prototype.__CANCEL__=!0,e.exports=n},function(e,t,n){"use strict";function r(e){if("function"!=typeof e)throw new TypeError("executor must be a function.");var t;this.promise=new Promise(function(e){t=e});var n=this;e(function(e){n.reason||(n.reason=new o(e),t(n.reason))})}var o=n(23);r.prototype.throwIfRequested=function(){if(this.reason)throw this.reason},r.source=function(){var e,t=new r(function(t){e=t});return{token:t,cancel:e}},e.exports=r},function(e,t){"use strict";e.exports=function(e){return function(t){return e.apply(null,t)}}}])});
//# sourceMappingURL=axios.min.map;
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

define('tb',[],function() {
    return {
        tabs : tabs,
        tab : tab
    }
});
define('profile',['axios'],function(axios) {
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

;
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

define('error',[],function() {
    return error
})


;
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

define('modal',[],function() {
    return modal;
})



;
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

define('multiform',[],function() {
    return {
        multiform : multiform,
        formpart : formpart
    }
});
const carmakes = 
[[1,"Abarth"],[2,"Alfa Romeo"],[3,"Aston martin"],[4,"Audi"],[5,"Bentley"],[6,"BMW"],[7,"Bugatti"],[8,"Cadillac"],[9,"Chevrolet"],[10,"Chrysler"],[11,"Citroen"],[12,"Corvette"],[13,"Dacia"],[14,"Daewoo"],[15,"Daihatsu"],[16,"Daimler"],[17,"Datsun"],[18,"Dodge"],[19,"DS"],[20,"Ferrari"],[21,"Fiat"],[22,"Ford"],[23,"FSO"],[24,"Honda"],[25,"Hummer"],[26,"Hyundai"],[27,"Infiniti"],[28,"Innocenti"],[29,"Jaguar"],[30,"Jeep"],[31,"Kia"],[32,"Lamborghini"],[33,"Lancia"],[34,"Land Rover"],[35,"Landwind"],[36,"Lexus"],[37,"Lincoln"],[38,"Lotus"],[39,"Marcos"],[40,"Maserati"],[41,"Maybach"],[42,"Mazda"],[43,"McLaren"],[44,"Mega"],[45,"Mercedes"],[46,"Mercury"],[47,"MG"],[48,"Mini"],[49,"Mitsubishi"],[50,"Morgan"],[51,"Morris"],[52,"Nissan"],[53,"Noble"],[54,"Opel"],[55,"Peugeot"],[56,"PGO"],[57,"Pontiac"],[58,"Porche"],[59,"Renault"],[60,"Rolls-Royce"],[61,"Rover"],[62,"Saab"],[63,"Seat"],[64,"Skoda"],[65,"Smart"],[66,"Spectre"],[67,"Subaru"],[68,"Suzuki"],[69,"Talbot"],[70,"Tesla"],[71,"Think"],[72,"Toyota"],[73,"Triumph"],[74,"TVR"],[75,"Volkswagen"],[76,"Volvo"],[77,"Yugo"]]
define('util/carmakes',[],function() { return carmakes });
const carmodels = [[15,2,"164"],[16,2,"4C"],[17,2,"4C Spider"],[18,2,"8c Competizione"],[19,2,"8c Spider"],[20,2,"Guilia"],[21,2,"Spider"],[22,2,"Stelvio"],[23,3,"DB7"],[24,3,"DB9"],[25,3,"Vantage"],[26,3,"Vanquish"],[27,4,"A3"],[28,4,"A4"],[29,4,"A5"],[30,4,"A6"],[31,4,"A7"],[32,4,"A8"],[33,4,"Q3"],[34,4,"Q5"],[35,4,"Q7"],[36,4,"Q8"],[37,4,"Quattro"],[38,4,"R8"],[39,4,"RS 3"],[40,4,"RS 4"],[41,4,"RS 5"],[42,4,"RS 6"],[43,4,"RS 7"],[44,4,"S3"],[45,4,"S4"],[46,4,"S5"],[47,4,"S6"],[48,4,"S7"],[49,4,"S8"],[50,4,"TT"],[51,4,"TT RS"],[52,6,"1-series"],[53,6,"2-series"],[54,6,"3-series"],[55,6,"4-series"],[56,6,"5-series"],[57,6,"6-series"],[58,6,"7-series"],[59,6,"8-series"],[60,6,"M-series"],[61,6,"X-series"],[62,20,"348"],[63,20,"360 Modena"],[64,20,"360 Spider"],[65,20,"456 GT"],[66,20,"456 M"],[67,20,"458 Italia"],[68,20,"458 Spider"],[69,20,"488 Spider"],[70,20,"512 M"],[71,20,"512 TR"],[72,20,"550"],[73,20,"575 M"],[74,20,"599"],[75,20,"612 Scaglietti"],[76,20,"California"],[77,20,"Challenge Stradale"],[78,20,"Enzo"],[79,20,"F12berlinetta"],[80,20,"F355"],[81,20,"F40"],[82,20,"F430"],[83,20,"F50"],[84,20,"FF"],[85,20,"Mondial"],[86,20,"Testarossa"],[87,24,"Accord"],[88,24,"Civic"],[89,24,"Crosstaur"],[90,24,"Element"],[91,24,"Odyssey"],[92,24,"Pilot"],[93,24,"Prelude"],[94,36,"ES"],[95,36,"GS"],[96,36,"GX"],[97,36,"IS"],[98,36,"LC"],[99,36,"LFA"],[100,36,"LS"],[101,36,"LX"],[102,36,"NX"],[103,36,"RC"],[104,36,"RX"],[105,36,"SC"],[106,45,"190"],[107,45,"AMG"],[108,45,"B-Class"],[109,45,"C"],[110,45,"CL-Class"],[111,45,"CLA"],[112,45,"CLK"],[113,45,"CLS"],[114,45,"E"],[115,45,"G"],[116,45,"GL"],[117,45,"GLA"],[118,45,"GLC"],[119,45,"GLE"],[120,45,"GLK"],[121,45,"GLS"],[122,45,"M-Class"],[123,45,"Maybach"],[124,45,"R-Class"],[125,45,"S"],[126,45,"SL"],[127,45,"SLC"],[128,45,"SLK"],[129,45,"SLR"],[130,45,"SLS"],[131,45,"Sprinter"],[132,72,"4Runner"],[133,72,"86"],[134,72,"Avalon"],[135,72,"Camry"],[136,72,"Celica"],[137,72,"Corolla"],[138,72,"Cressida"],[139,72,"Highlander"],[140,72,"Land Cruzer"],[141,72,"Matrix"],[142,72,"Mirai"],[143,72,"MR2"],[144,72,"Pickup"],[145,72,"Previa"],[146,72,"Prius"],[147,72,"RAV4"],[148,72,"Sequioa"],[149,72,"Sienna"],[150,72,"Tacoma"],[151,72,"Tundra"],[152,72,"Venza"],[153,72,"Yaris"],[154,75,"Atlas"],[155,75,"Beetle"],[156,75,"Cabrio"],[157,75,"CC"],[158,75,"Corado"],[159,75,"Eurovan"],[160,75,"Fox"],[161,75,"GLI"],[162,75,"Golf"],[163,75,"Golf GTI"],[164,75,"GTI"],[165,75,"Jetta"],[166,75,"Passat"],[167,75,"Phaeton"],[168,75,"R32"],[169,75,"Tiguan"],[170,75,"Touareg"],[171,24,"CR-V"],[172,55,"Civic"],[173,5,"Mulsanne"]]
define('util/carmodels',[],function() { return carmodels });
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

define('sellcar',[],function() {
    return sellcar
});
const cart = {
    props:['cart'],
    template: `
        <tbody>
            <tr v-for="(car,i) in cart" class="cart_item">
                <td class="product-remove">
                    <a href="#" class="remove" title="Remove this item" data-product_id="22" data-product_sku="">×</a>
                </td>
                <td class="product-thumbnail">
                    <a href="#">
                        <img src="/BuySellCar/resources/client/images/_shop/small1.jpg" class="" alt="Kallyas Product" title="Kallyas Produc" style="height:80px;"/>
                    </a>
                </td>
                <td class="product-name">
                    <a href="#">{{car.make}} {{car.modelname}} {{car.typename}}</a>
                </td>
                <td class="product-price">
                    <span class="amount">NGN{{car.price}}</span>
                </td>
                
                <td class="product-subtotal">
                    <span class="amount">
                            {{car.price | currency}}
                    </span>
                </td>
            </tr>

            <tr>
                <td colspan="6" class="actions">
                    <div class="coupon">
                        <label for="coupon_code">Coupon:</label><input type="text" name="coupon_code" class="input-text" id="coupon_code" value="" placeholder="Coupon code"><input type="submit" class="button" name="apply_coupon" value="Apply Coupon"/>
                    </div>
                    <input type="submit" class="button" name="update_cart" value="Update Cart">
                    <input type="hidden" id="_wpnonce" name="_wpnonce" value="1b98fc7d5b"><input type="hidden" name="_wp_http_referer" value="/demo/cart/">
                </td>
            </tr>
        </tbody>
    `
}

define('shoppingcart',[],function() {
    return cart;
});
function searchInit() {
    var searchbtn = document.getElementById('searchsubmit')
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



//requirejs(['http://localhost:8084/BuySellCar/resources/js/ven/rqconfig.js'], function() {

    
//console.log(requirejs(['modal'], function(modal){return modal}))
    requirejs(['axios','tb','profile','error','modal','multiform','sellcar','shoppingcart'],
        function(axios,tb,profile,error,modal,multistep,sellcar,shoppingcart){
        
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
            template: `
                
//                    <button @click="$emit('cart-action', carid)">Buy Car</button>
                `,
        })

        Vue.component('profile', profile)
        Vue.component('tabs',tb.tabs)
        Vue.component('tab',tb.tab)
        Vue.component('error',error)
        Vue.component('sellcar',sellcar)
        Vue.component('modal',modal)
        Vue.component('multiform', multistep.multiform)
        Vue.component('formpart', multistep.formpart)
        Vue.component('shoppingcart', shoppingcart)

        Vue.component('shopitems', {
            //<modal v-if="showmodal" @close="showmodal = false"></modal>
            props:['cart'],
            template: 
                `
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
        }),
        Vue.filter('currency', function (value) {
          if (!value || isNaN(value)) return ''
          value = parseInt(value)
          let x, n = 0
          const re = '\\d(?=(\\d{' + (x || 3) + '})+' + (n > 0 ? '\\.' : '$') + ')'
          return 'NGN '+value.toFixed(Math.max(0, ~~n)).replace(new RegExp(re, 'g'), '$&,')
          // return '₦'+value.toFixed().replace(/\d(?=(\d{3})+\.)/g, '$&,').toString()
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
                    console.log('cart')
    //              this.count = this.cart.length
                })
                
                requirejs(['/BuySellCar/resources/js/ven/kl-scripts.js'])
                
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
                        this.cart.splice(i,1)
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
                            } else this.error.show = false
                            return this.error.show
                        case 'payment':
                            if(this.order.payment === null || this.order.payment === undefined || this.order.payment === '') {
                                this.error.show = true
                                this.error.message = 'Please select payment option!'
                            } else this.error.show = false
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
            computed:{
                totalVal() {
                    return this.cart.reduce((a,c) => a+c.price,0)
                }
            }
    //        components: {
    //            BuyAction
    //        }
        })
    })
//});
define("app", function(){});

