<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<t:mgtag>
    <jsp:body>
        <h1>${sessionScope.make} New Model</h1>
        <div id="modelform">
            <form:form class="form" method="post" action="${pageContext.request.contextPath}/mg/model/new" modelAttribute="models">
                <button @click.prevent="addModel">More +</button>
                <div v-for="(models,i) in nameOfModels" :key="'model'+i">
                    <label>Model name:</label>
                    <form:input path="name" v-model="models.name"/>
                    <button @click.prevent="removeModel(i)" style="color:red;">x</button>
                </div>
                <!--<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>--> 
                <input type="submit" value="Create"/>
            </form:form>
        </div>
        
        <script src="${pageContext.request.contextPath}/resources/js/vue.min.js"></script>
        <script>
            new Vue({
                el:'#modelform',
                data: {
                    nameOfModels: [{name:''}]
                },
                methods: {
                    addModel() {
                        if(this.nameOfModels.length < 10)
                            this.nameOfModels.push({name:''})
                    },
                    removeModel(i) {
                        if(this.nameOfModels.length > 1)
                            this.nameOfModels.pop(i)
                    }
                }
            })
        </script>
    </jsp:body>
</t:mgtag>

