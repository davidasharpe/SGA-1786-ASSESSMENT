<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CalculateDaysTest1.aspx.cs" Inherits="PopeyeMarinaWebApp.Templates.CalculateDaysTest1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Calculate Dates Test 1</title>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"/>
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <div class="formitem">
            <asp:Label ID="startDateLabel" CssClass="formlabel" runat="server" Text="Start Date:"></asp:Label>
            <asp:TextBox ID="txtStartDate" CssClass="DatePicker" runat="server" AutoPostBack="True" OnTextChanged="calculateDays"></asp:TextBox>
        </div>
        <div class="formitem">
            <asp:Label ID="endDateLabel" CssClass="formlabel" runat="server" Text="End Date:"></asp:Label>
            <asp:TextBox ID ="txtEndDate"  CssClass="DatePicker" runat="server" AutoPostBack="True" OnTextChanged="calculateDays"></asp:TextBox>
        </div>
        <div class="formitem">
            <asp:Label ID="totalDaysLabel" CssClass="formlabel" runat="server" Text="Number of Days:"></asp:Label>
            <asp:Label ID="totalDays" CssClass="idlabel" runat="server" Text=""></asp:Label>
        </div>
    </div>
    <script>
        $(function () {
            $('.DatePicker').datepicker(
            {
                dateFormat: 'dd/mm/yy',
                changeMonth: true,
                changeYear: true,
                yearRange: '1950:2100'
            });
        })
    </script>
    </form>
</body>
</html>
