using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LibraryManagement
{
    public partial class SignUpPage : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["Con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Initialization()
        {
            hdnUserID.Value = "0";
            txtName.Text = "";
            txtUserName.Text = "";
            txtDOB.Text = "";
            txtContact.Text = "";
            txtEmail.Text = "";
            ddlState.SelectedIndex = 0;
            txtCity.Text = "";
            txtPincode.Text = "";
            txtAddress.Text = "";
            txtPass.Text = "";
        }

        // check duplicate
        bool checkMemberExist()
        {
            SqlConnection connection = new SqlConnection(strcon);
            if (connection.State == ConnectionState.Closed)
            {
                connection.Open();
            }
            SqlCommand cmd = new SqlCommand("SELECT * FROM UT_Mst_User where UserName='" + txtUserName.Text.Trim() + "';", connection);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            if (dt.Rows.Count >= 1)
            {
                return true;
            }
            else
            {
                return false;

            }
        }


        int UserID; DateTime Created_Date;
        string UserName, name, DOB, Contact, EmailID, State, City, Pincode, Address, Password, Deleted, Rec_Status;
        protected void OnClick_btnSignup(object sender, EventArgs e)
        {
            if (checkMemberExist())
            {
                Response.Write("<script>alert('Member already exist');</script>");
            }
            if (txtUserName.Text == "")
            {
                Response.Write("<script>alert('Please Enter User Name');</script>");
            }
            if (txtName.Text == "")
            {
                Response.Write("<script>alert('Please Enter Name');</script>");
            }
            if (txtEmail.Text == "")
            {
                Response.Write("<script>alert('Please Enter Email ID');</script>");
            }
            if (txtContact.Text == "")
            {
                Response.Write("<script>alert('Please Enter Contact No');</script>");
            }
            if (ddlState.SelectedIndex == 0)
            {
                Response.Write("<script>alert('Please Select State');</script>");
            }
            if (txtPass.Text=="")
            {
                Response.Write("<script>alert('Please Enter Password');</script>");
            }
            else
            {
                string result = "";
                UserID = Convert.ToInt32(hdnUserID.Value);
                UserName = txtUserName.Text;
                name = txtName.Text;
                DOB = txtDOB.Text;
                Contact = txtContact.Text;
                EmailID = txtEmail.Text;
                State = ddlState.SelectedValue;
                City = txtCity.Text;
                Pincode = txtPincode.Text;
                Address = txtAddress.Text;
                Password = txtPass.Text;
                Deleted = "No";
                Created_Date = DateTime.Now;
                Rec_Status = "Pending";
                Save();
                Initialization();
            }

        }
        protected void Save()
        {
            try
            {
                //using (SqlConnection connection = new SqlConnection(strcon))
                //{
                SqlConnection connection = new SqlConnection(strcon);
                if (connection.State == ConnectionState.Closed)
                {
                    connection.Open();

                }
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = connection;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "SP_UT_Mst_User";

                cmd.Parameters.AddWithValue("@UserID", UserID);
                cmd.Parameters.AddWithValue("@UserName", UserName);
                cmd.Parameters.AddWithValue("@Name", name);
                cmd.Parameters.AddWithValue("@DOB", DOB);
                cmd.Parameters.AddWithValue("@Contact", Contact);
                cmd.Parameters.AddWithValue("@EmailID", EmailID);
                cmd.Parameters.AddWithValue("@State", State);
                cmd.Parameters.AddWithValue("@City", City);
                cmd.Parameters.AddWithValue("@Pincode", Pincode);
                cmd.Parameters.AddWithValue("@Address", Address);
                cmd.Parameters.AddWithValue("@Password", Password);
                cmd.Parameters.AddWithValue("@Deleted", Deleted);
                cmd.Parameters.AddWithValue("@Created_Date", Created_Date);
                cmd.Parameters.AddWithValue("@Rec_Status", Rec_Status);

                cmd.ExecuteNonQuery();
                connection.Close();
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Sign Up SuccessFull');", true);
                //}
            }
            catch (Exception ex)
            {
                // Log the exception or display an error message to the user
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", $"alert('Error: {ex.Message}');", true);
            }
        }

    }
}