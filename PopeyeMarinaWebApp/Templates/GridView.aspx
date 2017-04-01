<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GridView.aspx.cs" Inherits="PopeyeMarinaWebApp.Template.GridView" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:GridView runat="server" ID="Grid"
            ItemType="PopeyeMarinaWebApp.Models.Customer" 
            DataKeyNames="" 
            SelectMethod="_GetData"
            AutoGenerateColumns="false"  
            CssClass="table table-striped table-hover" 
            AllowPaging="True" AllowSorting="True"> 
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:DynamicField DataField="" />
                <asp:DynamicField DataField="" />
                <asp:DynamicField DataField="" />
                <asp:DynamicField DataField="" /> 
                <asp:DynamicField DataField="" />     
            </Columns>
        </asp:GridView>
    
    </div>
    </form>
</body>
</html>
