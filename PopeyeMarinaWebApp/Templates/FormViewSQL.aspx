<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FormViewSQL.aspx.cs" Inherits="PopeyeMarinaWebApp.Templates.FormViewSQL" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="CustomerID" DataSourceID="CustomersGridSqlDataSource">
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="CustomerID" HeaderText="CustomerID" InsertVisible="False" ReadOnly="True" SortExpression="CustomerID" />
                <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
                <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
                <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="CustomersGridSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Customers]"></asp:SqlDataSource>
        <br />
        <br />
        <asp:FormView ID="FormView1" runat="server" DataKeyNames="CustomerID" DataSourceID="CustomerFormSqlDataSource">
            <EditItemTemplate>
                CustomerID:
                <asp:Label ID="CustomerIDLabel1" runat="server" Text='<%# Eval("CustomerID") %>' />
                <br />
                Name:
                <asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>' />
                <br />
                Address:
                <asp:TextBox ID="AddressTextBox" runat="server" Text='<%# Bind("Address") %>' />
                <br />
                Phone:
                <asp:TextBox ID="PhoneTextBox" runat="server" Text='<%# Bind("Phone") %>' />
                <br />
                Email:
                <asp:TextBox ID="EmailTextBox" runat="server" Text='<%# Bind("Email") %>' />
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </EditItemTemplate>
            <InsertItemTemplate>
                Name:
                <asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>' />
                <br />
                Address:
                <asp:TextBox ID="AddressTextBox" runat="server" Text='<%# Bind("Address") %>' />
                <br />
                Phone:
                <asp:TextBox ID="PhoneTextBox" runat="server" Text='<%# Bind("Phone") %>' />
                <br />
                Email:
                <asp:TextBox ID="EmailTextBox" runat="server" Text='<%# Bind("Email") %>' />
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </InsertItemTemplate>
            <ItemTemplate>
                CustomerID:
                <asp:Label ID="CustomerIDLabel" runat="server" Text='<%# Eval("CustomerID") %>' />
                <br />
                Name:
                <asp:Label ID="NameLabel" runat="server" Text='<%# Bind("Name") %>' />
                <br />
                Address:
                <asp:Label ID="AddressLabel" runat="server" Text='<%# Bind("Address") %>' />
                <br />
                Phone:
                <asp:Label ID="PhoneLabel" runat="server" Text='<%# Bind("Phone") %>' />
                <br />
                Email:
                <asp:Label ID="EmailLabel" runat="server" Text='<%# Bind("Email") %>' />
                <br />
                <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
                &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" />
                &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
            </ItemTemplate>
        </asp:FormView>
        <asp:SqlDataSource ID="CustomerFormSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Customers] WHERE [CustomerID] = @CustomerID" InsertCommand="INSERT INTO [Customers] ([Name], [Address], [Phone], [Email]) VALUES (@Name, @Address, @Phone, @Email)" SelectCommand="SELECT * FROM [Customers] WHERE ([CustomerID] = @CustomerID)" UpdateCommand="UPDATE [Customers] SET [Name] = @Name, [Address] = @Address, [Phone] = @Phone, [Email] = @Email WHERE [CustomerID] = @CustomerID">
            <DeleteParameters>
                <asp:Parameter Name="CustomerID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter Name="Address" Type="String" />
                <asp:Parameter Name="Phone" Type="String" />
                <asp:Parameter Name="Email" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="GridView1" DefaultValue="1" Name="CustomerID" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter Name="Address" Type="String" />
                <asp:Parameter Name="Phone" Type="String" />
                <asp:Parameter Name="Email" Type="String" />
                <asp:Parameter Name="CustomerID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <br />
        <br />
    </div>
    </form>
</body>
</html>
