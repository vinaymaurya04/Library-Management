using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LibraryManagement.Admin
{
    public partial class Admin_Publisher_Mgnt : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["Con"].ConnectionString;
        string OP, OPID, OPID1;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Initialization();
                RefreshGrid();
            }
        }
        protected void Initialization()
        {
            hdnPublisherID.Value = "0";
            txtPublisherName.Text = "";
            txtID.Text = "";
            ddlRecStatus.SelectedIndex = 0;
        }
        #region RefreshGrid
        protected void RefreshGrid()
        {
            OP = "GetList";
            OPID = "";
            OPID1 = "";
            DataTable dt = Get_Data();
            rptList.DataSource = dt;
            rptList.DataBind();
        }
        #endregion
        #region checkDuplicate
        bool checkMemberExist()
        {
            SqlConnection connection = new SqlConnection(strcon);
            if (connection.State == ConnectionState.Closed)
            {
                connection.Open();
            }
            SqlCommand cmd = new SqlCommand("SELECT * FROM UT_Mst_Publisher where PublisherNo='" + txtID.Text.Trim() + "';", connection);
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
        #endregion
        int PublisherID; DateTime Created_Date;
        string PublisherNo, PublisherName, Rec_Status, Created_UserName;
        protected void OnClick_btnSave(object sender, EventArgs e)
        {
            if (checkMemberExist())
            {
                Response.Write("<script>alert('Publisher ID already exist');</script>");
            }
            if (txtPublisherName.Text == "")
            {
                Response.Write("<script>alert('Publisher Name cannot be Blank');</script>");
            }
            else
            {
                PublisherID = Convert.ToInt32(hdnPublisherID.Value);
                PublisherName = txtPublisherName.Text;
                PublisherNo = txtID.Text;
                Rec_Status = ddlRecStatus.SelectedValue;
                Created_UserName = Session["Role"].ToString();
                Created_Date = DateTime.Now;
                Save();
            }
        }
        protected void Save()
        {
            try
            {
                SqlConnection connection = new SqlConnection(strcon);
                if (connection.State == ConnectionState.Closed)

                {
                    connection.Open();

                }
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = connection;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "SP_UT_Mst_Publisher";

                cmd.Parameters.AddWithValue("@PublisherID", PublisherID);
                cmd.Parameters.AddWithValue("@PublisherName", PublisherName);
                cmd.Parameters.AddWithValue("@Rec_Status", Rec_Status);
                cmd.Parameters.AddWithValue("@Created_Date", Created_Date);
                cmd.Parameters.AddWithValue("@Created_UserName", Created_UserName);
                cmd.Parameters.AddWithValue("@PublisherNo", PublisherNo);

                cmd.ExecuteNonQuery();
                connection.Close();
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Save SuccessFull');", true);
            }
            catch (Exception ex)
            {
                // Log the exception or display an error message to the user
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", $"alert('Error: {ex.Message}');", true);
            }
        }
        protected void Onclick_btnReset(object sender, EventArgs e)
        {
            Initialization();
        }
        protected void OnClick_lnkUpdate(object sender, EventArgs e)
        {
            LinkButton lnkUpdate = (LinkButton)sender;
            RepeaterItem row = (RepeaterItem)lnkUpdate.NamingContainer;
            HiddenField GrdhdnPublishrID = (HiddenField)row.FindControl("GrdhdnPublishrID");
            SetValue(Convert.ToInt32(GrdhdnPublishrID.Value));
        }
        public void SetValue(int PK)
        {
            OP = "GetEdit";
            OPID = PK.ToString();
            OPID1 = "";
            SetValueToEdit();
            txtPublisherName.Text = PublisherName;
            txtID.Text = PublisherNo;
            ddlRecStatus.SelectedValue = Rec_Status;
        }
        public void SetValueToEdit()
        {
            DataTable dt = Get_Data();
            if (dt.Rows.Count > 0)
            {
                PublisherID = Convert.ToInt32(dt.Rows[0]["PublisherID"].ToString());
                PublisherName = dt.Rows[0]["PublisherName"].ToString();
                PublisherNo = dt.Rows[0]["PublisherNo"].ToString();
                Rec_Status = dt.Rows[0]["Rec_Status"].ToString();
            }
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
            cmd.CommandText = "SP_UT_Mst_Publisher_Get";
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