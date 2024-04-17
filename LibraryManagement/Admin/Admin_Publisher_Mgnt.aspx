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
                                        <%--<asp:Button ID="btnGo" runat="server" CssClass="btn btn-primary" Text="Go" />--%>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-8">
                                <div class="form-group">
                                    <label>Publisher Name</label>
                                    <asp:TextBox ID="txtPublisherName" runat="server" CssClass="form-control" ToolTip="Publisher Name" placeholder="Publisher Name"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Status</label>
                                    <asp:DropDownList ID="ddlRecStatus" runat="server" CssClass="form-control">
                                        <asp:ListItem Text="Active" Value="Active"></asp:ListItem>
                                        <asp:ListItem Text="InActive" Value="InActive"></asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                        </div>


                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <center>
                                        <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="OnClick_btnSave" class="btn btn-success btn-lg" />
                                        <asp:Button ID="btnReset" runat="server" Text="Reset" OnClick="Onclick_btnReset" class="btn btn-primary btn-lg" />
                                        <asp:HiddenField ID="hdnPublisherID" runat="server" Value="0" />
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
                                <h4>Publisher List</h4>
                            </div>
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-12 table-responsive">
                                        <asp:Repeater ID="rptList" runat="server">
                                            <HeaderTemplate>
                                                <table id="tblList" class="table table-bordered table-hover" clientidmode="Static">
                                                    <thead>
                                                        <tr>
                                                            <th>Action</th>
                                                            <th>Sr No</th>
                                                            <th>Publisher No</th>
                                                            <th>Publisher Name</th>
                                                            <th>Created Date</th>
                                                            <th>Status</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <tr>
                                                    <td>
                                                        <asp:LinkButton ID="lnkUpdate" runat="server" OnClick="OnClick_lnkUpdate" CssClass="btn btn-primary btn-sm"><i class="fas fa-edit"></i></asp:LinkButton>
                                                        <asp:HiddenField ID="GrdhdnPublishrID" runat="server" Value='<%#Eval("PublisherID") %>' />
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="lblSrNo" runat="server" Text='<%# Container.ItemIndex+1 %>'></asp:Label></td>
                                                    <td><%#Eval("PublisherNo") %></td>
                                                    <td><%#Eval("PublisherName") %></td>
                                                    <td><%#Eval("CreatedDT") %></td>
                                                    <td><%#Eval("Rec_Status") %></td>
                                                </tr>
                                            </ItemTemplate>
                                            <FooterTemplate>
                                                </tbody>
                                        </table>
                                            </FooterTemplate>
                                        </asp:Repeater>
                                    </div>
                                </div>

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
