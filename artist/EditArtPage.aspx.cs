using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.Security;

namespace WebApplication.artist
{
    public partial class EditArtDetails : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Page_PreRender(object o, System.EventArgs e)
        {
            SqlDataSource1.SelectCommand = "SELECT * FROM art WHERE artist = '" + Membership.GetUser().ProviderUserKey + "';";
            SqlDataSource1.Select(DataSourceSelectArguments.Empty);
            SqlDataSource1.DataBind();
            DataList1.DataBind();
        }


        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            switch (e.CommandName)
            {
                case "delete":

                    string confirmValue = Request.Form["confirm_value"];
                    if (confirmValue == "Yes")
                    {
                        Label lblId = (Label)e.Item.FindControl("lblId");
                        string id = lblId.Text;

                        string sql = "DELETE FROM art where Id =@Id";
                        string sql2 = "DELETE FROM cart where itemId =@Id";
                        string sql3 = "DELETE FROM wishlist where itemId =@Id";


                        SqlConnection con = new SqlConnection(cs);
                        SqlCommand cmd3 = new SqlCommand(sql3, con);
                        SqlCommand cmd2 = new SqlCommand(sql2, con);
                        SqlCommand cmd = new SqlCommand(sql, con);

                        cmd3.Parameters.AddWithValue("@Id", id);
                        cmd2.Parameters.AddWithValue("@Id", id);
                        cmd.Parameters.AddWithValue("@Id", id);
                        

                        con.Open();
                        cmd3.ExecuteNonQuery();
                        cmd2.ExecuteNonQuery();
                        cmd.ExecuteNonQuery();
                        
                        
                        con.Close();

                        Response.Redirect("EditArtPage.aspx");
                    }
                    break;

                case "edit":
                    {
                        Label lblId = (Label)e.Item.FindControl("lblId");

                        String link = "EditArtDetails.aspx" + "?Id=" + lblId.Text;

                        Response.Redirect(link);
                    }
                    break;

            }

        }

        protected void addArtBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/artist/UploadArtPage.aspx");
        }
    }
}