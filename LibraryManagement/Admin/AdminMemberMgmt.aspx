<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AdminMemberMgmt.aspx.cs" Inherits="LibraryManagement.Admin.AdminMemberMgmt" %>

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
                                <h4>Member Detail</h4>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12 text-center">
                                <img src="../img/imgs/generaluser.png" width="80px" />
                            </div>
                        </div>



                        <div class="row">
                            <div class="col-md-12">
                                <hr />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-3">
                                <div class="form-group">
                                    <label>Member ID</label>
                                    <div class="input-group">
                                        <asp:TextBox ID="txtMemberID" runat="server" CssClass="form-control" ToolTip="ID" placeholder="ID"></asp:TextBox>
                                        <asp:LinkButton ID="lnkGo" runat="server" ToolTip="Go" CssClass="btn btn-primary"><i class="fa-solid fa-circle-check"></i> </asp:LinkButton>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>Full Name</label>
                                    <asp:TextBox ID="txtFullName" runat="server" CssClass="form-control" ToolTip="FullName" placeholder="FullName"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-5">
                                <div class="form-group">
                                    <label>Account Status</label>
                                    <div class="input-group">
                                        <asp:TextBox ID="txtStatus" runat="server" CssClass="form-control" ToolTip="Status" ReadOnly="true" placeholder="Status"></asp:TextBox>
                                        <asp:LinkButton ID="btns" runat="server" CssClass="btn btn-success btn-sm mr-1"><i class="fa-solid fa-circle-check"></i> </asp:LinkButton>
                                        <asp:LinkButton ID="btns1" runat="server" CssClass="btn btn-warning btn-sm mr-1"><i class="fa-solid fa-pause"></i> </asp:LinkButton>
                                        <asp:LinkButton ID="btns2" runat="server" CssClass="btn btn-danger btn-sm mr-1"><i class="fa-solid fa-times"></i> </asp:LinkButton>
                                    </div>
                                </div>
                            </div>

                        </div>
                        <div class="row">
                            <div class="col-md-3">
                                <label>DOB</label>
                                <div class="form-group">
                                    <asp:TextBox ID="txtDOB" runat="server" CssClass="form-control" ToolTip="DOB" placeholder="DOB" ReadOnly="true"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <label>Contact No</label>
                                <div class="form-group">

                                    <asp:TextBox ID="txtContact" runat="server" CssClass="form-control" ToolTip="Contact No" placeholder="Contact No" ReadOnly="true"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-5">
                                <label>Email ID</label>
                                <div class="form-group">
                                    <asp:TextBox ID="txtEmailID" runat="server" CssClass="form-control" ToolTip="Email ID" placeholder="Email ID" ReadOnly="true"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-3">
                                <label>State</label>
                                <div class="form-group">
                                    <asp:TextBox ID="txtState" runat="server" CssClass="form-control" ToolTip="State" placeholder="State" ReadOnly="true"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <label>City</label>
                                <div class="form-group">

                                    <asp:TextBox ID="txtCity" runat="server" CssClass="form-control" ToolTip="City" placeholder="City" ReadOnly="true"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-5">
                                <label>Pincode</label>
                                <div class="form-group">
                                    <asp:TextBox ID="txtPincode" runat="server" CssClass="form-control" ToolTip="Pincode" placeholder="Pincode" ReadOnly="true"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                             <div class="col-md-12">
                                <label>Full Address</label>
                                <div class="form-group">
                                    <asp:TextBox ID="txtFullAddress" runat="server" CssClass="form-control" ToolTip="Address" placeholder="Address" TextMode="MultiLine" ReadOnly="true"></asp:TextBox>
                                </div>
                            </div>
                        </div>


                        <div class="row">
                            <div class="col-md-8 mx-auto">
                                <div class="form-group">
                                    <center>
                                        <asp:Button ID="btnDelete" runat="server" Text="Delete user permanently" class="btn btn-danger btn-lg btn-block" />
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
                                <h4>Member List</h4>
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

