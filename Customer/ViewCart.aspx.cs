using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication.Customer
{
    public partial class ViewCart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            //string s = ((Label)DataList1.FindControl("lblPricehd")).Text;
            //decimal price = decimal.Parse(s);
            //((Label)DataList1.FindControl("lblTotal")).Text = (price * 2).ToString();

        }

        public string calculateTotal(string price,string qty)
        {
            decimal p = decimal.Parse(price);
            decimal q = decimal.Parse(qty);
            return "RM" + (p * q).ToString();
        }

    }
}