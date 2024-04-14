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
    public partial class Login : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["Con"].ConnectionString;
        string OP, OPID, OPID1;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                Initialization();
        }
        protected void Initialization()
        {
            txtLoginID.Text = "";
            txtpass.Text = "";
        }
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            OP = "GetLogin";
            OPID = txtLoginID.Text;
            OPID1 = txtpass.Text;
            DataTable dt = Get_Data();
            if (dt.Rows.Count > 0)
            {
                foreach (DataRow row in dt.Rows)
                {
                    Response.Write("<script>alert('" + dt.Rows[0]["Password"].ToString() + "');</script>");
                    Session["UserName"] = dt.Rows[0]["UserName"].ToString();
                    Session["Name"] = dt.Rows[0]["Name"].ToString();
                    Session["Rec_Status"] = dt.Rows[0]["Rec_Status"].ToString();
                    Session["Role"] = "User";
                }
                Response.Redirect("../Acc/HomePage.aspx");

            }
            else
            {
                Response.Write("<script>alert('Invalid Credential');</script>");
                Initialization();
            }

        }
        protected void btnSignUp_Click(object sender, EventArgs e)
        {
            Response.Redirect("../Acc/SignUpPage.aspx");
        }

        public DataTable Get_Data()
        {
            SqlConnection connection = new SqlConnection(strcon);
            if (connection.State == ConnectionState.Closed)
            {
                connection.Open();
            }
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = connection;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "SP_UT_UT_Mst_User_Get";
            cmd.Parameters.AddWithValue("@OP", OP);
            cmd.Parameters.AddWithValue("@OPID", OPID);
            cmd.Parameters.AddWithValue("@OPID1", OPID1);
            SqlDataReader rd = cmd.ExecuteReader();
            DataTable dt = new DataTable();
            dt.Load(rd);
            return dt;
        }
    }
}