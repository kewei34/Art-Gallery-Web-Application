using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //HttpCookie cookie = new HttpCookie("cookieName");
            //cookie = Request.Cookies["Gender"];

            //UserControl ucFemale = this.LoadControl("female.ascx") as UserControl;
            //UserControl ucMale = this.LoadControl("male.ascx") as UserControl;
            //UserControl general = this.LoadControl("general.ascx") as UserControl;

            //if(cookie!= null)
            //{
            //    if (cookie.Value.Equals("F")){
            //        contentAd.controls.Add(ucFemale);
            //    }
            //    else if (cookie.Value.Equals("M"))
            //    {
            //        contentAd.Controls.Add(ucMale);
            //    }
            //    else
            //    {
            //        contentAd.Controls.Add(general);
            //    }
            //}
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