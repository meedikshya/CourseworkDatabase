<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Project.aspx.cs" Inherits="CourseworkDatabase.Project" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="/content/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server" class="container mt-5">
                <asp:FormView ID="FormView1" runat="server" DataKeyNames="PROJECTID" DataSourceID="SqlDataSource1">
                    <InsertItemTemplate>
                        <div class="form-group">
                            <label for="PROJECTIDTextBox">PROJECTID:</label>
                            <asp:TextBox ID="PROJECTIDTextBox" runat="server" Text='<%# Bind("PROJECTID") %>' CssClass="form-control" />
                        </div>
                        <div class="form-group">
                            <label for="PROJECTNAMETextBox">PROJECTNAME:</label>
                            <asp:TextBox ID="PROJECTNAMETextBox" runat="server" Text='<%# Bind("PROJECTNAME") %>' CssClass="form-control" />
                        </div>
                        <div class="form-group">
                            <label for="PROJECTSTARTDATETextBox">PROJECTSTARTDATE:</label>
                            <asp:TextBox ID="PROJECTSTARTDATETextBox" runat="server" Text='<%# Bind("PROJECTSTARTDATE") %>' CssClass="form-control" />
                        </div>
                        <div class="form-group">
                            <label for="PROJECTDUEDATETextBox">PROJECTDUEDATE:</label>
                            <asp:TextBox ID="PROJECTDUEDATETextBox" runat="server" Text='<%# Bind("PROJECTDUEDATE") %>' CssClass="form-control" />
                        </div>
                        <div class="form-group">
                            <label for="PROJECTSTATUSTextBox">PROJECTSTATUS:</label>
                            <asp:TextBox ID="PROJECTSTATUSTextBox" runat="server" Text='<%# Bind("PROJECTSTATUS") %>' CssClass="form-control" />
                        </div>
                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" CssClass="btn btn-primary" />
                        <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="btn btn-secondary" />
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="Insert" CssClass="btn btn-primary" />
                    </ItemTemplate>
                </asp:FormView>
        <div class="card mt-4">
            <div class="card-header">
                Project List
            </div>
            <div class="card-body">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="PROJECTID" DataSourceID="SqlDataSource1" CssClass="table table-striped">
                    <Columns>
                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                        <asp:BoundField DataField="PROJECTID" HeaderText="PROJECTID" ReadOnly="True" SortExpression="PROJECTID" />
                        <asp:BoundField DataField="PROJECTNAME" HeaderText="PROJECTNAME" SortExpression="PROJECTNAME" />
                        <asp:BoundField DataField="PROJECTSTARTDATE" HeaderText="PROJECTSTARTDATE" SortExpression="PROJECTSTARTDATE" />
                        <asp:BoundField DataField="PROJECTDUEDATE" HeaderText="PROJECTDUEDATE" SortExpression="PROJECTDUEDATE" />
                        <asp:BoundField DataField="PROJECTSTATUS" HeaderText="PROJECTSTATUS" SortExpression="PROJECTSTATUS" />
                    </Columns>
                </asp:GridView>
            </div>
        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;PROJECT&quot; WHERE &quot;PROJECTID&quot; = :PROJECTID" InsertCommand="INSERT INTO &quot;PROJECT&quot; (&quot;PROJECTID&quot;, &quot;PROJECTNAME&quot;, &quot;PROJECTSTARTDATE&quot;, &quot;PROJECTDUEDATE&quot;, &quot;PROJECTSTATUS&quot;) VALUES (:PROJECTID, :PROJECTNAME, :PROJECTSTARTDATE, :PROJECTDUEDATE, :PROJECTSTATUS)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;PROJECTID&quot;, &quot;PROJECTNAME&quot;, &quot;PROJECTSTARTDATE&quot;, &quot;PROJECTDUEDATE&quot;, &quot;PROJECTSTATUS&quot; FROM &quot;PROJECT&quot;" UpdateCommand="UPDATE &quot;PROJECT&quot; SET &quot;PROJECTNAME&quot; = :PROJECTNAME, &quot;PROJECTSTARTDATE&quot; = :PROJECTSTARTDATE, &quot;PROJECTDUEDATE&quot; = :PROJECTDUEDATE, &quot;PROJECTSTATUS&quot; = :PROJECTSTATUS WHERE &quot;PROJECTID&quot; = :PROJECTID">
            <DeleteParameters>
                <asp:Parameter Name="PROJECTID" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="PROJECTID" Type="String" />
                <asp:Parameter Name="PROJECTNAME" Type="String" />
                <asp:Parameter Name="PROJECTSTARTDATE" Type="DateTime" />
                <asp:Parameter Name="PROJECTDUEDATE" Type="DateTime" />
                <asp:Parameter Name="PROJECTSTATUS" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="PROJECTNAME" Type="String" />
                <asp:Parameter Name="PROJECTSTARTDATE" Type="DateTime" />
                <asp:Parameter Name="PROJECTDUEDATE" Type="DateTime" />
                <asp:Parameter Name="PROJECTSTATUS" Type="String" />
                <asp:Parameter Name="PROJECTID" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>