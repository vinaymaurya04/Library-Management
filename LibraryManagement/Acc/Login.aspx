<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="LibraryManagement.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%--<asp:UpdatePanel ID="UpdatePanel1" runat="server">--%>
    <%--<ContentTemplate>--%>
    <%--<asp:MultiView ID="Multiview1" runat="server">
                <asp:View ID="view1" runat="server">--%>
    <div class="container">
        <div class="row">
            <div class="col-md-6 mx-auto">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                                    <img src="../img/imgs/generaluser.png" width="150px" />
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <center>
                                    <h4>Member Login</h4>
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <hr />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <div class="form-group">
                                    <%-- <label>Login ID</label>--%>
                                    <asp:TextBox ID="txtLoginID" runat="server" CssClass="form-control" ToolTip="Member ID" placeholder="Member ID"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <asp:TextBox ID="txtpass" runat="server" CssClass="form-control" ToolTip="Password" placeholder="Password"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <center>
                                        <asp:Button ID="btnLogin" runat="server" CssClass="btn btn-success btn-block btn-lg" Text="Login" OnClick="btnLogin_Click" />
                                    </center>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <%--<a href="SignUpPage.aspx">--%>
                                        <%--<input class="btn btn-info btn-block btn-lg" id="btnSignup" value="SignUp" /></a>--%>
                                    <asp:Button ID="btnSignUp" runat="server" CssClass="btn btn-info btn-block btn-lg" Text="Sign up" OnClick="btnSignUp_Click" />
                                </div>
                            </div>
                        </div>


                    </div>
                </div>
                <a href="HomePage.aspx"><< Back To HomePage</a><br />
                <br />
            </div>
        </div>
    </div>
    <%--  </asp:View>
            </asp:MultiView>--%>
    <%--  </ContentTemplate>
    </asp:UpdatePanel>--%>
</asp:Content>
