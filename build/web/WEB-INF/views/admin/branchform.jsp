<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<t:wrapper>
    <jsp:body>
        <div>
            <div>
                <h1>New Branch</h1>
            </div>
            <form:form class="form" method="post" action="" modelAttribute="branch">
                <form:hidden path="id"/>
                <div>
                    <label>Branch Name:</label>
                    <form:input path="name"/>
                </div>
                <div>
                    <label>Address:</label>
                    <form:input path="address"/>
                </div>
                <div>
                    <input type="submit" value="Submit" />
                </div>
            </form:form>
        </div>
    </jsp:body>
</t:wrapper>
