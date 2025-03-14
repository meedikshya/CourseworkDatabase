<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Subtask.aspx.cs" Inherits="CourseworkDatabase.Subtask" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="/content/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server" class="container mt-5">
        <div>
            <asp:FormView ID="FormView1" runat="server" DataKeyNames="SUBTASKID" DataSourceID="SqlDataSource1">
                <InsertItemTemplate>
                    <div class="form-group">
                        <label for="SUBTASKIDTextBox">SUBTASKID:</label>
                        <asp:TextBox ID="SUBTASKIDTextBox" runat="server" Text='<%# Bind("SUBTASKID") %>' CssClass="form-control" />
                    </div>
                    <div class="form-group">
                        <label for="SUBTASKNAMETextBox">SUBTASKNAME:</label>
                        <asp:TextBox ID="SUBTASKNAMETextBox" runat="server" Text='<%# Bind("SUBTASKNAME") %>' CssClass="form-control" />
                    </div>
                    <div class="form-group">
                        <label for="SUBTASKDESCRIPTIONTextBox">SUBTASKDESCRIPTION:</label>
                        <asp:TextBox ID="SUBTASKDESCRIPTIONTextBox" runat="server" Text='<%# Bind("SUBTASKDESCRIPTION") %>' CssClass="form-control" />
                    </div>
                    <div class="form-group">
                        <label for="SUBTASKSTARTDATETextBox">SUBTASKSTARTDATE:</label>
                        <asp:TextBox ID="SUBTASKSTARTDATETextBox" runat="server" Text='<%# Bind("SUBTASKSTARTDATE") %>' CssClass="form-control" />
                    </div>
                    <div class="form-group">
                        <label for="SUBTASKDUEDATETextBox">SUBTASKDUEDATE:</label>
                        <asp:TextBox ID="SUBTASKDUEDATETextBox" runat="server" Text='<%# Bind("SUBTASKDUEDATE") %>' CssClass="form-control" />
                    </div>
                    <div class="form-group">
                        <label for="SUBTASKSTATUSTextBox">SUBTASKSTATUS:</label>
                        <asp:TextBox ID="SUBTASKSTATUSTextBox" runat="server" Text='<%# Bind("SUBTASKSTATUS") %>' CssClass="form-control" />
                    </div>
                 <div class="form-group">
    <label for="DropDownList2">TASK:</label>
    <asp:DropDownList ID="DropDownList2" runat="server"
        DataSourceID="SqlDataSource3"
        DataTextField="TaskDisplay"
        DataValueField="TASKID"
        SelectedValue='<%# Bind("TASKID") %>'
        CssClass="form-control">
    </asp:DropDownList>
</div>

