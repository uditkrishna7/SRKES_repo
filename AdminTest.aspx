
<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AdminTest.aspx.cs" Inherits="AdminPanel" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="Admin.css" />
    <style>
        /* Global Styles */
        body {
            font-family: 'Arial', sans-serif;
            background-color: #D3EE98; /* Light Green */
            color: #333; /* Dark Gray */
            margin: 0;
            padding: 0;
        }

        /* Header Styles */
        .header {
            background-color: #72BF78; /* Medium Green */
            color: white;
            padding: 20px;
            text-align: center;
        }

        .header h1 {
            margin: 0;
            font-size: 2.5rem;
        }

        /* Navigation Styles */
        .navbar {
            background-color: #72BF78; /* Medium Green */
            display: flex;
            justify-content: center;
            padding: 10px;
        }

        .navbar a {
            color: white;
            text-decoration: none;
            font-size: 1.2rem;
            margin: 0 15px;
            transition: color 0.3s ease;
        }

        .navbar a:hover {
            color: #FEFF9F; /* Light Yellow */
        }

        /* Admin Container and GridView Styling */
        .admin-container {
            padding: 20px;
        }

        #AdminGridView {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            overflow-x: auto;
            display: block;
        }

        #AdminGridView th {
            background-color: #72BF78; /* Medium Green */
            color: white;
            padding: 12px;
            text-align: left;
        }

        #AdminGridView td {
            padding: 12px;
            border: 1px solid #ddd;
            text-align: left;
            color: #333;
        }

        #AdminGridView tr:nth-child(even) td {
            background-color: #A0D683; /* Muted Green */
        }

        #AdminGridView tr:hover td {
            background-color: #FEFF9F; /* Light Yellow */
        }

        /* Button Styling */
        button, input[type="submit"], input[type="button"] {
            background-color: #72BF78; /* Medium Green */
            color: white;
            padding: 10px 20px;
            border: none;
            cursor: pointer;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }

        button:hover, input[type="submit"]:hover {
            background-color: #FEFF9F; /* Light Yellow */
        }

        /* Footer Styles */
        .footer {
            background-color: #72BF78; /* Medium Green */
            color: white;
            text-align: center;
            padding: 20px;
            position: relative;
            bottom: 0;
            width: 100%;
        }

        .footer p {
            margin: 0;
            font-size: 1rem;
        }

        /* Mobile Responsiveness */
        @media (max-width: 768px) {
            .navbar a {
                display: block;
                margin: 10px 0;
            }
        }

        .login {
            width: 100%;
            text-align: center;
            margin-top: 50px;
        }

        .login label, .login input, .login button {
            display: block;
            margin: 10px auto;
            text-align: center;
        }

        .login input {
            padding: 10px;
            width: 200px;
            border: 1px solid #ddd;
            border-radius: 5px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <!-- Header Section -->
        <div class="header">
            <h1>Admin Panel</h1>
        </div>

        <!-- Navigation Bar -->
        <div class="navbar">
            <a href="index.aspx">Home</a>
            <a href="Order.aspx">Orders</a>
        </div>

        <!-- Login Section -->
        <div class="login">
            <asp:Label ID="Label1" runat="server" Text="Enter Your Name:"></asp:Label>
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            <asp:Label ID="Label2" runat="server" Text="Enter the Password:"></asp:Label>
            <asp:TextBox ID="TextBox2" runat="server" TextMode="Password"></asp:TextBox>
            <asp:Button ID="Button1" runat="server" Text="View Orders" OnClick="Button1_Click" />
              <asp:Label ID="ErrorMessage" runat="server" ForeColor="Red" Visible="False"></asp:Label>
        </div>

        <!-- Admin GridView Section -->
        <div class="admin-container">
            <asp:GridView ID="AdminGridView" runat="server" AutoGenerateColumns="true" Visible="False" />
        </div>

        <!-- Footer Section -->
        <div class="footer">
            <p>&copy; 2024 Shree Radha Krishna Enterprises</p>
        </div>
    </form>
</body>
</html>
