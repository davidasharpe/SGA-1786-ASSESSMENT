<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GridViewRadioButtons.aspx.cs" Inherits="PopeyeMarinaWebApp.Templates.GridViewRadioButtons" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
         <asp:UpdatePanel ID="UpdatePanel1" UpdateMode="Conditional" runat="server">
        <ContentTemplate>
            <div style="float:left; width:70%"><h3>Customer</h3></div>
            <div style ="float:right; width:30%; padding-top: 20px">
                <asp:Button ID="Select" CssClass="btn btn-primary btn-sm" runat="server" Text="Select" OnClick="SelectButton_Click" />
                <asp:Button ID="Add" CssClass="btn btn-primary btn-sm" runat  ="server" Text="Add Customer" PostBackUrl="~/Admin/AddCustomers.aspx" />
            </div>
            <asp:ValidationSummary ID="ValidationSummary1" ShowModelStateErrors="true" runat="server" />
            Selected ID:<asp:Label ID="SelectedIDLabel" runat="server" Text="Label"></asp:Label>
            <asp:GridView runat="server" ID="CustomersGrid"
                ItemType="PopeyeMarinaWebApp.Models.Customer" DataKeyNames="CustomerID" 
                SelectMethod="CustomersGrid_GetData"
                AutoGenerateColumns="false" OnRowCreated="CustomersGrid_RowCreated" 
                CssClass="table table-striped table-hover" 
                AllowPaging="True" AllowSorting="True">
                <Columns>
                    <asp:TemplateField HeaderText="">
                      <ItemTemplate>
                          <asp:Literal ID="RadioButtonMarkup" runat="server"></asp:Literal>
                      </ItemTemplate>
                    </asp:TemplateField>
                    <asp:DynamicField DataField="CustomerID" />
                    <asp:DynamicField DataField="Name" />
                    <asp:DynamicField DataField="Address" />
                    <asp:DynamicField DataField="Phone" /> 
                    <asp:DynamicField DataField="Email" />     
                </Columns>
            </asp:GridView>
            <h3>Update Customer</h3>
            Selected ID:<asp:Label ID="SelectedIDLabel2" runat="server" Text="Label"></asp:Label>
            <asp:ValidationSummary ID="ValidationSummary2" ShowModelStateErrors="true" runat="server" />
         </ContentTemplate> 
    </asp:UpdatePanel>
    </div>
    </form>
</body>
</html>
