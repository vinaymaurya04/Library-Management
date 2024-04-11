<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AdminBookIssue.aspx.cs" Inherits="LibraryManagement.Admin.AdminBookIssue" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-5">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-12 text-center">
                                <h4>Book Issuing</h4>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12 text-center">
                                <img src="../img/imgs/books.png" width="80px" />
                            </div>
                        </div>



                        <div class="row">
                            <div class="col-md-12">
                                <hr />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Member ID</label>
                                    <asp:TextBox ID="txtMemberID" runat="server" CssClass="form-control" ToolTip="ID" placeholder="ID"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Book ID</label>
                                    <div class="input-group">
                                        <asp:TextBox ID="txtBookID" runat="server" CssClass="form-control" ToolTip="ID" placeholder="ID"></asp:TextBox>
                                        <asp:Button ID="btnGo" runat="server" CssClass="btn btn-primary" Text="Go" />
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Member Name</label>
                                    <asp:TextBox ID="txtMemberName" runat="server" CssClass="form-control" ToolTip="Member Name" placeholder="Member Name" ReadOnly="true"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Book Name</label>
                                    <asp:TextBox ID="txtBookName" runat="server" CssClass="form-control" ToolTip="Book Name" placeholder="Book Name" ReadOnly="true"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>From Date</label>
                                    <asp:TextBox ID="txtFromDT" runat="server" CssClass="form-control" ToolTip="From Date" TextMode="Date" placeholder="From Date"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>To Date</label>
                                    <asp:TextBox ID="txtToDT" runat="server" CssClass="form-control" ToolTip="From Date" TextMode="Date" placeholder="From Date"></asp:TextBox>
                                </div>
                            </div>
                        </div>


                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <center>
                                        <asp:Button ID="btnAdd" runat="server" Text="Issuing" class="btn btn-primary btn-block btn-lg" />
                                    </center>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <center>
                                        <asp:Button ID="btnDelete" runat="server" Text="Delete" class="btn btn-success btn-lg btn-block" />
                                    </center>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <a href="../HomePage.aspx"><< HomePage</a>
            </div>
            <div class="col-md-7">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-12 text-center">
                                <h4>Issued Book List</h4>
                            </div>
                        </div>



                        <div class="row">
                            <div class="col-md-12">
                                <hr />
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
