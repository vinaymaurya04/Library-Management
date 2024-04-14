using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LibraryManagement
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["Role"] == null || Session["Role"].Equals(""))
                {
                    userlogin.Visible = true;
                    signup.Visible = true;
                    logOut.Visible = false;
                    lnkHellouser.Visible = false;

                    //Admin
                    AdminLoginbtn.Visible = true;
                    AuthorManag.Visible = false;
                    publisher.Visible = false;
                    BookInv.Visible = false;
                    BookIssue.Visible = false;
                }
                else if (Session["Role"].Equals("User"))
                {
                    userlogin.Visible = false;
                    signup.Visible = false;
                    logOut.Visible = true;
                    lnkHellouser.Visible = true;
                    lnkHellouser.Text = "Hello" + Session["UserName"].ToString();

                    AdminLoginbtn.Visible = true;
                    AuthorManag.Visible = false;
                    publisher.Visible = false;
                    BookInv.Visible = false;
                    BookIssue.Visible = false;
                }
                else if (Session["Role"].Equals("Admin"))
                {
                    userlogin.Visible = false;
                    signup.Visible = false;
                    logOut.Visible = true;
                    lnkHellouser.Visible = true;
                    lnkHellouser.Text = "Hello Admin";

                    AdminLoginbtn.Visible = false;
                    AuthorManag.Visible = true;
                    publisher.Visible = true;
                    BookInv.Visible = true;
                    BookIssue.Visible = true;
                }
            }
            catch (Exception ex)
            {

            }
        }

        protected void AdminLoginbtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Admin/AdminLoginPage.aspx");
        }
        protected void OnClick_AuthorManag(object sender, EventArgs e)
        {
            Response.Redirect("/Admin/Admin_AuthorManagement.aspx");
        }
        protected void OnClick_publisher(object sender, EventArgs e)
        {
            Response.Redirect("/Admin/Admin_Publisher_Mgnt.aspx");
        }
        protected void OnClick_BookInv(object sender, EventArgs e)
        {
            Response.Redirect("/Admin/Bookinventory.aspx");
        }
        protected void OnClick_BookIssue(object sender, EventArgs e)
        {
            Response.Redirect("/Admin/AdminBookIssue.aspx");
        }

        protected void OnClick_userlogin(object sender, EventArgs e)
        {
            Response.Redirect("/Acc/Login.aspx");
        }
        protected void OnClick_signup(object sender, EventArgs e)
        {
            Response.Redirect("/Acc/SignUpPage.aspx");
        }
        protected void OnClick_logOut(object sender, EventArgs e)
        {
            Session["UserName"] = "";
            Session["Name"] = "";
            Session["Rec_Status"] = "";
            Session["Role"] = "";

            userlogin.Visible = true;
            signup.Visible = true;
            logOut.Visible = false;
            lnkHellouser.Visible = false;
            lnkHellouser.Text = "";

            //Admin
            AdminLoginbtn.Visible = true;
            AuthorManag.Visible = false;
            publisher.Visible = false;
            BookInv.Visible = false;
            BookIssue.Visible = false;
            Response.Redirect("/Acc/HomePage.aspx");


        }
        protected void OnClick_lnkHome(object sender, EventArgs e)
        {
            Response.Redirect("/Acc/HomePage.aspx");
        }

    }
}