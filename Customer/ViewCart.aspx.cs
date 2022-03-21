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
           

            //calculate cart total
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

            if (!dr.HasRows)
            {
                Label1.Text = "Your Cart is Empty !";
            }
            lblCartTotal.Text = total.ToString();

            dr.Close();
            con.Close();

        }

        protected void Page_PreRender(object o, System.EventArgs e)
        {
            //bind datasource 
            SqlDataSource1.SelectCommand = "SELECT cart.Id ,art.name, art.price, art.imgPath, cart.qty , art.artist FROM art INNER JOIN cart ON art.Id = cart.itemId WHERE cart.userId = '" + Membership.GetUser().ProviderUserKey + "';";
            SqlDataSource1.Select(DataSourceSelectArguments.Empty);
            SqlDataSource1.DataBind();
            DataList1.DataBind();
        }

            public string calculateTotal(string price, string qty)
        {
            decimal p = decimal.Parse(price);
            decimal q = decimal.Parse(qty);
            return "RM " + (p * q).ToString();
        }

        protected void checkout_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Customer/Checkout.aspx");
        }

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            switch (e.CommandName)
            {
                case "del":

                    Label lblId = (Label)e.Item.FindControl("lblId");
                    string id = lblId.Text;

                    string sql = "DELETE FROM cart WHERE Id = @Id";

                    SqlConnection con = new SqlConnection(cs);
                    SqlCommand cmd = new SqlCommand(sql, con);

                    cmd.Parameters.AddWithValue("@Id", id);

                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();

                    Response.Redirect("~/Customer/ViewCart.aspx");

                    break;

                default: break;
            }
        }
    }
}