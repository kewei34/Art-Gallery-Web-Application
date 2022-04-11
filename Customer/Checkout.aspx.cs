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
        bool gotName = false;
        bool gotAddress = false;
        protected void Page_Load(object sender, EventArgs e)
        {
            name1.Enabled = true;
            address1.Enabled = true;
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
            dr.Close();
            lblTotal.Text = "RM " + total.ToString();


            //identify name and address status
            string sql2 = "SELECT name,address FROM profile WHERE userId ='" + Membership.GetUser().ProviderUserKey + "';";

            SqlCommand cmd2 = new SqlCommand(sql2, con);
            SqlDataReader dr1 = cmd2.ExecuteReader();

            string temName = "";
            string temAdd = "";

            if (dr1.Read())
            {
                temName = dr1["name"].ToString();
                temAdd = dr1["address"].ToString();
                if (!temName.Equals(null))
                {
                    name1.Enabled = false;
                    gotName = true;
                    name1.Text = temName;
                }
                if (!temAdd.Equals(null))
                {
                    address1.Enabled = false;
                    gotAddress = true;
                    address1.Text = temAdd;
                }
                if (!(temName.Equals(null) && temAdd.Equals(null)))
                {
                    name1.Enabled = false;
                    address1.Enabled = false;
                    gotName = true;
                    gotAddress = true;

                    name1.Text = temName;
                    address1.Text = temAdd;
                }
                
            }
            dr.Close();
            con.Close();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(cs);

            //insert name or address
            string proname = name1.Text;
            string proadd = address1.Text;
            string userId = Membership.GetUser().ProviderUserKey.ToString();
            con.Open();
            if (!(gotAddress&&gotName))
            {
                string pro = "INSERT INTO profile(userId,name,address)VALUES (@userid,@proName,@proAdd)";
                SqlCommand pcmd = new SqlCommand(pro, con);

                pcmd.Parameters.AddWithValue("@userid", userId);
                pcmd.Parameters.AddWithValue("@proName", proname);
                pcmd.Parameters.AddWithValue("@proAdd", proadd);
                pcmd.ExecuteNonQuery();
            }
            else if (!gotName)
            {
                string pro2 = "INSERT INTO profile(userId,name)VALUES (@userid,@proName2)";
                SqlCommand pcmd2 = new SqlCommand(pro2, con);
                pcmd2.Parameters.AddWithValue("@userid", userId);
                pcmd2.Parameters.AddWithValue("@proName2", proname);
                pcmd2.ExecuteNonQuery();
            }
            else
            {
                if (!gotAddress)
                {
                    string pro3 = "INSERT INTO profile(address)VALUES (@userid,@proAdd2)";
                    SqlCommand pcmd3 = new SqlCommand(pro3, con);

                    pcmd3.Parameters.AddWithValue("@userid", userId);
                    pcmd3.Parameters.AddWithValue("@proAdd2", proadd);
                    pcmd3.ExecuteNonQuery();
                }
            }
            
            
            string sql = "SELECT art.artist,art.name,art.imgPath,art.price,art.qty AS aqty,cart.qty AS cqty  FROM art INNER JOIN cart ON art.Id = cart.itemId WHERE cart.userId ='" + Membership.GetUser().ProviderUserKey + "';";

            string sql2 = "INSERT INTO orderDetail(orderId,imgPath,artName,qty,artPrice) VALUES (@sqlorder,@img,@artname,@qty,@artprice)";

            string sql3 = "INSERT INTO userOrder(userId,date,address) output inserted.Id VALUES (@userid,@oDate,@add)";

            string sql4 = "SELECT address FROM profile WHERE userId ='" + Membership.GetUser().ProviderUserKey + "';";

            string sql5 = "UPDATE art SET qty= @update_qty WHERE artist = @artist_id";

            SqlCommand cmd = new SqlCommand(sql, con);
            SqlCommand cmd2 = new SqlCommand(sql2, con);
            SqlCommand cmd3 = new SqlCommand(sql3, con);
            SqlCommand cmd4 = new SqlCommand(sql4, con);
            SqlCommand cmd5 = new SqlCommand(sql5, con);

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

            //create order
            cmd3.Parameters.AddWithValue("@userid", Membership.GetUser().ProviderUserKey);
            cmd3.Parameters.AddWithValue("@oDate", DateTime.Now);
            cmd3.Parameters.AddWithValue("@add", address);

            int orderId = (int)cmd3.ExecuteScalar();

            SqlDataReader dr = cmd.ExecuteReader();

            string[] img = new string[10];
            string[] name = new string[10];
            decimal[] price = new decimal[10];
            int[] qty = new int[10];

            string[] artistId = new string[10];
            int[] art_qty = new int[10];

            int i = 0;

            while (dr.Read())
            {
                img[i] = (string)dr["imgPath"];
                name[i] = (string)dr["name"];
                price[i] = (decimal)dr["price"];
                qty[i] = (int)dr["cqty"];
                art_qty[i] = (int)dr["aqty"];
                artistId[i] = dr["artist"].ToString();
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

                int temp = art_qty[j] - qty[j];
                cmd5.Parameters.AddWithValue("@update_qty",temp );
                cmd5.Parameters.AddWithValue("@artist_id", artistId[j]);
                cmd5.ExecuteNonQuery();
                cmd5.Parameters.Clear();
            }
            string sql6 = "DELETE FROM cart WHERE userId ='" + Membership.GetUser().ProviderUserKey + "';";

            SqlCommand cmd6 = new SqlCommand(sql6, con);
            cmd6.ExecuteNonQuery();

            Response.Redirect("~/Customer/payment.aspx?orderId="+orderId);
            con.Close();
        }
    }
}