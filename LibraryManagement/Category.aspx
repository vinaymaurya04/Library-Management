<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Category.aspx.cs" Inherits="LibraryManagement.Category" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:UpdatePanel ID="updatePanel" runat="server">
        <ContentTemplate>
            <asp:MultiView ID="Multiview1" runat="server">
                <asp:View ID="view1" runat="server">
                    <div class="col-md-12 mx-auto">
                        <div class="card">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <div class="col-md-8">
                                            <label class="col-form-label">Category</label>
                                            <asp:TextBox ID="txtCategory" runat="server" ToolTip="Category" CssClass="form-control" placeholder="Category"></asp:TextBox>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-md -8">
                                                <label class="col-form-label">Status</label>
                                                <asp:DropDownList ID="ddlRec_Status" runat="server" CssClass="form-control input-sm">
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-md -8">
                                                <asp:Button ID="btnSave" runat="server" ClientIDMode="AutoID" CssClass="btn btn-sm btn-primary" OnClick="OnClick_BtnSave" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <asp:Repeater ID="rptList" runat="server">
                                        <HeaderTemplate>
                                            <tr>
                                                <th>Sr No</th>
                                                <th>Category</th>
                                                <th>Status</th>
                                                <th>Created By</th>
                                            </tr>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <tr>
                                                <td>
                                                    <asp:Label ID="lblSrNo" runat="server" Text='<%#Container.ItemIndex+1 %>'></asp:Label></td>
                                                <td><%#Eval("Category") %></td>
                                                <td><%#Eval("Status") %></td>
                                                <td><%#Eval("CreatedBy") %></td>
                                            </tr>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </div>
                            </div>
                        </div>

                    </div>
                </asp:View>
            </asp:MultiView>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
