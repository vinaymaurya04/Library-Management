<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Admin_Publisher_Mgnt.aspx.cs" Inherits="LibraryManagement.Admin.Admin_Publisher_Mgnt" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-5">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-12 text-center">
                                <h4>Publisher Details</h4>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12 text-center">
                                <img src="../img/imgs/publisher.png" width="80px" />
                            </div>
                        </div>



                        <div class="row">
                            <div class="col-md-12">
                                <hr />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>Publisher ID</label>
                                    <div class="input-group">
                                        <asp:TextBox ID="txtID" runat="server" CssClass="form-control" ToolTip="ID" placeholder="ID"></asp:TextBox>
                                        <asp:Button ID="btnGo" runat="server" CssClass="btn btn-primary" Text="Go" />
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-8">
                                <div class="form-group">
                                    <label>Publisher Name</label>
                                    <asp:TextBox ID="txtPublisherName" runat="server" CssClass="form-control" ToolTip="Publisher Name" placeholder="Publisher Name"></asp:TextBox>
                                </div>
                            </div>
                        </div>


                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <center>
                                        <asp:Button ID="btnAdd" runat="server" Text="Add" class="btn btn-success btn-lg" />
                                        <asp:Button ID="btnUpdate" runat="server" Text="Update" class="btn btn-primary btn-lg" />
                                        <asp:Button ID="btnDelete" runat="server" Text="Delete" class="btn btn-danger btn-lg" />
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
                                <h4>Author List</h4>
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