<div class="form-group">
    <label for="DropDownList3">USER:</label>
    <asp:DropDownList ID="DropDownList3" runat="server"
        DataSourceID="SqlDataSource2"
        DataTextField="UserDisplay"
        DataValueField="USERID"
        SelectedValue='<%# Bind("USERID") %>'
        CssClass="form-control">
    </asp:DropDownList>
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
        <div class="card mt-4">
            <div class="card-header">
                Subtask List
            </div>
            <div class="card-body">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="SUBTASKID" DataSourceID="SqlDataSource1" CssClass="table table-striped" AllowPaging="True" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                    <Columns>
                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                        <asp:BoundField DataField="SUBTASKID" HeaderText="SUBTASKID" ReadOnly="True" SortExpression="SUBTASKID" />
                        <asp:BoundField DataField="SUBTASKNAME" HeaderText="SUBTASKNAME" SortExpression="SUBTASKNAME" />
                        <asp:BoundField DataField="SUBTASKDESCRIPTION" HeaderText="SUBTASKDESCRIPTION" SortExpression="SUBTASKDESCRIPTION" />
                        <asp:BoundField DataField="SUBTASKSTARTDATE" HeaderText="SUBTASKSTARTDATE" SortExpression="SUBTASKSTARTDATE" />
                        <asp:BoundField DataField="SUBTASKDUEDATE" HeaderText="SUBTASKDUEDATE" SortExpression="SUBTASKDUEDATE" />
                        <asp:BoundField DataField="SUBTASKSTATUS" HeaderText="SUBTASKSTATUS" SortExpression="SUBTASKSTATUS" />
                        <asp:TemplateField HeaderText="User Name">
                            <ItemTemplate>
                                <asp:DropDownList Enabled="false" ID="DropDownList4" runat="server" DataSourceID="UserNameSQLDatasource" DataTextField="UserDisplay" DataValueField="USERID" SelectedValue='<%# Bind("USERID") %>'>
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="UserNameSQLDatasource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" 
                                    SelectCommand="SELECT USERID, USERID || ' - ' || USERNAME AS UserDisplay FROM SYSTEMUSER">
                                </asp:SqlDataSource>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Task Name">
                            <ItemTemplate>
                                <asp:DropDownList Enabled="false" ID="DropDownList5" runat="server" DataSourceID="TaskNameDataSource" DataTextField="TaskDisplay" DataValueField="TASKID" SelectedValue='<%# Bind("TASKID") %>'>
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="TaskNameDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>"
                                    SelectCommand="SELECT TASKID, TASKID || ' - ' || TASKNAME AS TaskDisplay FROM TASK">
                                </asp:SqlDataSource>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;SUBTASK&quot; WHERE &quot;SUBTASKID&quot; = :SUBTASKID" InsertCommand="INSERT INTO &quot;SUBTASK&quot; (&quot;SUBTASKID&quot;, &quot;SUBTASKNAME&quot;, &quot;SUBTASKDESCRIPTION&quot;, &quot;SUBTASKSTARTDATE&quot;, &quot;SUBTASKDUEDATE&quot;, &quot;SUBTASKSTATUS&quot;, &quot;TASKID&quot;, &quot;USERID&quot;) VALUES (:SUBTASKID, :SUBTASKNAME, :SUBTASKDESCRIPTION, :SUBTASKSTARTDATE, :SUBTASKDUEDATE, :SUBTASKSTATUS, :TASKID, :USERID)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;SUBTASKID&quot;, &quot;SUBTASKNAME&quot;, &quot;SUBTASKDESCRIPTION&quot;, &quot;SUBTASKSTARTDATE&quot;, &quot;SUBTASKDUEDATE&quot;, &quot;SUBTASKSTATUS&quot;, &quot;TASKID&quot;, &quot;USERID&quot; FROM &quot;SUBTASK&quot;" UpdateCommand="UPDATE &quot;SUBTASK&quot; SET &quot;SUBTASKNAME&quot; = :SUBTASKNAME, &quot;SUBTASKDESCRIPTION&quot; = :SUBTASKDESCRIPTION, &quot;SUBTASKSTARTDATE&quot; = :SUBTASKSTARTDATE, &quot;SUBTASKDUEDATE&quot; = :SUBTASKDUEDATE, &quot;SUBTASKSTATUS&quot; = :SUBTASKSTATUS, &quot;TASKID&quot; = :TASKID, &quot;USERID&quot; = :USERID WHERE &quot;SUBTASKID&quot; = :SUBTASKID">
            <DeleteParameters>
                <asp:Parameter Name="SUBTASKID" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="SUBTASKID" Type="String" />
                <asp:Parameter Name="SUBTASKNAME" Type="String" />
                <asp:Parameter Name="SUBTASKDESCRIPTION" Type="String" />
                <asp:Parameter Name="SUBTASKSTARTDATE" Type="DateTime" />
                <asp:Parameter Name="SUBTASKDUEDATE" Type="DateTime" />
                <asp:Parameter Name="SUBTASKSTATUS" Type="String" />
                <asp:Parameter Name="TASKID" Type="String" />
                <asp:Parameter Name="USERID" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="SUBTASKNAME" Type="String" />
                <asp:Parameter Name="SUBTASKDESCRIPTION" Type="String" />
                <asp:Parameter Name="SUBTASKSTARTDATE" Type="DateTime" />
                <asp:Parameter Name="SUBTASKDUEDATE" Type="DateTime" />
                <asp:Parameter Name="SUBTASKSTATUS" Type="String" />
                <asp:Parameter Name="TASKID" Type="String" />
                <asp:Parameter Name="USERID" Type="String" />
                <asp:Parameter Name="SUBTASKID" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
       <asp:SqlDataSource ID="SqlDataSource2" runat="server"
    ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
    ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>"
    SelectCommand="SELECT USERID, USERID || ' - ' || USERNAME AS UserDisplay FROM SYSTEMUSER">
</asp:SqlDataSource>

<asp:SqlDataSource ID="SqlDataSource3" runat="server"
    ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
    ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>"
    SelectCommand="SELECT TASKID, TASKID || ' - ' || TASKNAME AS TaskDisplay FROM TASK">
</asp:SqlDataSource>
</form>
</body>
</html>