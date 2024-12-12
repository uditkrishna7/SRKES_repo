using System;
using System.Data.SqlClient;
using System.Web.UI;

public partial class Order : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        txtDeliveryDate.Attributes["min"] = DateTime.Now.AddDays(10).ToString("yyyy-MM-dd");

        if (!IsPostBack)
        {
            //UpdateTotalCost();
            txtOrderDate.Text = DateTime.Now.ToString("yyyy-MM-dd");
        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        string boxType = ddlBoxType.SelectedValue;
        string size = ddlBoxSize.SelectedValue;
        string color = boxColour.SelectedValue;
        int quantity;

        if (!int.TryParse(txtQuantity.Text, out quantity) || quantity < 100)
        {
            Response.Write("<script>alert('Please enter a valid quantity (at least 100).');</script>");
            return;
        }

        string customerName = txtCustomerName.Text;
        string customerAddress = txtCustomerAddress.Text;
        string customerContact = txtCustomerContact.Text;
        string paymentMode = ddlPaymentMode.SelectedValue;
        string transactionId = txtTransactionId.Text;
        string customerNotes = txtCustomerNotes.Text;
        decimal totalCost;
       string orderDate= txtOrderDate.Text;
        decimal.TryParse(txtCost.Text, out totalCost);
        string deliveryDate = txtDeliveryDate.Text;

        string connectionString = @"Data Source=UDIT\\SQLEXPRESS;Initial Catalog=OrderDB;Integrated Security=True;Encrypt=False";
        string query = "INSERT INTO Orders (BoxType, BoxSize, BoxColor, Quantity, CustomerName, CustomerAddress, CustomerContact, PaymentMode, TransactionId, CustomerNotes, TotalCost, DeliveryDate, OrderDAte) " +
                       "VALUES (@BoxType, @BoxSize, @BoxColor, @Quantity, @CustomerName, @CustomerAddress, @CustomerContact, @PaymentMode, @TransactionId, @CustomerNotes, @TotalCost, @DeliveryDate, @OrderDate)";
       
        using (SqlConnection conn = new SqlConnection(connectionString))
        {
            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@BoxType", boxType);
            cmd.Parameters.AddWithValue("@BoxSize", size);
            cmd.Parameters.AddWithValue("@BoxColor", color);
            cmd.Parameters.AddWithValue("@Quantity", quantity);
            cmd.Parameters.AddWithValue("@CustomerName", customerName);
            cmd.Parameters.AddWithValue("@CustomerAddress", customerAddress);
            cmd.Parameters.AddWithValue("@CustomerContact", customerContact);
            cmd.Parameters.AddWithValue("@DeliveryDate", deliveryDate);
            cmd.Parameters.AddWithValue("@PaymentMode", paymentMode);
            cmd.Parameters.AddWithValue("@TransactionId", transactionId);
            cmd.Parameters.AddWithValue("@CustomerNote", customerNotes);
            cmd.Parameters.AddWithValue("@TotalCost", totalCost);
            cmd.Parameters.AddWithValue("@OrderDate",orderDate);


            try
            {
                conn.Open();

                cmd.ExecuteNonQuery();
                showFlashMessage("Order submitted successfully.");
            }
            catch (Exception ex)
            {
                Response.Write("Error submitting order: " +ex.Message);
            }
        }
    }

    protected void UpdateTotalCost()
    {

        decimal totalCost = 0;
        string boxType = ddlBoxType.SelectedValue;
        string size = ddlBoxSize.SelectedValue;
        int quantity;

        // Ensure the quantity is valid (at least 100)
        if (!int.TryParse(txtQuantity.Text, out quantity) || quantity < 100)
        {
            // Provide an alert if the quantity is invalid
            Response.Write("Please enter a valid quantity (at least 100).')");

        }

        // Determine the base cost based on the selected box type
        if (boxType == "Pastry Box")
        {
            totalCost = 2.4m;
        }
        else if (boxType == "Cake Box")
        {
            totalCost = 5.6m;
        }
        else if (boxType == "Sweet Box")
        {
            totalCost = 3.9m;
        }
        else if (boxType == "Pizza Box")
        {
            totalCost = 6;
        }
        else if (boxType == "Gift Box")
        {
            totalCost = 8;
        }

        // Adjust the cost based on the selected size
        if (size == "Small")
        {
            totalCost *= 1.2m;
        }
        else if (size == "Medium")
        {
            totalCost *= 1.5M;
        }
        else if (size == "Large")
        {
            totalCost *= 2;
        }

        // Update the total cost based on the quantity
        totalCost *= quantity;

        // Set the total cost text
        txtCost.Text = totalCost.ToString();
    }
    protected void ddlBoxType_SelectedIndexChanged(object sender, EventArgs e)
    {
        // Logic for handling the change in Box Type selection
        // For example, you might update the box size options or calculate an estimated cost
        UpdateTotalCost();
    }

    private void showFlashMessage(string message)
    {
        // Use a client-side script to show a flash message
        string script = "showFlashMessage('" + message + "');";
        ScriptManager.RegisterStartupScript(this, GetType(), "showFlashMessage", script, true);
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("AdminTest.aspx");
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        //    string box_type = ddlBoxType.SelectedValue;
        //    string Size = ddlBoxSize.SelectedValue;
        //    if (box_type =="Pastry Box")
        //    {
        //        if (Size == "Small")
        //        {
        //            txtCost.Text = "560Rs"; 
        //        }
        //    }
        //txtCost.Text = "Hello";
        UpdateTotalCost();
    }

}


