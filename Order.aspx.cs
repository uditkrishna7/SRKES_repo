//using System;
//using System.Web.UI;

//public partial class Order : Page
//{
//    protected void Page_Load(object sender, EventArgs e)
//    {
//        // Ensures that delivery date is at least 10 days from today
//        txtDeliveryDate.Attributes["min"] = DateTime.Now.AddDays(10).ToString("yyyy-MM-dd");

//        if (!IsPostBack)
//        {
//            // Initial cost calculation
//            UpdateTotalCost();
//        }
//    }
//    protected void btnSubmit_Click(object sender, EventArgs e)
//    {
//        string boxType = ddlBoxType.SelectedValue;
//        string size = ddlBoxSize.SelectedValue;
//        string color = boxColour.SelectedValue;
//        int quantity;

//        if (!int.TryParse(txtQuantity.Text, out quantity) || quantity < 100)
//        {
//            // Show an error message if quantity is less than 100
//            Response.Write("<script>alert('Please enter a valid quantity (at least 100).');</script>");
//            return;
//        }

//        string customerName = txtCustomerName.Text;
//        string customerAddress = txtCustomerAddress.Text;
//        string customerContact = txtCustomerContact.Text;
//        string customerNotes = txtCustomerNotes.Text;
//        string paymentMode = ddlPaymentMode.SelectedValue;

//        // Handle payment processing
//        string paymentStatus = (paymentMode == "Online Payment" && string.IsNullOrEmpty(txtTransactionId.Text))
//            ? "Pending"
//            : "Confirmed";

//        // Assuming you save this order to a database or send an email (simplified here)
//        Response.Write("<script>alert('Order submitted successfully for " + customerName + " with total cost: " + txtCost.Text + "');</script>");

//    }

//    protected void Button1_Click(object sender, EventArgs e)
//    {
//        // Admin functionality for viewing orders
//        Response.Redirect("AdminTest.aspx");
//    }

//    protected void ddlBoxType_SelectedIndexChanged(object sender, EventArgs e)
//    {
//        // Update cost calculation based on selected box type
//        UpdateTotalCost();
//    }
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
            UpdateTotalCost();
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
        decimal.TryParse(txtCost.Text, out totalCost);
        string deliveryDate = txtDeliveryDate.Text;
//Is line mei kuch dikkat aa rahi hai, yaa to database se match nahi ho raha ya fir pata nahi kya hora hai, order button pe click krne pe instance failure dikha raha
        string connectionString = @"Data Source=UDIT\\SQLEXPRESS;Initial Catalog=OrderDB;Integrated Security=True;Encrypt=False";
        string query = "INSERT INTO Orders (BoxType, BoxSize, BoxColor, Quantity, CustomerName, CustomerAddress, CustomerContact, PaymentMode, TransactionId, CustomerNotes, TotalCost, DeliveryDate) " +
                       "VALUES (@BoxType, @BoxSize, @BoxColor, @Quantity, @CustomerName, @CustomerAddress, @CustomerContact, @PaymentMode, @TransactionId, @CustomerNotes, @TotalCost, @DeliveryDate)";

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
            cmd.Parameters.AddWithValue("@PaymentMode", paymentMode);
            cmd.Parameters.AddWithValue("@TransactionId", transactionId);
            cmd.Parameters.AddWithValue("@CustomerNotes", customerNotes);
            cmd.Parameters.AddWithValue("@TotalCost", totalCost);
            cmd.Parameters.AddWithValue("@DeliveryDate", deliveryDate);

            try
            {
                conn.Open();
                cmd.ExecuteNonQuery();
                showFlashMessage("Order submitted successfully.");
            }
            catch (Exception ex)
            {
                showFlashMessage("Error submitting order: " + ex.Message);
            }
        }
    }

    private void UpdateTotalCost()
    {
        // Logic to calculate total cost based on quantity and box type.
        decimal totalCost = 0;
        string boxType = ddlBoxType.SelectedValue;
        int quantity;
           if (!int.TryParse(txtQuantity.Text, out quantity) || quantity < 100)
             {
                Console.WriteLine("Please enter a valid quantity of 100 or more."); 

             }
        if (boxType == "Pastry Box")
                   {
                    totalCost = 20;
                   }
        txtCost.Text = (totalCost * quantity).ToString("");

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
}

//private void UpdateTotalCost()
//    {
//        decimal totalCost = 0;
//        string boxType = ddlBoxType.SelectedValue;
//        string size = ddlBoxSize.SelectedValue;
//        int quantity;
//        if (!int.TryParse(txtQuantity.Text, out quantity) || quantity < 100)
//        {
//            Console.WriteLine("Please enter a valid quantity of 100 or more."); 
            
//        }


//        if (boxType == "Pastry Box")
//        {
//            totalCost = 20;
//        }
//        else if (boxType == "Cake Box")
//        {
//            totalCost = 50;
//        }
//        else if (boxType == "Sweet Box")
//        {
//            totalCost = 30;
//        }
//        else if (boxType == "Pizza Box")
//        {
//            totalCost = 40;
//        }
//        else if (boxType == "Gift Box")
//        {
//            totalCost = 60;
//        }

//        if (size == "Small")
//        {
//            totalCost *= 1;
//        }
//        else if (size == "Medium")
//        {
//            totalCost *= 1.5M;
//        }
//        else if (size == "Large")
//        {
//            totalCost *= 2;
//        }

//        // Set total cost and display
//        txtCost.Text = (totalCost * quantity).ToString("");
//    }
//}
