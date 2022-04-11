using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

namespace WebApplication
{
    public partial class OrderHistory : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Page_PreRender(object o, System.EventArgs e)
        {
            SqlDataSource1.SelectCommand = "SELECT orderDetail.*, userOrder.userId, userOrder.Id,userOrder.date FROM orderDetail INNER JOIN userOrder ON orderDetail.orderId = userOrder.Id WHERE userOrder.userId = '" + Membership.GetUser().ProviderUserKey + "';";
            SqlDataSource1.Select(DataSourceSelectArguments.Empty);
            SqlDataSource1.DataBind();
            GridView1.DataBind();
        }
    }
}