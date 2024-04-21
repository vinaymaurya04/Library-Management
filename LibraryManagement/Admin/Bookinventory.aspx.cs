using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LibraryManagement.Admin
{
    public partial class Bookinventory : System.Web.UI.Page
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
            hdnBookID.Value = "0";
            txtBookNo.Text = "";
            txtBookName.Text = "";
            txtEdition.Text = "";
            txtbookcost.Text = "";
            txtPages.Text = "";
            txtActualStock.Text = "";
            txtCurrentStock.Text = "";
            txtIssuedBook.Text = "";
            ddlLanguage.SelectedIndex = 0;
            FillAuthor();
            ddlAuthorName.SelectedIndex = 0;
            FillPublisher();
            ddlPublisherName.SelectedIndex = 0;
        }
        #region Fill
        protected void FillAuthor()
        {
            OP = "GetAuhor";
            OPID = "";
            OPID1 = "";
            DataTable dt = Get_Data();
            ddlAuthorName.DataSource = dt;
            ddlAuthorName.DataValueField = "AuthorID";
            ddlAuthorName.DataTextField = "AuthorName";
            ddlAuthorName.DataBind();
        }
        protected void FillPublisher()
        {
            OP = "GetPublisher";
            OPID = "";
            OPID1 = "";
            DataTable dt = Get_Data();
            ddlPublisherName.DataSource = dt;
            ddlPublisherName.DataValueField = "PublisherID";
            ddlPublisherName.DataTextField = "PublisherName";
            ddlPublisherName.DataBind();
        }
        #endregion
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
            SqlCommand cmd = new SqlCommand("SELECT * FROM UT_Mst_Book where BookNo='" + txtBookNo.Text.Trim() + "';", connection);
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
        int BookID, AuthorID, PublisherID; DateTime Created_Date;
        string BookNo, BookName, Rec_Status, Created_UserName, Genre, filePath, Language, PublisherName, AuthorName, PublisherDT, Edition, BookCost, Pages, ActualStock,
            CurrentStock, IssuedBook, Img;
        protected void OnClick_btnSave(object sender, EventArgs e)
        {
            try
            {
                if (checkMemberExist())
                {
                    Response.Write("<script>alert('Book ID already exist');</script>");
                }
                if (txtBookName.Text == "")
                {
                    Response.Write("<script>alert('Book Name cannot be Blank');</script>");
                }
                else
                {
                    foreach (int i in ListBox1.GetSelectedIndices())
                    {
                        Genre = Genre + ListBox1.Items[i] + ",";
                    }
                    Genre = Genre.Remove(Genre.Length - 1);



                    //string Filepath = "~/Book_Inventory/";
                    //string FileName = Path.GetFileName(Fileupload1.PostedFile.FileName);
                    //string ServerFilepath = Server.MapPath("Book_Inventory/" + FileName);
                    //if (!Directory.Exists(Server.MapPath("Book_Inventory")))
                    //{
                    //    Directory.CreateDirectory(Server.MapPath("Book_Inventory"));
                    //}
                    //Fileupload1.SaveAs(ServerFilepath);
                    if (Fileupload1.HasFiles)
                    {
                        string rootPath = Server.MapPath("~");
                        string relativePath = Path.Combine("Admin", "Book_Inventory");
                        string fullDirectoryPath = Path.Combine(rootPath, relativePath);

                        if (!Directory.Exists(fullDirectoryPath))
                        {
                            Directory.CreateDirectory(fullDirectoryPath);
                        }
                        string fileName = Path.GetFileName(Fileupload1.PostedFile.FileName);
                        filePath = Path.Combine(fullDirectoryPath, fileName);
                        Fileupload1.SaveAs(filePath);
                    }

                    BookID = Convert.ToInt32(hdnBookID.Value);
                    BookName = txtBookName.Text;
                    BookNo = txtBookNo.Text;
                    PublisherID = Convert.ToInt32(ddlPublisherName.SelectedValue);
                    AuthorID = Convert.ToInt32(ddlAuthorName.SelectedValue);
                    Genre = ListBox1.SelectedValue;
                    Edition = txtEdition.Text;
                    BookCost = txtbookcost.Text;
                    Pages = txtPages.Text;
                    ActualStock = txtActualStock.Text;
                    CurrentStock = txtCurrentStock.Text;
                    IssuedBook = txtIssuedBook.Text;
                    //Rec_Status = ddlRecStatus.SelectedValue;
                    Created_UserName = Session["Role"].ToString();
                    Created_Date = DateTime.Now;
                    Img = filePath;

                    Save();
                    Initialization();
                }

            }
            catch (Exception exzz)

            {

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
                cmd.CommandText = "SP_UT_Mst_Book";

                cmd.Parameters.AddWithValue("@BookID", BookID);
                cmd.Parameters.AddWithValue("@BookName", BookName);
                cmd.Parameters.AddWithValue("@BookNo", BookNo);
                cmd.Parameters.AddWithValue("@AuthorID", AuthorID);
                cmd.Parameters.AddWithValue("@PublisherID", PublisherID);
                cmd.Parameters.AddWithValue("@Genre", Genre);
                cmd.Parameters.AddWithValue("@Edition", Edition);
                cmd.Parameters.AddWithValue("@BookCost", BookCost);
                cmd.Parameters.AddWithValue("@Pages", Pages);
                cmd.Parameters.AddWithValue("@ActualStock", ActualStock);
                cmd.Parameters.AddWithValue("@CurrentStock", CurrentStock);
                cmd.Parameters.AddWithValue("@IssuedBook", IssuedBook);
                cmd.Parameters.AddWithValue("@Img", Img);
                cmd.Parameters.AddWithValue("@Created_Date", Created_Date);
                cmd.Parameters.AddWithValue("@Created_UserName", Created_UserName);

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
            cmd.CommandText = "SP_UT_Mst_Book_Get";
            cmd.Parameters.AddWithValue("@OP", OP);
            cmd.Parameters.AddWithValue("@OPID", OPID);
            cmd.Parameters.AddWithValue("@OPID1", OPID1);
            SqlDataReader rd = cmd.ExecuteReader();
            DataTable dt = new DataTable();
            dt.Load(rd);
            return dt;
        }
        #region Edit
        protected void OnClick_lnkUpdate(object sender, EventArgs e)
        {
            LinkButton lnkUpdate = (LinkButton)sender;
            RepeaterItem row = (RepeaterItem)lnkUpdate.NamingContainer;
            HiddenField GrdhdnBookID = (HiddenField)row.FindControl("GrdhdnBookID");
            SetValue(Convert.ToInt32(GrdhdnBookID.Value));
        }
        public void SetValue(int PK)
        {
            OP = "GetEdit";
            OPID = PK.ToString();
            OPID1 = "";
            SetValueToEdit();
            txtBookName.Text = BookName;
            txtBookNo.Text = BookNo;
            //ddlRecStatus.SelectedValue = Rec_Status;
        }
        public void SetValueToEdit()
        {
            DataTable dt = Get_Data();
            if (dt.Rows.Count > 0)
            {
                BookID = Convert.ToInt32(dt.Rows[0]["BookID"].ToString());
                BookName = dt.Rows[0]["BookName"].ToString();
                BookNo = dt.Rows[0]["BookNo"].ToString();
                //Rec_Status = dt.Rows[0]["Rec_Status"].ToString();
            }
        }
        #endregion

    }
}