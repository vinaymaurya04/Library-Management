<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Admin_AuthorManagement.aspx.cs" Inherits="LibraryManagement.Admin.Admin_AuthorManagement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script type="text/javascript">
        $(document).ready(function () {
            // Your DataTables initialization code here
            $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).DataTable();
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-5">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-12 text-center">
                                <h4>Author Details</h4>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12 text-center">
                                <img src="../img/imgs/writer.png" width="80px" />
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
                                    <label>Author ID</label>
                                    <div class="input-group">
                                        <asp:TextBox ID="txtID" runat="server" CssClass="form-control" ToolTip="ID" placeholder="ID"></asp:TextBox>
                                        <%--<asp:Button ID="btnGo" runat="server" CssClass="btn btn-primary" Text="Go" />--%>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Author Name</label>
                                    <asp:TextBox ID="txtAuthorName" runat="server" CssClass="form-control" ToolTip="Author Name" placeholder="Author Name"></asp:TextBox>
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
                                        <asp:HiddenField ID="hdnAuthorID" runat="server" Value="0" />
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
                    <div class="card-header">
                        <h4>Author List</h4>
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
                                                    <th>Author No</th>
                                                    <th>Author Name</th>
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
                                                <asp:HiddenField ID="GrdhdnAuthorID" runat="server" Value='<%#Eval("AuthorID") %>' />
                                            </td>
                                            <td>
                                                <asp:Label ID="lblSrNo" runat="server" Text='<%# Container.ItemIndex+1 %>'></asp:Label></td>
                                            <td><%#Eval("AuthoUniqeNo") %></td>
                                            <td><%#Eval("AuthorName") %></td>
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
            </div>
        </div>
    </div>
</asp:Content>
