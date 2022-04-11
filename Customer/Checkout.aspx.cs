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
        bool profile = false;
        bool gotName = false;
        bool gotAddress = false;
        protected void Page_Load(object sender, EventArgs e)
        {
            //show total
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


            string sql2 = "SELECT name,address FROM profile WHERE userId ='" + Membership.GetUser().ProviderUserKey + "';";

            SqlCommand cmd2 = new SqlCommand(sql2, con);
            con.Open();
            SqlDataReader dr1 = cmd2.ExecuteReader();

            string temName = "";
            string temAdd = "";

            if (dr1.Read())
            {
                temName = dr["name"].ToString();
                temAdd = dr["address"].ToString();
                if (!temName.Equals(""))
                {
                    name1.Enabled = false;
                    gotName = true;
                }
                if (!temAdd.Equals(""))
                {
                    address1.Enabled = false;
                    gotAddress = true;
                }
                if (!(temName.Equals("") && temAdd.Equals("")))
                {
                    name1.Enabled = false;
                    address1.Enabled = false;
                    profile = true;
                }
                dr.Close();
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(cs);

            string proname = name1.Text;
            string proadd = address1.Text;
            if (!profile)
            {
                string pro = "INSERT INTO profile(name,address)VALUES (@proName,@proAdd)";
                SqlCommand pcmd = new SqlCommand(pro, con);

                pcmd.Parameters.AddWithValue("@proName", proname);
                pcmd.Parameters.AddWithValue("@proAdd", proadd);
                pcmd.ExecuteNonQuery();
            }


            string sql = "SELECT * FROM art INNER JOIN cart ON art.Id = cart.itemId WHERE cart.userId ='" + Membership.GetUser().ProviderUserKey + "';";

            string sql2 = "INSERT INTO orderDetail(orderId,imgPath,artName,qty,artPrice) VALUES (@sqlorder,@img,@artname,@qty,@artprice)";

            string sql3 = "INSERT INTO userOrder(userId,date,address) output inserted.Id VALUES (@userid,@oDate,@add)";

            string sql4 = "SELECT address FROM profile WHERE userId ='" + Membership.GetUser().ProviderUserKey + "';";

            SqlCommand cmd = new SqlCommand(sql, con);
            SqlCommand cmd2 = new SqlCommand(sql2, con);
            SqlCommand cmd3 = new SqlCommand(sql3, con);
            SqlCommand cmd4 = new SqlCommand(sql4, con);

            con.Open();
            SqlDataReader dr1 = cmd4.ExecuteReader();
            string address = "";
            if (dr1.Read())
            {
                address = (string)dr1["address"];
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Something went wrong,please try again later.')", true);
            }
            dr1.Close();

            cmd3.Parameters.AddWithValue("@userid", Membership.GetUser().ProviderUserKey);
            cmd3.Parameters.AddWithValue("@oDate", DateTime.Now);
            cmd3.Parameters.AddWithValue("@add", address);

            int orderId = (int)cmd3.ExecuteScalar();

            SqlDataReader dr = cmd.ExecuteReader();

            string[] img = new string[10];
            string[] name = new string[10];
            decimal[] price = new decimal[10];
            int[] qty = new int[10];

            int i = 0;
            while (dr.Read())
            {
                img[i] = (string)dr["imgPath"];
                name[i] = (string)dr["name"];
                price[i] = (decimal)dr["price"];
                qty[i] = (int)dr["qty"];
                i++;
            }
            dr.Close();
            //insert order detail
            for (int j = 0; j < i; j++)
            {

                cmd2.Parameters.AddWithValue("@sqlorder", orderId);
                cmd2.Parameters.AddWithValue("@img", img[j]);
                cmd2.Parameters.AddWithValue("@artname", name[j]);
                cmd2.Parameters.AddWithValue("@qty", qty[j]);
                cmd2.Parameters.AddWithValue("@artprice", price[j]);

                cmd2.ExecuteNonQuery();
                cmd2.Parameters.Clear();
            }
            // Response.Redirect("~/Customer/payment.aspx");
            con.Close();
        }
    }
}