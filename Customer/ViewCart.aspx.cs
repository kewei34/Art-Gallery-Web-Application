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
            string sql = "SELECT art.qty AS aqty,art.price, cart.qty AS cqty,cart.itemId FROM art INNER JOIN cart ON art.Id = cart.itemId WHERE cart.userId ='" + Membership.GetUser().ProviderUserKey + "';";

            string sql2 = "UPDATE cart SET qty= @new_qty WHERE itemId = @Id AND userId = @userId";
            string sql3 = "DELETE FROM cart WHERE itemId = @Id AND userId = @userId";

            decimal total = 0;

            SqlConnection con = new SqlConnection(cs);
            SqlCommand cmd = new SqlCommand(sql, con);
            SqlCommand cmd2 = new SqlCommand(sql2, con);
            SqlCommand cmd3 = new SqlCommand(sql3, con);

            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();

            int tempqty = 0;
            int tempaqty = 0;
            int[] storeQty = new int[10];
            int i = 0;
            int[] tempId = new int[10];
            while (dr.Read())
            {
                tempaqty = (int)dr["aqty"];
                tempqty = (int)dr["cqty"];

                if (tempqty > tempaqty)
                {
                    tempqty = tempaqty;
                }
                storeQty[i] = tempqty;
                
                
                tempId[i] = (int)dr["itemId"];
                i++;
                total += decimal.Parse((dr["price"]).ToString()) * (decimal)tempqty;
            }
            bool hasItem = false;
            if (!dr.HasRows)
            {
                hasItem = false;
                
            }
            else
            {
                hasItem = true;
            }
            
             dr.Close();

            for (int j = 0; j < i; j++)
            {
                if (storeQty[j] == 0)
                {
                    cmd3.Parameters.AddWithValue("@Id", tempId[j]);
                    cmd3.Parameters.AddWithValue("@userId", Membership.GetUser().ProviderUserKey);
                    cmd3.ExecuteNonQuery();
                    cmd3.Parameters.Clear();
                }
                else
                {
                    cmd2.Parameters.AddWithValue("@new_qty", storeQty[j]);
                cmd2.Parameters.AddWithValue("@Id", tempId[j]);
                cmd2.Parameters.AddWithValue("@userId", Membership.GetUser().ProviderUserKey);
                cmd2.ExecuteNonQuery();
                cmd2.Parameters.Clear();
                }
                
            }
            if (!hasItem)
            {
                Label1.Text = "Your Cart is Empty !";
                lblCartTotal.Visible = false;
                checkout.Visible = false;
                showTotal.Visible = false;
            }
            else
            {
                lblCartTotal.Visible = true;
                checkout.Visible = true;
                showTotal.Visible = true;
            }

            
            lblCartTotal.Text = total.ToString();
            con.Close();

        }

        protected void Page_PreRender(object o, System.EventArgs e)
        {
            //bind datasource 
            SqlDataSource1.SelectCommand = "SELECT cart.Id, art.Id AS artId,art.name, art.price, art.imgPath, cart.qty , art.artist FROM art INNER JOIN cart ON art.Id = cart.itemId WHERE cart.userId = '" + Membership.GetUser().ProviderUserKey + "';";
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