﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Bookinventory.aspx.cs" Inherits="LibraryManagement.Admin.Bookinventory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        function readURL(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    $('#imgview').attr('src', e.target.result);
                };
                reader.readAsDataURL(input.files[0]);
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-5">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-12 text-center">
                                <h4>Book Detail</h4>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12 text-center">
                                <img id="imgview" src="../img/imgs/books.png" width="80px" />
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-12">
                                <hr />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <asp:FileUpload ID="Fileupload1" CssClass="form-control" runat="server" onchange="readURL(this);" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>Book ID</label>
                                    <div class="input-group">
                                        <asp:TextBox ID="txtBookNo" runat="server" CssClass="form-control" ToolTip="ID" placeholder="ID"></asp:TextBox>
                                        <%--<asp:LinkButton ID="lnkGo" runat="server" ToolTip="Go" CssClass="btn btn-primary"><i class="fa-solid fa-circle-check"></i> </asp:LinkButton>--%>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-8">
                                <div class="form-group">
                                    <label>Book Name</label>
                                    <asp:TextBox ID="txtBookName" runat="server" CssClass="form-control" ToolTip="Book Name" placeholder="Book  Name"></asp:TextBox>
                                </div>
                            </div>

                        </div>
                        <div class="row">
                            <div class="col-md-4">
                                <label>Language</label>
                                <div class="form-group">
                                    <asp:DropDownList class="form-control" ID="ddlLanguage" runat="server">
                                        <asp:ListItem Text="English" Value="English" />
                                        <asp:ListItem Text="Hindi" Value="Hindi" />
                                        <asp:ListItem Text="Marathi" Value="Marathi" />
                                        <asp:ListItem Text="French" Value="French" />
                                        <asp:ListItem Text="German" Value="German" />
                                        <asp:ListItem Text="Urdu" Value="Urdu" />
                                    </asp:DropDownList>
                                </div>
                                <label>Publisher Name</label>
                                <div class="form-group">
                                    <asp:DropDownList class="form-control" ID="ddlPublisherName" runat="server">
                                       <%-- <asp:ListItem Text="Publisher 1" Value="Publisher 1" />
                                        <asp:ListItem Text="Publisher 2" Value="Publisher 2" />--%>
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <label>Author Name</label>
                                <div class="form-group">
                                    <asp:DropDownList class="form-control" ID="ddlAuthorName" runat="server">
                                      <%--  <asp:ListItem Text="A1" Value="a1" />
                                        <asp:ListItem Text="a2" Value="a2" />--%>
                                    </asp:DropDownList>
                                </div>
                                <label>Publish Date</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox3" runat="server" placeholder="Date" TextMode="Date"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <label>Genre</label>
                                <div class="form-group">
                                    <asp:ListBox CssClass="form-control" ID="ListBox1" runat="server" SelectionMode="Multiple" Rows="5">
                                        <asp:ListItem Text="Action" Value="Action" />
                                        <asp:ListItem Text="Adventure" Value="Adventure" />
                                        <asp:ListItem Text="Comic Book" Value="Comic Book" />
                                        <asp:ListItem Text="Self Help" Value="Self Help" />
                                        <asp:ListItem Text="Motivation" Value="Motivation" />
                                        <asp:ListItem Text="Healthy Living" Value="Healthy Living" />
                                        <asp:ListItem Text="Wellness" Value="Wellness" />
                                        <asp:ListItem Text="Crime" Value="Crime" />
                                        <asp:ListItem Text="Drama" Value="Drama" />
                                        <asp:ListItem Text="Fantasy" Value="Fantasy" />
                                        <asp:ListItem Text="Horror" Value="Horror" />
                                        <asp:ListItem Text="Poetry" Value="Poetry" />
                                        <asp:ListItem Text="Personal Development" Value="Personal Development" />
                                        <asp:ListItem Text="Romance" Value="Romance" />
                                        <asp:ListItem Text="Science Fiction" Value="Science Fiction" />
                                        <asp:ListItem Text="Suspense" Value="Suspense" />
                                        <asp:ListItem Text="Thriller" Value="Thriller" />
                                        <asp:ListItem Text="Art" Value="Art" />
                                        <asp:ListItem Text="Autobiography" Value="Autobiography" />
                                        <asp:ListItem Text="Encyclopedia" Value="Encyclopedia" />
                                        <asp:ListItem Text="Health" Value="Health" />
                                        <asp:ListItem Text="History" Value="History" />
                                        <asp:ListItem Text="Math" Value="Math" />
                                        <asp:ListItem Text="Textbook" Value="Textbook" />
                                        <asp:ListItem Text="Science" Value="Science" />
                                        <asp:ListItem Text="Travel" Value="Travel" />
                                    </asp:ListBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>Edition </label>
                                    <asp:TextBox ID="txtEdition" runat="server" CssClass="form-control" ToolTip="Edition" placeholder="Edition"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>Book Cost (per unit)</label>
                                    <asp:TextBox ID="txtbookcost" runat="server" CssClass="form-control" ToolTip="Book Cost" placeholder="Book Cost"></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>Pages</label>
                                    <asp:TextBox ID="txtPages" runat="server" CssClass="form-control" ToolTip="Pages" placeholder="Pages"></asp:TextBox>
                                </div>
                            </div>


                        </div>
                        <div class="row">
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>Actual Stock </label>
                                    <asp:TextBox ID="txtActualStock" runat="server" CssClass="form-control" ToolTip="Actual Stock" placeholder="Actual Stock"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>Current Stock</label>
                                    <asp:TextBox ID="txtCurrentStock" runat="server" CssClass="form-control" ReadOnly="true" ToolTip="Current Stock" placeholder="Current Stock"></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>Issued Book</label>
                                    <asp:TextBox ID="txtIssuedBook" runat="server" CssClass="form-control" ReadOnly="true" ToolTip="Issued Book" placeholder="Issued Book"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <center>
                                        <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="OnClick_btnSave" class="btn btn-success btn-lg" />
                                        <asp:Button ID="btnReset" runat="server" Text="Reset" OnClick="Onclick_btnReset" class="btn btn-primary btn-lg" />
                                        <asp:HiddenField ID="hdnBookID" runat="server" Value="0" />
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
                        <h4>Book List</h4>
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
                                                    <th>Book No</th>
                                                    <th>Book Name</th>
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
                                                <asp:HiddenField ID="GrdhdnBookID" runat="server" Value='<%#Eval("BookID") %>' />
                                            </td>
                                            <td>
                                                <asp:Label ID="lblSrNo" runat="server" Text='<%# Container.ItemIndex+1 %>'></asp:Label></td>
                                            <td><%#Eval("BookNo") %></td>
                                            <td><%#Eval("BookName") %></td>
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
