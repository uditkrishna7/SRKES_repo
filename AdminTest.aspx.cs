using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

public partial class AdminPanel : System.Web.UI.Page
{
    string username = "Admin@123";
    string password = "pwd@123";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadData();
        }
    }

    private void LoadData()
    {
        // Connection string
        string connectionString = "Data Source=UDIT\\SQLEXPRESS;Initial Catalog=OrderDB;Integrated Security=True;Encrypt=False";

        // SQL query to fetch data
        string query = "SELECT * FROM Orders";

        // DataTable to hold the data
        DataTable dataTable = new DataTable();

        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            try
            {
                // Open connection
                connection.Open();

                // Execute query using SqlCommand and SqlDataAdapter
                using (SqlCommand command = new SqlCommand(query, connection))
                using (SqlDataAdapter adapter = new SqlDataAdapter(command))
                {
                    adapter.Fill(dataTable);
                }

                // Bind data to GridView
                AdminGridView.DataSource = dataTable;
                AdminGridView.DataBind();
            }
            catch (Exception ex)
            {
                // Display error message
                Response.Write("An error occurred: " + ex.Message);
            }
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        if(TextBox1.Text == username && TextBox2.Text == password) 
        {
            AdminGridView.Visible = true;
        }
        else
        {
            AdminGridView.Visible = false;
        }
    }
}
