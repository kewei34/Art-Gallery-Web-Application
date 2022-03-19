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
    public partial class ViewCart : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            //bind datasource 
            SqlDataSource1.SelectCommand = "SELECT art.name, art.price, art.imgPath, cart.qty , art.artist FROM art INNER JOIN cart ON art.Id = cart.itemId WHERE cart.userId = '" + Membership.GetUser().ProviderUserKey + "';";
            SqlDataSource1.Select(DataSourceSelectArguments.Empty);
            SqlDataSource1.DataBind();
            DataList1.DataBind();

            //calculate cart total
            string sql = "SELECT art.price, cart.qty FROM art INNER JOIN cart ON art.Id = cart.itemId";
            decimal total = 0;

            SqlConnection con = new SqlConnection(cs);
            SqlCommand cmd = new SqlCommand(sql, con);

            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();

            while (dr.Read())
            {
                total += decimal.Parse((dr["price"]).ToString()) * decimal.Parse((dr["qty"]).ToString());
            }
            lblCartTotal.Text = total.ToString();

            dr.Close();
            con.Close();

        }

        public string calculateTotal(string price, string qty)
        {
            decimal p = decimal.Parse(price);
            decimal q = decimal.Parse(qty);
            return "RM" + (p * q).ToString();
        }

        protected void checkout_Click(object sender, EventArgs e)
        {

        }
    }
}