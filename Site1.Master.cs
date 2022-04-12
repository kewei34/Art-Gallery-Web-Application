using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

namespace WebApplication
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        string cs = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(cs);

            string sql = "SELECT gender FROM profile WHERE userId = @user_id";
            SqlCommand cmd = new SqlCommand(sql, con);
            cmd.Parameters.AddWithValue("@user_id", Membership.GetUser().ProviderUserKey);

            HttpCookie cookie = new HttpCookie("cookieName");

            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            string gender = "";
            if (dr.HasRows)
            {
                if (dr.Read())
                {
                    gender = dr["gender"].ToString();
                }
                else
                {
                    gender = "general";
                }
            }
            else
            {
                gender = "general";
            }


            UserControl ucFemale = this.LoadControl("female.ascx") as UserControl;
            UserControl ucMale = this.LoadControl("male.ascx") as UserControl;
            UserControl general = this.LoadControl("general.ascx") as UserControl;

            if (gender.Equals("F"))
            {
                profile.Controls.Add(ucFemale);
            }
            else if (gender.Equals("M"))
            {
                profile.Controls.Add(ucMale);
            }
            else
            {
                profile.Controls.Add(general);
            }
        }

        protected void cartBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Customer/ViewCart.aspx");
        }

        protected void wishlishBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Customer/wishlist.aspx");
        }

        protected void artBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/artist/EditArtPage.aspx");
        }

        protected void accBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/ManageAccount.aspx");
        }

        protected void hisBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/OrderHistory.aspx");
        }
    }
}