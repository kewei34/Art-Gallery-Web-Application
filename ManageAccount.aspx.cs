using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

namespace WebApplication
{
    public partial class ManageAccount : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            user_name.Text=Membership.GetUser().UserName;
            user_email.Text =Membership.GetUser().Email;
        }
    }
}