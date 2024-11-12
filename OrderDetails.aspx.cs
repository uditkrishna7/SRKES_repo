using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class OrderDetails : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string orderId = Request.QueryString["OrderID"];
            if (!string.IsNullOrEmpty(orderId))
            {
                LoadOrderDetails(orderId);
            }
        }
    }

    private void LoadOrderDetails(string orderId)
    {
        string connStr = ConfigurationManager.ConnectionStrings["OrderDBConnectionString"].ConnectionString;

        using (SqlConnection conn = new SqlConnection(connStr))
        {
            SqlCommand cmd = new SqlCommand("SELECT OrderID, CustomerName, BoxType, Quantity, DeliveryDate, PaymentMode, TransactionID FROM Orders WHERE OrderID = @OrderID", conn);
            cmd.Parameters.AddWithValue("@OrderID", orderId);

            conn.Open();
            SqlDataReader reader = cmd.ExecuteReader();

            if (reader.Read())
            {
                lblOrderID.Text = "Order ID: " + reader["OrderID"].ToString();
                lblCustomerName.Text = "Customer Name: " + reader["CustomerName"].ToString();
                lblBoxType.Text = "Box Type: " + reader["BoxType"].ToString();
                lblQuantity.Text = "Quantity: " + reader["Quantity"].ToString();
                lblDeliveryDate.Text = "Delivery Date: " + Convert.ToDateTime(reader["DeliveryDate"]).ToString("dd-MM-yyyy");
                lblPaymentMode.Text = "Payment Mode: " + reader["PaymentMode"].ToString();
                lblTransactionID.Text = "Transaction ID: " + reader["TransactionID"].ToString();
            }
            conn.Close();
        }
    }
}
