<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CalculateDaysTest2.aspx.cs" Inherits="PopeyeMarinaWebApp.Templates.CalculateDaysTest2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Calculate Dates Test 2</title>
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div>
        <asp:FormView ID="AddLease" runat="server"
            ItemType="PopeyeMarinaWebApp.Models.Lease"
            DataKeyNames="LeaseID" 
            RenderOuterTable="false" 
            DefaultMode="Insert"
            InsertMethod="LeaseFormAdd_InsertItem">
            <InsertItemTemplate>
                <fieldset>
                    <div class="formitem">
                        <asp:Label ID="startDateLabel" CssClass="formlabel" runat="server" Text="Start Date:"></asp:Label>
                        <asp:TextBox ID="txtStartDate" CssClass="DatePicker" runat="server" 
                            AutoPostBack="True" OnTextChanged="calculateDays" Text="<%#: BindItem.StartDate %>"></asp:TextBox>
                        <juice:Datepicker runat="server" TargetControlID="txtStartDate" AutoPostBack="true" />
                    </div>
                    <div class="formitem">
                        <asp:Label ID="endDateLabel" CssClass="formlabel" runat="server" Text="End Date:"></asp:Label>
                        <asp:TextBox ID ="txtEndDate"  CssClass="DatePicker" runat="server"
                            AutoPostBack="True"  OnTextChanged="calculateDays" Text="<%#: BindItem.EndDate %>"></asp:TextBox>
                        <juice:Datepicker runat="server" TargetControlID="txtEndDate" AutoPostBack="true" />
                    </div>
                    <div class="formitem">
                        <asp:Label ID="totalDaysLabel" CssClass="formlabel" runat="server" Text="Number of Days:"></asp:Label>
                        <asp:Label ID="totalDays" CssClass="idlabel" runat="server" Text=""></asp:Label>
                    </div>
                    <div class="col-lg-12">
                        <asp:Button ID="InsertButton" runat="server" Text="Insert" CausesValidation="True" CssClass="btn btn-primary btn-sm" CommandName="Insert" />
                        <asp:Button ID="CancelButton" runat="server" Text="Cancel" CssClass="btn btn-primary btn-sm" CommandName="Cancel"/> 
                    </div>
                </fieldset>
            </InsertItemTemplate>
        </asp:FormView>
    </div>
    </form>
</body>
</html>
