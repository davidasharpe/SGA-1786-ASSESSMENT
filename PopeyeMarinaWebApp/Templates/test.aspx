<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="test.aspx.cs" Inherits="PopeyeMarinaWebApp.test" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server">
            <Scripts>
                <asp:ScriptReference Path="~/Scripts/jquery-3.1.1.js" />
                <asp:ScriptReference Path="~/Scripts/jquery-ui-1.12.1.js"/>
            </Scripts>
        </asp:ScriptManager>
    <div>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <asp:GridView runat="server" ID="SlipsGrid"
                        ItemType="PopeyeMarinaWebApp.Models.Slip"
                        DataKeyNames="SlipID" 
                        SelectMethod="SlipsGrid_GetData"
                        AutoGenerateColumns="false"  
                        CssClass="table table-striped table-hover" 
                        AllowPaging="True" 
                        PageSize="5"
                        AllowSorting="True"
                        BorderColor="#CCCCCC"> 
                        <Columns>
                            <asp:CommandField ShowSelectButton ="True" />
                            <asp:DynamicField DataField="SlipID" />
                            <asp:DynamicField DataField="DockID" />
                            <asp:DynamicField DataField="Length" />
                            <asp:DynamicField DataField="Width" />
                            <asp:DynamicField DataField="Length" />
                        </Columns>
                    </asp:GridView>
            </ContentTemplate>
        </asp:UpdatePanel>

        <br />
        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
            <ContentTemplate>
                <asp:ValidationSummary ID="ValidationSummary" CssClass="alert-danger" ShowModelStateErrors="true" runat="server" />
                <asp:FormView ID="AddLease" runat="server" 
                    ItemType="PopeyeMarinaWebApp.Models.Lease"
                    DataKeyNames="LeaseID"
                    RenderOuterTable="false"
                    DefaultMode="Insert"
                    SelectMethod="AddLease_GetItem"
                    InsertMethod="AddLease_InsertItem"
                    OnItemInserted="AddLease_ItemInserted">
                    <InsertItemTemplate>
                        <fieldset>
                            <div class="formitem">
                                <asp:Label ID="leasestartdatelabel" CssClass="formlabel" runat="server" Text="<%#: BindItem.StartDate %>"></asp:Label>
                                <asp:TextBox ID="txtStartDate" CssClass="Datepicker" runat="server" AutoPostBack="True" OnTextChanged="calculateDays"></asp:TextBox>
                            </div>
                            <div class="formitem">
                                <asp:Label ID="leaseenddatelabel" CssClass="formlabel" runat="server" Text="<%#: BindItem.EndDate %>"></asp:Label>
                                <asp:TextBox ID="txtEndDate"  CssClass="Datepicker" runat="server" AutoPostBack="True" OnTextChanged="calculateDays"></asp:TextBox>
                            </div>
                            <div class="formitem">
                                <asp:Label ID="totaldayslabel" CssClass="formlabel" runat="server" Text="Number of Days"></asp:Label>
                                <asp:Label ID="totaldays" CssClass="idlabel" runat="server" Text=""></asp:Label>
                            </div>
                            <div class="col-lg-12">
                                        <asp:Button ID="InsertButton" runat="server" Text="Insert" CausesValidation="True" CssClass="btn btn-primary btn-sm" CommandName="Insert" />
                                        <asp:Button ID="CancelButton" runat="server" Text="Cancel" CssClass="btn btn-primary btn-sm" CommandName="Cancel"/> 
                            </div>
                        </fieldset>
                    </InsertItemTemplate>
                </asp:FormView>
                            
            </ContentTemplate>
        </asp:UpdatePanel>     
    </div>
    </form>
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
</body>
</html>
