using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Data.SqlClient;
using System.Configuration;

namespace WebApplication.Customer
{
    public partial class Payment : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            orderidlbl.Text = "Order ID :  " + Request.QueryString["orderId"];

            string sql = "SELECT orderDetail.artPrice, orderDetail.qty FROM orderDetail INNER JOIN userOrder ON orderDetail.orderId = userOrder.Id WHERE userOrder.Id = @orderid AND userOrder.userId ='" + Membership.GetUser().ProviderUserKey + "';";

            decimal total = 0;

            SqlConnection con = new SqlConnection(cs);
            SqlCommand cmd = new SqlCommand(sql, con);

            cmd.Parameters.AddWithValue("@orderid", Request.QueryString["orderId"]);
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();

            while (dr.Read())
            {
                total += decimal.Parse((dr["artPrice"]).ToString()) * decimal.Parse(dr["qty"].ToString());
            }
            Label2.Text = "Total : RM " + total;
        }


        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/homepage.aspx");
        }
    }
}