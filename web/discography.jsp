<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<html>
    
    
    <head>
        <!--bootstrap icons-->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
        <!--bootstrap style sheet links-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
               
        <!--link for custom style sheet-->
        <link rel="stylesheet" href="style.css">
        
        
        <title>Gorillaz - Discography</title>
        
    </head>
    
    
    <body>
        <h1 id="disco" class="center-heading">Discography</h1>
        
        <nav class="navbar navbar-expand-lg bg-body-tertiary">
            <div class="container-fluid">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a href="index.jsp" class="nav-link"><span><i class="bi bi-house-heart">home</i></span></a>
                    </li>
                    <li class="nav-item">
                        <a href="signup.jsp" class="nav-link"><span><i class="bi bi-file-diff">sign up</i></span></a>
                    </li>
                    <li class="nav-item">
                        <a href="discography.jsp" class="nav-link"><span><i class="bi bi-vinyl">discography</i></span></a>
                    </li>
                    <li class="nav-item">
                        <a href="gallery.jsp" class="nav-link"><span><i class="bi bi-image-alt">gallery</i></span></a>
                    </li>
                </ul>
            </div>


        <div class="grid-container">

            <%
                try
                {
                

                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gorillaz", "root", "admin");
                    
                    
                    String query = "SELECT * FROM discography";
                    
                    PreparedStatement stmt = con.prepareStatement(query);

                    ResultSet rs = stmt.executeQuery();
                    

                    while (rs.next())
                    {

            %>
            <!--album cover grid using jdbc and while loop to iterate through-->
            <div class="grid-item">
                <div class="image-container">
                <img src="<%=rs.getString("AlbumCover")%>" class="cover" alt="gorillaz album cover">
                </div>
                <div class="text-container">
                <h5><%=rs.getString("Title")%></h5>
                <h6><%=rs.getString("Year")%></h6>
                </div>
            </div>
            
            <%
                }//close while loop

                    con.close();

                } catch (Exception e) {

                    e.printStackTrace();
                }//close try catch
            %>
        </div>
    </body>
</html>
