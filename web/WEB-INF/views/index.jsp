<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%--<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>--%>

<t:wrapper>
    <jsp:body>
        <h1>Sell Your Cars</h1>
        <h1>Buy Amazing Cars</h1>
        
        <div class="searchbar">
            <div class="search-container">
                <label><b><em>Search:</em></b></label>
                <input style="width:100%;" type="text" id="searchtext" name="search"/>
                <button id="search">Search</button>
            </div>
        </div>
        
        <script>
            var searchbtn = document.getElementById('search')
            var text = document.getElementById('searchtext')
            searchbtn.onclick = searchQuery
            text.onkeypress = function(e) {
                if(e.keyCode == 13)
                    searchQuery()
            }
            
            function searchQuery() {
                
                if(text.value !== '' && text.value !== null) {
                    console.log('sent')
                    window.location.href = 'http://localhost:8084/BuySellCar/searchquery?q='+text.value
                }
            }
        </script>
    </jsp:body>
</t:wrapper>
