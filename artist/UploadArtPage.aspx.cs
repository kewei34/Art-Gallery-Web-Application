using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication
{
    public partial class WebForm1 : System.Web.UI.Page
    {
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
    }
}