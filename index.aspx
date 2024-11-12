   <%@ Page Language="C#" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="Home" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Shree Radha Krishna Enterprises</title>
    <link rel="stylesheet" href="index.css">
</head>
<body>
    <form runat="server">
        <header>
            <h1>Shree Radha Krishna Enterprises</h1>
            <nav>
                <ul>
                    <li><a href="index.aspx">Home</a></li>
                    <li><a href="Categories.aspx">Categories</a></li>
                    <li><a href="About.aspx">About Us</a></li>
                </ul>
            </nav>
        </header>

        <main>
            <!-- Slideshow Section -->
            <div class="slideshow-container">
                <div class="mySlides">
                    <img src="photu/Cust_img2.jpg" class="slide-img">
                    <div class="text">Elegant Multipurpose Boxes</div>
                </div>
                <div class="mySlides">
                    <img src="photu/Cust_img3.jpg" class="slide-img">
                    <div class="text">Aesthetic Pastry Boxes</div>
                </div>
                <div class="mySlides">
                    <img src="photu/Cust_img4.jpg" class="slide-img">
                    <div class="text">Durable Pizza Boxes</div>
                </div>
                <!-- Dots for navigation -->
                <div style="text-align:center">
                    <span class="dot" onclick="currentSlide(1)"></span> 
                    <span class="dot" onclick="currentSlide(2)"></span> 
                    <span class="dot" onclick="currentSlide(3)"></span> 
                </div>
            </div>

            <!-- Box Categories Section -->
            <section class="box-collection">
                <h2>Our Box Collection</h2>
                <div class="box-container">
                    <div class="box category">
                        <img src="photu/Pastry.jpg" alt="Pastry Boxes"/>
                        <p>High-quality pastry boxes to keep your pastries fresh and delicious.</p>
                        <asp:Button ID="Button1" runat="server" Text="View Categories" OnClick="Button1_Click1" />
                    </div>
                    <div class="box category">
                        <img src="photu/Sweet.jpg" alt="Sweet Boxes"/>
                        <p>Elegant sweet boxes for gifting and special occasions.</p>
                        <asp:Button ID="Button2" runat="server" Text="View Categories" OnClick="Button1_Click1" />
                    </div>
                    <div class="box category">
                        <img src="photu/Cake.jpg" alt="Cake Boxes"/>
                        <p>Sturdy cake boxes to ensure safe delivery of your cakes.</p>
                        <asp:Button ID="Button3" runat="server" Text="View Categories" OnClick="Button1_Click1" />
                    </div>
                </div>
            </section>
        </main>

        <footer>
            <p>Contact Us: 244/2 Chak Zero Road, Prayagraj, Uttar Pradesh | Mobile: 1234567890, 0987654321</p>
        </footer>
    </form>

    <!-- JavaScript for Slideshow -->
    <script>
        let slideIndex = 1;
        showSlides(slideIndex);

        // Automatically change slides every 2 seconds
        setInterval(function () {
            plusSlides(1);
        }, 2000); // 2000 milliseconds = 2 seconds

        function plusSlides(n) {
            showSlides(slideIndex += n);
        }

        function currentSlide(n) {
            showSlides(slideIndex = n);
        }

        function showSlides(n) {
            let i;
            let slides = document.getElementsByClassName("mySlides");
            let dots = document.getElementsByClassName("dot");
            if (n > slides.length) { slideIndex = 1 }
            if (n < 1) { slideIndex = slides.length }
            for (i = 0; i < slides.length; i++) {
                slides[i].style.display = "none";
            }
            for (i = 0; i < dots.length; i++) {
                dots[i].className = dots[i].className.replace(" active", "");
            }
            slides[slideIndex - 1].style.display = "block";
            dots[slideIndex - 1].className += " active";
        }
    </script>
</body>
</html>
