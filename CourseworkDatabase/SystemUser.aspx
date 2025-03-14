<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SystemUser.aspx.cs" Inherits="CourseworkDatabase.SystemUser" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="/content/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server" class="container mt-5">
        <div>
            <asp:FormView ID="FormView2" runat="server" DataKeyNames="USERID" DataSourceID="SqlDataSource1">
                <EditItemTemplate>
                    <div class="form-group">
                        <label for="USERIDLabel1">USERID:</label>
                        <asp:Label ID="USERIDLabel1" runat="server" Text='<%# Eval("USERID") %>' CssClass="form-control-plaintext" />
                    </div>
                    <div class="form-group">
                        <label for="USERNAMETextBox">USERNAME:</label>
                        <asp:TextBox ID="USERNAMETextBox" runat="server" Text='<%# Bind("USERNAME") %>' CssClass="form-control" />
                    </div>
                    <div class="form-group">
                        <label for="USEREMAILTextBox">USEREMAIL:</label>
                        <asp:TextBox ID="USEREMAILTextBox" runat="server" Text='<%# Bind("USEREMAIL") %>' CssClass="form-control" />
                    </div>
                    <div class="form-group">
                        <label for="USERCONTACTTextBox">USERCONTACT:</label>
                        <asp:TextBox ID="USERCONTACTTextBox" runat="server" Text='<%# Bind("USERCONTACT") %>' CssClass="form-control" />
                    </div>
                    <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" CssClass="btn btn-primary" />
                    <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="btn btn-secondary" />
                </EditItemTemplate>
                <InsertItemTemplate>
                    <div class="form-group">
                        <label for="USERIDTextBox">USERID:</label>
                        <asp:TextBox ID="USERIDTextBox" runat="server" Text='<%# Bind("USERID") %>' CssClass="form-control" />
                    </div>
                    <div class="form-group">
                        <label for="USERNAMETextBox">USERNAME:</label>
                        <asp:TextBox ID="USERNAMETextBox" runat="server" Text='<%# Bind("USERNAME") %>' CssClass="form-control" />
                    </div>
                    <div class="form-group">
                        <label for="USEREMAILTextBox">USEREMAIL:</label>
                        <asp:TextBox ID="USEREMAILTextBox" runat="server" Text='<%# Bind("USEREMAIL") %>' CssClass="form-control" />
                    </div>
                    <div class="form-group">
                        <label for="USERCONTACTTextBox">USERCONTACT:</label>
                        <asp:TextBox ID="USERCONTACTTextBox" runat="server" Text='<%# Bind("USERCONTACT") %>' CssClass="form-control" />
                    </div>
                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" CssClass="btn btn-primary" />
                    <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="btn btn-secondary" />
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="Insert" CssClass="btn btn-primary" />
                </ItemTemplate>
            </asp:FormView>
            <br />
        </div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="USERID" DataSourceID="SqlDataSource1" CssClass="table table-striped">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="USERID" HeaderText="USERID" ReadOnly="True" SortExpression="USERID" />
                <asp:BoundField DataField="USERNAME" HeaderText="USERNAME" SortExpression="USERNAME" />
                <asp:BoundField DataField="USEREMAIL" HeaderText="USEREMAIL" SortExpression="USEREMAIL" />
                <asp:BoundField DataField="USERCONTACT" HeaderText="USERCONTACT" SortExpression="USERCONTACT" />
            </Columns>
        </asp:GridView>
        <asp:FormView ID="FormView1" runat="server" DataKeyNames="USERID" DataSourceID="SqlDataSource1" OnPageIndexChanging="FormView1_PageIndexChanging">
            <InsertItemTemplate>
                <div class="form-group">
                    <label for="USERIDTextBox">USERID:</label>
                    <asp:TextBox ID="USERIDTextBox" runat="server" Text='<%# Bind("USERID") %>' CssClass="form-control" />
                </div>
                <div class="form-group">
                    <label for="USERNAMETextBox">USERNAME:</label>
                    <asp:TextBox ID="USERNAMETextBox" runat="server" Text='<%# Bind("USERNAME") %>' CssClass="form-control" />
                </div>
                <div class="form-group">
                    <label for="USEREMAILTextBox">USEREMAIL:</label>
                    <asp:TextBox ID="USEREMAILTextBox" runat="server" Text='<%# Bind("USEREMAIL") %>' CssClass="form-control" />
                </div>
                <div class="form-group">
                    <label for="USERCONTACTTextBox">USERCONTACT:</label>
                    <asp:TextBox ID="USERCONTACTTextBox" runat="server" Text='<%# Bind("USERCONTACT") %>' CssClass="form-control" />
                </div>
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" CssClass="btn btn-primary" />
                <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="btn btn-secondary" />
            </InsertItemTemplate>
            <ItemTemplate>
            </ItemTemplate>
        </asp:FormView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;SYSTEMUSER&quot; WHERE &quot;USERID&quot; = :USERID" InsertCommand="INSERT INTO &quot;SYSTEMUSER&quot; (&quot;USERID&quot;, &quot;USERNAME&quot;, &quot;USEREMAIL&quot;, &quot;USERCONTACT&quot;) VALUES (:USERID, :USERNAME, :USEREMAIL, :USERCONTACT)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;USERID&quot;, &quot;USERNAME&quot;, &quot;USEREMAIL&quot;, &quot;USERCONTACT&quot; FROM &quot;SYSTEMUSER&quot;" UpdateCommand="UPDATE &quot;SYSTEMUSER&quot; SET &quot;USERNAME&quot; = :USERNAME, &quot;USEREMAIL&quot; = :USEREMAIL, &quot;USERCONTACT&quot; = :USERCONTACT WHERE &quot;USERID&quot; = :USERID">
            <DeleteParameters>
                <asp:Parameter Name="USERID" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="USERID" Type="String" />
                <asp:Parameter Name="USERNAME" Type="String" />
                <asp:Parameter Name="USEREMAIL" Type="String" />
                <asp:Parameter Name="USERCONTACT" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="USERNAME" Type="String" />
                <asp:Parameter Name="USEREMAIL" Type="String" />
                <asp:Parameter Name="USERCONTACT" Type="String" />
                <asp:Parameter Name="USERID" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <br />
    </form>
</body>
</html>