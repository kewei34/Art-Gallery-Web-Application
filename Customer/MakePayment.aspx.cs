using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Net.Configuration;
using System.Net.Mail;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication.Customer
{
    public partial class MakePayment : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(cs);

            string sql1 = "SELECT art.price, cart.qty FROM art INNER JOIN cart ON art.Id = cart.itemId WHERE cart.userId ='" + Membership.GetUser().ProviderUserKey + "';";
            decimal total = 0;



            SqlCommand cmd1 = new SqlCommand(sql1, con);

            con.Open();
            SqlDataReader tdr = cmd1.ExecuteReader();

            while (tdr.Read())
            {
                total += decimal.Parse((tdr["price"]).ToString()) * decimal.Parse((tdr["qty"]).ToString());
            }
            tdr.Close();

            Label1.Text = "RM " + total.ToString();
        }

        protected void button_submit_art_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(cs);

            string sql = "SELECT art.artist,art.name,art.imgPath,art.price,art.qty AS aqty,cart.qty AS cqty  FROM art INNER JOIN cart ON art.Id = cart.itemId WHERE cart.userId ='" + Membership.GetUser().ProviderUserKey + "';";

            string sql2 = "INSERT INTO orderDetail(orderId,imgPath,artName,qty,artPrice) VALUES (@sqlorder,@img,@artname,@qty,@artprice)";

            string sql3 = "INSERT INTO userOrder(userId,date,address) output inserted.Id VALUES (@userid,@oDate,@add)";

            string sql4 = "SELECT address FROM profile WHERE userId ='" + Membership.GetUser().ProviderUserKey + "';";

            string sql5 = "UPDATE art SET qty= @update_qty WHERE artist = @artist_id";

            SqlCommand cmd = new SqlCommand(sql, con);
            SqlCommand cmd2 = new SqlCommand(sql2, con);

            SqlCommand cmd4 = new SqlCommand(sql4, con);

            SqlCommand cmd3 = new SqlCommand(sql3, con);
            SqlCommand cmd5 = new SqlCommand(sql5, con);

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
                cmd5.Parameters.AddWithValue("@update_qty", temp);
                cmd5.Parameters.AddWithValue("@artist_id", artistId[j]);
                cmd5.ExecuteNonQuery();
                cmd5.Parameters.Clear();
            }
            string sql6 = "DELETE FROM cart WHERE userId ='" + Membership.GetUser().ProviderUserKey + "';";

            SqlCommand cmd6 = new SqlCommand(sql6, con);
            cmd6.ExecuteNonQuery();

            string msql = "SELECT * FROM orderDetail INNER JOIN userOrder ON orderDetail.orderId = userOrder.Id WHERE orderDetail.orderId = @mail_orderId";

            SqlCommand mcmd = new SqlCommand(msql, con);

            mcmd.Parameters.AddWithValue("@mail_orderId", orderId);

            SqlDataReader mdr = mcmd.ExecuteReader();
            string str = " <table><tr><td> Name </td> <td> Price </td> <td> Qty </td> <td> Total </td></tr> ";
            while (mdr.Read())
            {
                str += "<tr> <td>" + mdr["artName"].ToString() + "</td><td>" + mdr["qty"].ToString() + "</td><td>" + mdr["artPrice"].ToString() + "</td><td>" + decimal.Parse(mdr["artPrice"].ToString()) * decimal.Parse(mdr["qty"].ToString()) + "</td></tr>";
            }
            str += "</table>";

            sendMail(Membership.GetUser().Email, orderId, str);

            Response.Redirect("~/Customer/payment.aspx?orderId=" + orderId);
            con.Close();
        }

        public void sendMail(string email, int orderid, string str)
        {

            SmtpSection smtpSection = (SmtpSection)ConfigurationManager.GetSection("system.net/mailSettings/smtp");
            using (MailMessage mm = new MailMessage(smtpSection.From, email))
            {
                mm.Subject = "Artwork Order Summary";
                mm.Body = str;

                mm.IsBodyHtml = true;
                SmtpClient smtp = new SmtpClient("smtp.gmail.com", 587);
                smtp.Host = smtpSection.Network.Host;
                smtp.EnableSsl = smtpSection.Network.EnableSsl;
                NetworkCredential networkCred = new NetworkCredential(smtpSection.Network.UserName, smtpSection.Network.Password);
                smtp.UseDefaultCredentials = smtpSection.Network.DefaultCredentials;
                smtp.Credentials = networkCred;
                smtp.Port = smtpSection.Network.Port;
                smtp.Send(mm);
            }
        }

    }
}
