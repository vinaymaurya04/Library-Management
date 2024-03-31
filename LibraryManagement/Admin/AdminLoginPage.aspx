<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AdminLoginPage.aspx.cs" Inherits="LibraryManagement.AdminLoginPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-6 mx-auto">
                <div class="card">
                    <div class="card-body">
                        <div class="col-md-12">
                            <center>
                                <img src="../img/imgs/adminuser.png" width="150px" />
                            </center>
                        </div>
                        <div class="row">
                            <div class="col-md-12 text-center">
                                <h4>Admin Login</h4>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <hr />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label>Admin</label>
                                    <asp:TextBox ID="txtadmLogin" runat="server" CssClass="form-control" ToolTip="ID" placeholder="Admin ID"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label>Password</label>
                                    <asp:TextBox ID="txtadmPass" runat="server" CssClass="form-control" ToolTip="Password" placeholder="Password"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <center>
                                        <asp:Button ID="btnLogin" runat="server" Text="Login" class="btn btn-success btn-block btn-lg" />
                                    </center>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <a href="../HomePage.aspx"><< HomePage</a>
            </div>
        </div>
    </div>
</asp:Content>
