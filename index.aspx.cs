﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Home :  System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        //TextBox1.Text = "Hello and Welcome";
    }

    protected void Button1_Click1(object sender, EventArgs e)
    {
        Response.Redirect("Categories.aspx");
    }
}