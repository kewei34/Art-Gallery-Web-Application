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
    public partial class ViewArtDetails : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            Boolean found = false;
            string id = Request.QueryString["Id"] ?? "";
            string userid = Membership.GetUser().ProviderUserKey.ToString();

            string sql = "SELECT * FROM art WHERE Id = @Id";
            string sql2 = "SELECT qty FROM cart WHERE userId = @userId AND itemIs = @art_id";

            SqlConnection con = new SqlConnection(cs);
            SqlCommand cmd = new SqlCommand(sql, con);
            SqlCommand cmd2 = new SqlCommand(sql2, con);

            cmd.Parameters.AddWithValue("@Id", id);

            cmd2.Parameters.AddWithValue("@userid", userid);
            cmd2.Parameters.AddWithValue("@art_id", id);

            con.Open();
            SqlDataReader dr1 = cmd2.ExecuteReader();
            int qtyInCart = 0;
            if (dr1.HasRows)
            {
                if (dr1.Read())
                {
                    qtyInCart = (int)dr1["qty"];
                }
            }
            dr1.Close();
            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.Read())
            {
                int max = dr["qty"];
                found = true;
                dp_artImg.ImageUrl = (string)dr["imgPath"];
                dp_artName.Text = (string)dr["name"];
                dp_artPrice.Text = "RM " + dr["price"].ToString();
                dp_artDesc.Text = (string)dr["description"];
                dp_qty.Attributes.Add("max", dr["qty"].ToString());
                stock.Text = "Stock left : " + dr["qty"].ToString();
            }

            if (!found)
            {
                Response.Redirect("~/homepage.aspx");
            }

            dr.Close();


            string checkSql = "SELECT itemId FROM wishlist WHERE itemId=@Id AND userId = @User";
            SqlCommand checkCmd = new SqlCommand(checkSql, con);
            checkCmd.Parameters.AddWithValue("@Id", id);
            checkCmd.Parameters.AddWithValue("@User", Membership.GetUser().ProviderUserKey);


            dr = checkCmd.ExecuteReader();

            if (dr.HasRows)
            {
                wishlist.Enabled = false;
            }


            con.Close();
        }

        protected void addCart_Click(object sender, EventArgs e)
        {
            //item id
            string id = Request.QueryString["Id"] ?? "";
            string userName = Membership.GetUser().UserName;

            SqlConnection con = new SqlConnection(cs);

            string checkSql = "SELECT artist FROM art WHERE artist=@Id AND Id = @Art";
            SqlCommand checkCmd = new SqlCommand(checkSql, con);
            checkCmd.Parameters.AddWithValue("@Id", Membership.GetUser().ProviderUserKey);
            checkCmd.Parameters.AddWithValue("@Art", id);

            con.Open();

            SqlDataReader dr = checkCmd.ExecuteReader();

            if (dr.HasRows)
            {
                //his own art
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('You cannot buy your own art !')", true);
                dr.Close();
                con.Close();
            }
            else
            {
                con.Close();
                int qty = int.Parse(dp_qty.Text);

                string sql = "INSERT INTO cart(itemId,qty,userId,userName) VALUES (@Id,@Qty,@UserId,@UserName)";
                string check = "SELECT qty FROM cart WHERE itemId = @ItemId AND userId = @User";
                string sql2 = "UPDATE cart SET qty = @Qty WHERE itemId = @Id AND userId = @User";



                SqlCommand cmd = new SqlCommand(sql, con);
                SqlCommand cmd2 = new SqlCommand(check, con);
                SqlCommand cmd3 = new SqlCommand(sql2, con);

                cmd.Parameters.AddWithValue("@Id", id);
                cmd.Parameters.AddWithValue("@Qty", qty);
                cmd.Parameters.AddWithValue("@UserId", Membership.GetUser().ProviderUserKey);
                cmd.Parameters.AddWithValue("@UserName", userName);

                cmd2.Parameters.AddWithValue("@ItemId", id);
                cmd2.Parameters.AddWithValue("@User", Membership.GetUser().ProviderUserKey);

                cmd3.Parameters.AddWithValue("@Id", id);
                cmd3.Parameters.AddWithValue("@User", Membership.GetUser().ProviderUserKey);

                con.Open();

                dr = cmd2.ExecuteReader();

                //if item already in cart
                if (dr.Read())
                {
                    qty += int.Parse(dr["qty"].ToString());
                    cmd3.Parameters.AddWithValue("@Qty", qty);

                    dr.Close();
                    cmd3.ExecuteNonQuery();
                }
                else
                {
                    dr.Close();
                    cmd.ExecuteNonQuery();
                }
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Item added to cart successfully !')", true);


                con.Close();
            }


        }

        protected void wishlist_Click(object sender, EventArgs e)
        {
            //item id
            string id = Request.QueryString["Id"] ?? "";

            SqlConnection con = new SqlConnection(cs);


            string checkSql = "SELECT itemId FROM wishlist WHERE itemId=@Id AND userId = @User";
            SqlCommand checkCmd = new SqlCommand(checkSql, con);
            checkCmd.Parameters.AddWithValue("@Id", id);
            checkCmd.Parameters.AddWithValue("@User", Membership.GetUser().ProviderUserKey);

            con.Open();

            SqlDataReader dr = checkCmd.ExecuteReader();

            if (dr.HasRows)
            {

            }
            else
            {
                dr.Close();
                string sql = "INSERT INTO wishlist(itemId,userId,userName) VALUES (@Id,@UserId,@UserName)";
                SqlCommand cmd = new SqlCommand(sql, con);
                cmd.Parameters.AddWithValue("@Id", id);
                cmd.Parameters.AddWithValue("@UserId", Membership.GetUser().ProviderUserKey.ToString());
                cmd.Parameters.AddWithValue("@UserName", Membership.GetUser().UserName);


                cmd.ExecuteNonQuery();

                Response.Redirect("~/Customer/wishlist.aspx");

                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Item added to wishlist successfully !')", true);


            }

            dr.Close();
            con.Close();

        }
    }
}