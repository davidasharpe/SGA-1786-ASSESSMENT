<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FormView.aspx.cs" Inherits="PopeyeMarinaWebApp.Template.FormView" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
     <asp:FormView ID="Form" runat="server" 
            ItemType="PopeyeMarinaWebApp.Models.Customer" 
            DataKeyNames="" 
            SelectMethod="_GetItem" 
            UpdateMethod="_UpdateItem" 
            InsertMethod="_InsertItem" 
            DeleteMethod="_DeleteItem" 
            DefaultMode="ReadOnly" 
            OnItemInserted="_ItemInserted" 
            OnItemUpdated="_ItemUpdated" 
            OnItemDeleted="_ItemDeleted">
            <ItemTemplate>
                <div class="form-horizontal">
                    <fieldset>
                        <legend>View</legend>
                        <div class="form-group">
                            <label for="" class="col-lg-2 control-label"></label>
                            <div class="col-lg-10">
                                <asp:Label ID="Label1" runat="server" Text='<%#: %>'></asp:Label>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="" class="col-lg-2 control-label"></label>
                            <div class="col-lg-10">
                                <asp:Label ID="Label2" runat="server" Text='<%#: %>'></asp:Label>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="" class="col-lg-2 control-label"></label>
                            <div class="col-lg-10">
                                <asp:Label ID="Label3" runat="server" Text='<%#: %>'></asp:Label>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="" class="col-lg-2 control-label"></label>
                            <div class="col-lg-10">
                                <asp:Label ID="Label4" runat="server" Text='<%#: %>'></asp:Label>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <asp:Button ID="EditButton" runat="server" Text="Edit" CssClass="btn btn-primary btn-sm" CommandName="Edit" />
                            <asp:Button ID="DeleteButton" runat="server" Text="Delete" CssClass="btn btn-primary btn-sm" CommandName="Delete"/> 
                        </div>
                    </fieldset>
                </div>
            </ItemTemplate>
            <EditItemTemplate>
                <div class="form-horizontal">
                    <fieldset>
                        <legend>Edit</legend>
                        <div class="form-group">
                            <label for="" class="col-lg-2 control-label"></label>
                            <div class="col-lg-10">
                                <asp:TextBox ID="TextBox1" runat="server" Text="<%#: %>"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="" class="col-lg-2 control-label"></label>
                            <div class="col-lg-10">
                                <asp:TextBox ID="TextBox2" runat="server" Text="<%#: %>"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="" class="col-lg-2 control-label"></label>
                            <div class="col-lg-10">
                                <asp:TextBox ID="TextBox3" runat="server" Text="<%#: %>"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="" class="col-lg-2 control-label"></label>
                            <div class="col-lg-10">
                                <asp:TextBox ID="TextBox4" runat="server" Text="<%#: %>"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <asp:Button ID="UpdateButton" runat="server" Text="Update" CssClass="btn btn-primary btn-sm" CommandName="Update" />
                            <asp:Button ID="CancelButton" runat="server" Text="Cancel" CssClass="btn btn-primary btn-sm" CommandName="Cancel"/> 
                        </div>
                    </fieldset>
                </div>
            </EditItemTemplate>
            <InsertItemTemplate>
                <div class="form-horizontal">
                    <fieldset>
                        <legend>Add</legend>
                        <div class="form-group">
                            <label for="" class="col-lg-2 control-label"></label>
                            <div class="col-lg-10">
                                <asp:TextBox ID="TextBox1" runat="server" Text="<%#: %>"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="" class="col-lg-2 control-label"></label>
                            <div class="col-lg-10">
                                <asp:TextBox ID="TextBox2" runat="server" Text="<%#: %>"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="" class="col-lg-2 control-label"></label>
                            <div class="col-lg-10">
                                <asp:TextBox ID="TextBox3" runat="server" Text="<%#: %>"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="" class="col-lg-2 control-label"></label>
                            <div class="col-lg-10">
                                <asp:TextBox ID="TextBox4" runat="server" Text="<%#: %>"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <asp:Button ID="InsertButton" runat="server" Text="Insert" CssClass="btn btn-primary btn-sm" CommandName="Insert" />
                            <asp:Button ID="CancelButton" runat="server" Text="Cancel" CssClass="btn btn-primary btn-sm" CommandName="Cancel"/> 
                        </div>
                    </fieldset>
                </div>
            </InsertItemTemplate>
        </asp:FormView>
    
    </div>
    </form>
</body>
</html>
