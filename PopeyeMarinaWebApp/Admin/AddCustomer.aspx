 <%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeBehind="AddCustomer.aspx.cs" Inherits="PopeyeMarinaWebApp.Admin.AddCustomer" %>
<asp:Content ID="Content1" ContentPlaceHolderID="SubContent" runat="server">
    <h3>Customers</h3>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:ValidationSummary ID="ValidationSummary" CssClass="alert-danger" ShowModelStateErrors="true" ShowSummary="true" runat="server" />
            <asp:FormView ID="CustomerFormAdd" runat="server"
                        ItemType="PopeyeMarinaWebApp.Models.Customer" 
                        DataKeyNames="CustomerID" 
                        RenderOuterTable="false" 
                        DefaultMode="Insert"
                        SelectMethod="CustomerFormAdd_GetItem"
                        InsertMethod="CustomerForm_InsertItem" 
                        OnItemInserted="CustomerForm_ItemInserted">
                        <InsertItemTemplate>
                            <div class="form-horizontal">
                                <fieldset>
                                    <legend>Add Customer</legend>
                                        <div class="form-group">
                                        <label for="name" class="col-lg-2 control-label">Name:</label>
                                        <div class="col-lg-10">
                                            <asp:TextBox ID="name" runat="server" Text="<%#: BindItem.Name %>" ValidationGroup="Insert"></asp:TextBox>                          
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="address" class="col-lg-2 control-label">Address:</label>
                                        <div class="col-lg-10">
                                            <asp:TextBox ID="address" runat="server" Text="<%#: BindItem.Address %>" ValidationGroup="Insert"></asp:TextBox>                      
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="phone" class="col-lg-2 control-label">Phone:</label>
                                        <div class="col-lg-10">
                                            <asp:TextBox ID="phone" runat="server" Text="<%#: BindItem.Phone %>" ValidationGroup="Insert"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="email" class="col-lg-2 control-label">Email:</label>
                                        <div class="col-lg-10">
                                            <asp:TextBox ID="email" runat="server" Text="<%#: BindItem.Email %>" ValidationGroup="Insert"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-lg-12">
                                        <asp:Button ID="InsertButton" runat="server" Text="Insert" CausesValidation="True" CssClass="btn btn-primary btn-sm" CommandName="Insert" />
                                        <asp:Button ID="CancelButton" runat="server" Text="Cancel" CssClass="btn btn-primary btn-sm" CommandName="Cancel" OnClick="CancelButton_Click" /> 
                                    </div>
                                </fieldset>
                            </div>
                        </InsertItemTemplate>
                        </asp:FormView>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
