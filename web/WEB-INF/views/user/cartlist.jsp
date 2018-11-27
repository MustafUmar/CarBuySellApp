<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<t:usertag>
    <jsp:body>
        <h1>Cart List</h1>
        <shopitems :cart="cart" @remove_item="removeFromCart" @clear_all="removeAll"></shopitems>        
    </jsp:body>
</t:usertag>
