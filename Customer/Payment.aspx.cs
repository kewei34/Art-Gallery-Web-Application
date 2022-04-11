using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

namespace WebApplication.Customer
{
    public partial class Payment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            orderidlbl.Text = "Order ID :  " + Request.QueryString["orderId"];
        }



        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/homepage.aspx");
        }
    }
}