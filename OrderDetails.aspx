<%@ Page Language="C#" AutoEventWireup="true" CodeFile="OrderDetails.aspx.cs" Inherits="OrderDetails" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <title>Order Details</title>
    <link rel="stylesheet" type="text/css" href="Admin.css"/>
</head>
<body>
    <form id="form1" runat="server">
        <header>
            <h1>Shree Radha Krishna Enterprises - Order Details</h1>
            <nav>
                <ul>
                    <li><a href="Admin.aspx">Back to Orders</a></li>
                </ul>
            </nav>
        </header>

        <main>
            <h2>Order Information</h2>
            <asp:Panel ID="pnlOrderDetails" runat="server" CssClass="order-details">
                <asp:Label ID="lblOrderID" runat="server" Text=""></asp:Label><br />
                <asp:Label ID="lblCustomerName" runat="server" Text=""></asp:Label><br />
                <asp:Label ID="lblBoxType" runat="server" Text=""></asp:Label><br />
                <asp:Label ID="lblQuantity" runat="server" Text=""></asp:Label><br />
                <asp:Label ID="lblDeliveryDate" runat="server" Text=""></asp:Label><br />
                <asp:Label ID="lblPaymentMode" runat="server" Text=""></asp:Label><br />
                <asp:Label ID="lblTransactionID" runat="server" Text=""></asp:Label><br />
            </asp:Panel>
        </main>

        <footer>
            <p>Contact Us: 244/2 Chak Zero Road, Prayagraj, Uttar Pradesh | Mobile: 1234567890, 0987654321</p>
        </footer>
    </form>
</body>
</html>
