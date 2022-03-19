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

            string sql = "SELECT * FROM art WHERE Id = @Id";

            SqlConnection con = new SqlConnection(cs);
            SqlCommand cmd = new SqlCommand(sql, con);

            cmd.Parameters.AddWithValue("@Id",id);

            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.Read())
            {
                found = true;
                dp_artImg.ImageUrl = (string)dr["imgPath"];
                dp_artName.Text = (string)dr["name"];
                dp_artPrice.Text = "RM " + dr["price"].ToString();
                dp_artDesc.Text = (string)dr["description"];
                dp_qty.Attributes.Add("max", dr["qty"].ToString());
            }

            if (!found)
            {
                Response.Redirect("~/homepage.aspx");
            }

            con.Close();
        }

        protected void addCart_Click(object sender, EventArgs e)
        {
            //item id
            string id = Request.QueryString["Id"] ?? "";
            //user id
            string userId = Membership.GetUser().ProviderUserKey.ToString();
            string userName = Membership.GetUser().UserName;

            SqlConnection con = new SqlConnection(cs);

            string checkSql = "SELECT artist FROM art WHERE artist=@Id";
            SqlCommand checkCmd = new SqlCommand(checkSql, con);
            checkCmd.Parameters.AddWithValue("@Id", Membership.GetUser().ProviderUserKey);

            con.Open();

            SqlDataReader dr = checkCmd.ExecuteReader();

            if (dr.HasRows)
            {
                //his own art
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('You cannot buy your own art !')", true);
                //System.Text.StringBuilder sb = new System.Text.StringBuilder();
                //sb.Append("alert('");
                //sb.Append("You cannot buy your own art !");
                //sb.Append("');");
                //ClientScript.RegisterOnSubmitStatement(this.GetType(), "alert", sb.ToString());
                dr.Close();
                con.Close();
            }
            else
            {
                con.Close();
                int qty = int.Parse(dp_qty.Text);

                string sql = "INSERT INTO cart(itemId,qty,userId,userName) VALUES (@Id,@Qty,@UserId,@UserName)";
                string check = "SELECT qty FROM cart WHERE itemId = @ItemId";
                string sql2 = "UPDATE cart SET qty = @Qty WHERE itemId = @Id";



                SqlCommand cmd = new SqlCommand(sql, con);
                SqlCommand cmd2 = new SqlCommand(check, con);
                SqlCommand cmd3 = new SqlCommand(sql2, con);

                cmd.Parameters.AddWithValue("@Id", id);
                cmd.Parameters.AddWithValue("@Qty", qty);
                cmd.Parameters.AddWithValue("@UserId", userId);
                cmd.Parameters.AddWithValue("@UserName", userName);

                cmd2.Parameters.AddWithValue("@ItemId", id);

                cmd3.Parameters.AddWithValue("@Id", id);

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
                System.Text.StringBuilder sb = new System.Text.StringBuilder();
                

                con.Close();
            }


        }
    }
}