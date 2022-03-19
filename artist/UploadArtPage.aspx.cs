using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.Security;

namespace WebApplication.artist
{
    public partial class UploadArtPage : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack) { 
            
            }
        }

        protected void art_quantity_TextChanged(object sender, EventArgs e)
        {
            String quantity = art_quantity.Text;
            
            
                int quantity_in_int = Int32.Parse(quantity);
                if (quantity_in_int > 100 || quantity_in_int < 1)
                {
                    art_quantity_warning_text.Text = "Please enter number between 1-100 only";
                }
        }

        protected void button_submit_art_Click(object sender, EventArgs e)
        {
            string userId = Membership.GetUser().ProviderUserKey.ToString();

            string fileName = art_image_upload.FileName;
            string name = art_name.Text;
            decimal price = Convert.ToDecimal(art_price.Text);
            int qty = Convert.ToInt32(art_quantity.Text);
            string desc = art_desc.Text;

            //save img to folder
            art_image_upload.PostedFile.SaveAs(Server.MapPath("/image/" + fileName));
            //save path
            string path = "/image/" + fileName.ToString();


            string sql = "INSERT INTO art(imgPath,name,price,qty,description,artist) VALUES (@Imgpath,@Name,@Price,@Qty,@Desc,@Id)";

            SqlConnection con = new SqlConnection(cs);
            SqlCommand cmd = new SqlCommand(sql, con);

            cmd.Parameters.AddWithValue("@Imgpath", path);
            cmd.Parameters.AddWithValue("@Name", name);
            cmd.Parameters.AddWithValue("@Price", price);
            cmd.Parameters.AddWithValue("@Qty", qty);
            cmd.Parameters.AddWithValue("@Desc", desc);
            cmd.Parameters.AddWithValue("@Id", userId);

            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();



        }
    }
}