<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<c:if test="${empty sessionScope.modelname or empty sessionScope.carname}">
    <% response.sendRedirect(getServletContext().getContextPath()+"/mg/cars"); %>
</c:if>
<t:admintag>
    <jsp:body>
        <div>
            <div>
                <h1>New ${sessionScope.modelname} Car</h1>
            </div>
            <c:url value="/mg/carmodel/new" var="actionForm"/>
            <form:form class="form" method="post" action="${actionForm}" modelAttribute="newcarmodel">
                <form:hidden path="id"/>
                <div>
                    <label>${sessionScope.modelname} Name: </label>
                    <form:input path="name"/>
                </div>
                <div>
                    <label>Price: </label>
                    <form:input path="price"/>
                </div>
                <div>
                    <label>Year: </label>
                    <form:input path="year"/>
                </div>
                <div>
                    <form:radiobutton path="newused" value="new"/>New
                    <form:radiobutton path="newused" value="used"/>Used
                </div>
                <div>
                    <label>Mileage: </label>
                    <form:input path="mileage"/>
                </div>
                <div>
                    <label>Engine: </label>
                    <form:input path="engine"/>
                </div>
                <div>
                    <label>Transmission: </label>
                    <form:select path="transmission">
                        <option selected disabled>--Choose transmission--</option>
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
                    </form:select>
                </div>
                <div>
                    <label>Drive Train: </label>
                    <form:select path="drivetrain">
                        <option selected disabled>--Choose drive train--</option>
                        <option>AWD</option>
                        <option>FWD</option>
                        <option>RWD</option>
                    </form:select>
                </div>
                <div>
                    <label>Fuel Type: </label>
                    <form:select path="fueltype">
                        <option selected disabled>--Choose fuel type--</option>
                        <option>Gasoline</option>
                        <option>Diesel</option>
                    </form:select>
                </div>
                <div>
                    <label>Car Type: </label>
                    <form:select path="cartype">
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
                    </form:select>
                </div>
                <div>
                    <label>Passenger count: </label>
                    <form:input path="psng_count" />
                </div>
                <div>
                    <label>Interior color: </label>
                    <form:input path="interior_color" />
                </div>
                <div>
                    <label>Exterior color: </label>
                    <form:input path="exterior_color" />
                </div>
                <div>
                    <label>Status: </label>
                    <form:radiobutton path="status" value="approved"/>Approved
                    <form:radiobutton path="status" value="pending"/>Pending
                </div>
                <div>
                    <input type="submit" value="Submit" />
                </div>
            </form:form>
        </div>
    </jsp:body>
</t:admintag>
