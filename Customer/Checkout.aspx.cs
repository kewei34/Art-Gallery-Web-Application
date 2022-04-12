using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Configuration;
using System.Data.SqlClient;
using System.Web.Security;

using System.Net;
using System.Net.Mail;
using System.Net.Configuration;
using System.Net.Mime;

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
            if (!(gotAddress && gotName))
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
            Response.Redirect("MakePayment.aspx");
        }
    }
}