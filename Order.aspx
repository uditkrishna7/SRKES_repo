<%@ Page Language="C#" AutoEventWireup="true" Debug="true" CodeFile="Order.aspx.cs" Inherits="Order" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Order Page</title>
    <link rel="stylesheet" type="text/css" href="Order.css"/>
    <script>
        function showFlashMessage(message) {
            const flashMessage = document.getElementById("flashMessage");
            flashMessage.innerHTML = message;
            flashMessage.style.display = "block";
        }
        function updatePaymentOption() {
            var paymentMode = document.getElementById('<%= ddlPaymentMode.ClientID %>').value;
            var transactionIdDiv = document.getElementById("transactionIdDiv");
            var qrCodeDiv = document.getElementById("qrCodeDiv");

            if (paymentMode === "Online Payment") {
                transactionIdDiv.style.display = "block";
                qrCodeDiv.style.display = "block";
            } else {
                transactionIdDiv.style.display = "none";
                qrCodeDiv.style.display = "none";
            }
        }
        function setDeliveryDate() {
            var today = new Date();
            today.setDate(today.getDate() + 10);
            var formattedDate = today.toISOString().split("T")[0];
            document.getElementById('<%= txtDeliveryDate.ClientID %>').value = formattedDate;
        }
       <%-- function updateCost() {
            var boxType = document.getElementById('<%= ddlBoxType.ClientID %>').value;
            var boxSize = document.getElementById('<%= ddlBoxSize.ClientID %>').value;
            var quantity = document.getElementById('<%= txtQuantity.ClientID %>').value;
            if (quantity >= 100) {
                __doPostBack('<%= txtCost.ClientID %>', '');
            }
        }--%>
    </script>
</head>
<body>
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
        <form id="form1" runat="server">
            <h2>Place Your Order</h2>
            <label for="ddlBoxType">Select Box Type:</label>
            <asp:DropDownList ID="ddlBoxType" runat="server" OnSelectedIndexChanged="ddlBoxType_SelectedIndexChanged" AutoPostBack="True">
                <asp:ListItem Value="Pastry Box">Pastry Box</asp:ListItem>
                <asp:ListItem Value="Cake Box">Cake Box</asp:ListItem>
                <asp:ListItem Value="Sweet Box">Sweet Box</asp:ListItem>
                <asp:ListItem Value="Pizza Box">Pizza Box</asp:ListItem>
                <asp:ListItem Value="Gift Box">Gift Box</asp:ListItem>
            </asp:DropDownList>
            <br />

            <label for="ddlBoxSize">Enter Size:</label>
            <asp:DropDownList ID="ddlBoxSize" runat="server">
                <asp:ListItem>Depends on box type</asp:ListItem>
                <asp:ListItem>Small(250gm)</asp:ListItem>
                <asp:ListItem>Medium(500gm)</asp:ListItem>
                <asp:ListItem>Large(1kg)</asp:ListItem>
                <asp:ListItem>For Custom Dimensions, add in the customer notes</asp:ListItem>
            </asp:DropDownList>
            <br />

            <label for="boxColour">Select Box Color:</label>
            <asp:DropDownList ID="boxColour" runat="server">
                <asp:ListItem Value="WHITE">WHITE</asp:ListItem>
                <asp:ListItem Value="BLACK">BLACK</asp:ListItem>
                <asp:ListItem Value="BROWN">BROWN</asp:ListItem>
                <asp:ListItem Value="SILVER">SILVER</asp:ListItem>
                <asp:ListItem Value="GOLD">GOLD</asp:ListItem>
            </asp:DropDownList>
            <br />

            <label for="txtQuantity">Enter Quantity:</label>
            <asp:TextBox type="number" ID="txtQuantity" runat="server" TextMode="Number" placeholder="Minimum 100." OnChange="updateCost()"/>
            <br />

            <label for="txtCustomerName">Your Name:</label>
            <asp:TextBox Type="text" ID="txtCustomerName" runat="server" placeholder="Enter your name"/>
            <br />

            <label for="txtCustomerAddress">Delivery Address:</label>
            <asp:TextBox ID="txtCustomerAddress" runat="server" TextMode="MultiLine" placeholder="Enter your full address" />
            <br />

            <label for="txtCustomerContact">Contact Number:</label>
            <asp:TextBox type="number" ID="txtCustomerContact" runat="server" placeholder="Mobile number" />
            <br />

            <label for="ddlPaymentMode">Mode of Payment:</label>
            <asp:DropDownList ID="ddlPaymentMode" runat="server" OnChange="updatePaymentOption()">
                <asp:ListItem Value="Cash on Delivery">Cash on Delivery</asp:ListItem>
                <asp:ListItem Value="Online Payment">Online Payment</asp:ListItem>
            </asp:DropDownList>
            <br />

            <div id="transactionIdDiv" style="display:none;">
                <label for="txtTransactionId">Enter Transaction Id:</label>
                <asp:TextBox type="number" ID="txtTransactionId" runat="server" placeholder="Enter if you are paying online" />
            </div>

            <div id="qrCodeDiv" style="display:none;">
                <label>Scan this QR Code for Payment:</label>
                <img src="photu/paymentqr.jpg" alt="QR Code"  style="width: 150px; height: 150px;" />
            </div>

            <label for="txtCustomerNotes">Customer Notes:</label>
            <asp:TextBox ID="txtCustomerNotes" runat="server" TextMode="MultiLine" placeholder="Note" />
            <br />
            <asp:Button ID="Button2" runat="server" 
                Text="Calculate Cost" OnClick="Button2_Click" />
            <!-- Cost Calculation (Add a placeholder for cost) -->
            <label for="txtCost">Total Cost:</label>
            <asp:TextBox ID="txtCost" runat="server" ReadOnly="false" />
            <br />
            <label for="txtCost">Todays Date:</label>
            <asp:TextBox ID="txtOrderDate" runat="server" TextMode="Date" ReadOnly="true" />

           
            <!-- Set Delivery Date -->
            <label for="txtDeliveryDate">Delivery Date:</label>
            <asp:TextBox ID="txtDeliveryDate" runat="server" TextMode="Date" ReadOnly="true" />
            <br />

            <asp:Button ID="btnSubmit" runat="server" Text="Submit Order" OnClick="btnSubmit_Click" />
            <br />
            <asp:Button ID="Button1" runat="server" Text="View Order as Admin" OnClick="Button1_Click" />
            <div id="flashMessage" class="flash-message"></div>
        </form>
    </main>
    <footer>
        <p>Contact Us: 244/2 Chak Zero Road, Prayagraj, Uttar Pradesh | Mobile: 1234567890, 0987654321</p>
    </footer>

    <script>
        window.onload = function () {
            setDeliveryDate();
        };
    </script>
</body>
</html>
