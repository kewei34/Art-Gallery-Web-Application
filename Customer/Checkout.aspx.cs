using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Configuration;
using System.Data.SqlClient;
using System.Web.Security;

namespace WebApplication.Customer
{
    public partial class Checkout : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            string sql = "SELECT art.price, cart.qty FROM art INNER JOIN cart ON art.Id = cart.itemId WHERE cart.userId ='" + Membership.GetUser().ProviderUserKey + "';";
            decimal total = 0;

            SqlConnection con = new SqlConnection(cs);
            SqlCommand cmd = new SqlCommand(sql, con);

            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();

            while (dr.Read())
            {
                total += decimal.Parse((dr["price"]).ToString()) * decimal.Parse((dr["qty"]).ToString());
            }
            lblTotal.Text = "RM " + total.ToString();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Customer/payment.aspx");
        }
    }
}