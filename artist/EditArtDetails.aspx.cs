using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace WebApplication.artist
{
    public partial class EditArtPage : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!Page.IsPostBack)
            {
                bool found = false;

                string id = Request.QueryString["Id"] ?? "";

                string sql = "SELECT * FROM art WHERE Id =@Id";


                SqlConnection con = new SqlConnection(cs);
                SqlCommand cmd = new SqlCommand(sql, con);
                cmd.Parameters.AddWithValue("@Id", id);

                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    found = true;
                    lblId.Text = (dr["Id"]).ToString();
                    art_image.ImageUrl = (string)dr["imgPath"];
                    art_name.Text = (string)dr["name"];
                    art_price.Text = (dr["price"]).ToString();
                    art_qty.Text = (dr["qty"]).ToString();
                    art_description.Text = (string)dr["description"];

                }
                dr.Close()
;               con.Close();

                if (!found)
                {
                    Response.Redirect("EditArtPage.aspx");
                }
            }
        }

        protected void button_edit_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string id = lblId.Text;
                string name = art_name.Text;
                string new_imagepath = "";
                if(art_image_upload.FileName!= "")
                {
                    new_imagepath = art_image_upload.FileName;
                }else
                {
                    new_imagepath = art_image.ImageUrl;
                }
                string price = art_price.Text;
                string qty = art_qty.Text;
                string description = art_description.Text;

                string sql = @"UPDATE art SET ImgPath= @New_imagepath, Name= @Name, Price = @Price,Qty= @Qty,description= @Description WHERE Id = @Id  ";

                SqlConnection con = new SqlConnection(cs);
                SqlCommand cmd = new SqlCommand(sql, con);
                cmd.Parameters.AddWithValue("@New_imagepath",new_imagepath);
                cmd.Parameters.AddWithValue("@Name",name);
                cmd.Parameters.AddWithValue("@Price",price);
                cmd.Parameters.AddWithValue("@Qty",qty);
                cmd.Parameters.AddWithValue("@Description",description);
                cmd.Parameters.AddWithValue("@Id",id);


                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();

                Response.Redirect("EditArtPage.aspx");


                 
            }
        }

        protected void button_back_Click(object sender, EventArgs e)
        {
            Response.Redirect("EditArtPage.aspx");
        }
    }
}
