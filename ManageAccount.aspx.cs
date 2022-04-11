using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Configuration;
using System.Data.SqlClient;


namespace WebApplication
{
    public partial class ManageAccount : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            lblId.Text = Membership.GetUser().ProviderUserKey.ToString();
            user_name.Text=Membership.GetUser().UserName;
            user_email.Text =Membership.GetUser().Email;

            if (!Page.IsPostBack)
            {
                bool found = false;

                string id = Membership.GetUser().ProviderUserKey.ToString();

                string sql = "SELECT * FROM profile WHERE userId =@Id";

                SqlConnection con = new SqlConnection(cs);
                SqlCommand cmd = new SqlCommand(sql, con);
                cmd.Parameters.AddWithValue("@Id", id);

                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    found = true;
                    user_realname.Text = (dr["name"]).ToString();
                    user_address.Text = (dr["address"]).ToString();
                    userGenderValue.Text = (dr["gender"]).ToString();
                    newR.Text = "1";

                }
                else
                {
                    newR.Text = "0";
                }
                dr.Close();
                con.Close();
                                
            }
            if (userGenderValue.Text == "")
            {
                user_gender.Visible = true;                
                editGender.Visible = true;
                gender_value.Visible = false;
                gender_value.Text = "";
            }
            else
            {
                if(userGenderValue.Text == "M")
                {
                    gender_value.Text = "Male 👨";
                }
                else if(userGenderValue.Text == "F")
                {
                    gender_value.Text = "Female 👧";
                }
               

                user_gender.Visible = false;
                gender_value.Visible = true;
                editGender.Visible = false;
            }
           
        }

 

        protected void editRealname_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string userId = lblId.Text;
                string newRegistration = newR.Text;
                string name = user_realname.Text;
                string address = "";
                if (newRegistration == "0")
                {
                    string sql = "INSERT INTO profile(userId,address,name) VALUES (@UserId,@Address,@Name)";

                    SqlConnection con = new SqlConnection(cs);
                    SqlCommand cmd = new SqlCommand(sql, con);

                    cmd.Parameters.AddWithValue("@UserId", userId);                    
                    cmd.Parameters.AddWithValue("@Address", address);
                    cmd.Parameters.AddWithValue("@Name", name);

                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();

                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Your Name has been Registered Sucessfully!')", true);

                    Response.Redirect("ManageAccount.aspx");
                }
                else{
                    string sql = @"UPDATE profile SET name= @Name WHERE userId = @UserId  ";
                    SqlConnection con = new SqlConnection(cs);
                    SqlCommand cmd = new SqlCommand(sql, con);

                    cmd.Parameters.AddWithValue("@Name", name);
                    cmd.Parameters.AddWithValue("@UserId", userId);


                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();

                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Your Name has changed successfully!')", true);

                    Response.Redirect("ManageAccount.aspx");
                }
                
            }
        }

        protected void editAddress_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string userId = lblId.Text;
                string newRegistration = newR.Text;
                string name = "";
                string address = user_address.Text;
                if (newRegistration == "0")
                {
                    string sql = "INSERT INTO profile(userId,address,name) VALUES (@UserId,@Address,@Name)";

                    SqlConnection con = new SqlConnection(cs);
                    SqlCommand cmd = new SqlCommand(sql, con);

                    cmd.Parameters.AddWithValue("@UserId", userId);
                    cmd.Parameters.AddWithValue("@Address", address);
                    cmd.Parameters.AddWithValue("@Name", name);

                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();

                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Your Address has been Registered Sucessfully!')", true);

                    Response.Redirect("ManageAccount.aspx");
                }
                else
                {
                    string sql = @"UPDATE profile SET address= @Address WHERE userId = @UserId  ";
                    SqlConnection con = new SqlConnection(cs);
                    SqlCommand cmd = new SqlCommand(sql, con);

                    cmd.Parameters.AddWithValue("@Address", address);
                    cmd.Parameters.AddWithValue("@UserId", userId);


                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();

                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Your Address has changed successfully!')", true);

                    Response.Redirect("ManageAccount.aspx");
                }

            }
        }

        protected void editEmail_Click(object sender, EventArgs e)
        {

            if (Page.IsValid)
            {

                ////string id = lblId.Text;
                //string email1 = user_email.Text;

                ////string sql = @"UPDATE aspnet_Membership SET Email = @Email1 WHERE UserId = @Id";

                ////SqlConnection con = new SqlConnection(cs);
                ////SqlCommand cmd = new SqlCommand(sql, con);
                ////cmd.Parameters.AddWithValue("@Email1", email1);
                ////cmd.Parameters.AddWithValue("@Id", id);

                ////con.Open();
                ////cmd.ExecuteNonQuery();
                ////con.Close();
                
                //MembershipUser user1 = Membership.GetUser(User.Identity.Name);
                //user1.Email = email1;
                //Membership.UpdateUser(user1);

                ////Response.Redirect("ManageAccount.aspx");
            }
        }

        protected void editGender_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string userId = lblId.Text;
                string newRegistration = newR.Text;
                string gender = user_gender.SelectedValue;
                
                string sql = @"UPDATE profile SET gender= @Gender WHERE userId = @UserId  ";
                SqlConnection con = new SqlConnection(cs);
                SqlCommand cmd = new SqlCommand(sql, con);

                cmd.Parameters.AddWithValue("@Gender", gender);
                cmd.Parameters.AddWithValue("@UserId", userId);


                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();


                Response.Redirect("ManageAccount.aspx");
                

            }
        }
    }
}