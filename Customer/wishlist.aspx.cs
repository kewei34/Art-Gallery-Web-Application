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
    public partial class wishlist : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
 
            }
           
        }
        protected void Page_PreRender(object o, System.EventArgs e)
        { SqlDataSource1.SelectCommand = "SELECT art.Id, art.imgPath, art.name, art.price,wishlist.userId, wishlist.Id AS Expr1 FROM art INNER JOIN wishlist ON art.Id = wishlist.itemId WHERE wishlist.userName = '" + getUserName() + "';";
            SqlDataSource1.Select(DataSourceSelectArguments.Empty);
            SqlDataSource1.DataBind();
            DataList1.DataBind();}



            public string getUserName()
        {
            return Membership.GetUser().UserName;
        }

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            switch (e.CommandName)
            {
                case "remove":

                    Label lblId = (Label)e.Item.FindControl("lblId");
                    string id = lblId.Text;

                    string sql = "DELETE FROM wishlist WHERE Id = @Id";

                    SqlConnection con = new SqlConnection(cs);
                    SqlCommand cmd = new SqlCommand(sql, con);

                    cmd.Parameters.AddWithValue("@Id", id);

                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();

                    Response.Redirect("~/Customer/wishlist.aspx");

                    break;

                default: break;
            }
        }
    }
}