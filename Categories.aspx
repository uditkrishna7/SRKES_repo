<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Categories.aspx.cs"
    Inherits="Categories" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="Categories.css" />
    <title>Categories</title>

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
            <section>
                <h2>Pastry Boxes</h2>
                <div class="category">
                    <img src="photu/Pastry.jpg" alt="Pastry Box"/>
                    <p>Available Dimensions: 6x6x3, 8x8x4, 10x10x5</p>

                    <p>Available Colors: Red, Blue, White</p>
                    <asp:Button ID="Button1" runat="server" 
                        Text="Order Now" OnClick="Button1_Click1" />
                </div>
            </section>

            <section>
                <h2>Sweet Boxes</h2>
                <div class="category">
                    &nbsp;&nbsp;&nbsp;
                    <img src="photu/Sweet.jpg" alt="Sweet Box"/>

                    <p>Available Dimensions: 5x5x2, 7x7x3, 9x9x4</p>
                    <p>Available Colors: Gold, Silver, Maroon</p>
                   <asp:Button ID="Button2" runat="server" 
    Text="Order Now" OnClick="Button2_Click" />
                </div>
            </section>

            <section>
                <h2>Cake Boxes</h2>
                <div class="category">
                    <img src="photu/Cake.jpg" alt="Cake Box" />
                    <br />
                    <p>Available Dimensions: 8x8x5, 10x10x6, 12x12x7</p>
                    <p>Available Colors: White, Black, Pink</p>
                                   <asp:Button ID="Button3" runat="server" 
Text="Order Now" OnClick="Button3_Click"  />
                </div>
            </section>
        </main>
        <footer>
            <p>Contact Us: 244/2 Chak Zero Road, Prayagraj, Uttar
                Pradesh | Mobile: 1234567890, 0987654321</p>
        </footer>
    </body>

    </form>
</html>
