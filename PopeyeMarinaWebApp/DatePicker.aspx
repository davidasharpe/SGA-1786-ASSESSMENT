<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DatePicker.aspx.cs" Inherits="PopeyeMarinaWebApp.DatePicker" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:ScriptManager ID="ScriptManager1" runat="server">
            <Scripts>
                <asp:ScriptReference Path="~/Scripts/jquery-3.1.1.js"/>
                <asp:ScriptReference Path="~/Scripts/jquery-ui-1.12.1.js"/>
                <asp:ScriptReference Path="~/Scripts/juice.js" />
            </Scripts>
        </asp:ScriptManager>
        <asp:TextBox runat="server" ID="TextBox1" />
        <Juice:Datepicker ID="Datepicker1" runat="server" TargetControlID="TextBox1" />
    </div>
    </form>
</body>
</html>
