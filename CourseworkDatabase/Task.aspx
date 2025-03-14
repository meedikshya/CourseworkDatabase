<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Task.aspx.cs" Inherits="CourseworkDatabase.Task" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="/content/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server" class="container mt-5">
                <asp:FormView ID="FormView1" runat="server" DataKeyNames="TASKID" DataSourceID="SqlDataSource1">
                    <InsertItemTemplate>
                        <div class="form-group">
                            <label for="TASKIDTextBox">TASKID:</label>
                            <asp:TextBox ID="TASKIDTextBox" runat="server" Text='<%# Bind("TASKID") %>' CssClass="form-control" />
                        </div>
                        <div class="form-group">
                            <label for="TASKNAMETextBox">TASKNAME:</label>
                            <asp:TextBox ID="TASKNAMETextBox" runat="server" Text='<%# Bind("TASKNAME") %>' CssClass="form-control" />
                        </div>
                        <div class="form-group">
                            <label for="TASKSTARTDATETextBox">TASKSTARTDATE:</label>
                            <asp:TextBox ID="TASKSTARTDATETextBox" runat="server" Text='<%# Bind("TASKSTARTDATE") %>' CssClass="form-control" />
                        </div>
                        <div class="form-group">
                            <label for="TASKDUEDATETextBox">TASKDUEDATE:</label>
                            <asp:TextBox ID="TASKDUEDATETextBox" runat="server" Text='<%# Bind("TASKDUEDATE") %>' CssClass="form-control" />
                        </div>
                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" CssClass="btn btn-primary" />
                        <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="btn btn-secondary" />
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="Insert" CssClass="btn btn-primary mb-3" />
                    </ItemTemplate>
                </asp:FormView>
        <div class="card mb-4">
            <div class="card-header">
                Task List
            </div>
            <div class="card-body">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="TASKID" DataSourceID="SqlDataSource1" CssClass="table table-striped" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                    <Columns>
                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                        <asp:BoundField DataField="TASKID" HeaderText="TASKID" ReadOnly="True" SortExpression="TASKID" />
                        <asp:BoundField DataField="TASKNAME" HeaderText="TASKNAME" SortExpression="TASKNAME" />
                        <asp:BoundField DataField="TASKSTARTDATE" HeaderText="TASKSTARTDATE" SortExpression="TASKSTARTDATE" />
                        <asp:BoundField DataField="TASKDUEDATE" HeaderText="TASKDUEDATE" SortExpression="TASKDUEDATE" />
                    </Columns>
                </asp:GridView>
            </div>
        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;TASK&quot; WHERE &quot;TASKID&quot; = :TASKID" InsertCommand="INSERT INTO &quot;TASK&quot; (&quot;TASKID&quot;, &quot;TASKNAME&quot;, &quot;TASKSTARTDATE&quot;, &quot;TASKDUEDATE&quot;) VALUES (:TASKID, :TASKNAME, :TASKSTARTDATE, :TASKDUEDATE)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;TASKID&quot;, &quot;TASKNAME&quot;, &quot;TASKSTARTDATE&quot;, &quot;TASKDUEDATE&quot; FROM &quot;TASK&quot;" UpdateCommand="UPDATE &quot;TASK&quot; SET &quot;TASKNAME&quot; = :TASKNAME, &quot;TASKSTARTDATE&quot; = :TASKSTARTDATE, &quot;TASKDUEDATE&quot; = :TASKDUEDATE WHERE &quot;TASKID&quot; = :TASKID">
            <DeleteParameters>
                <asp:Parameter Name="TASKID" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="TASKID" Type="String" />
                <asp:Parameter Name="TASKNAME" Type="String" />
                <asp:Parameter Name="TASKSTARTDATE" Type="DateTime" />
                <asp:Parameter Name="TASKDUEDATE" Type="DateTime" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="TASKNAME" Type="String" />
                <asp:Parameter Name="TASKSTARTDATE" Type="DateTime" />
                <asp:Parameter Name="TASKDUEDATE" Type="DateTime" />
                <asp:Parameter Name="TASKID" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <br />
    </form>
</body>
</html>