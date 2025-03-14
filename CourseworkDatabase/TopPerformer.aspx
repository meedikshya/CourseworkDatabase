<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TopPerformer.aspx.cs" Inherits="CourseworkDatabase.TopPerformer" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Top Performers</title>
    <link href="/content/bootstrap.min.css" rel="stylesheet" />
    <style>
        .card-body {
            max-height: 200px; 
            overflow-y: auto;
        }
        .table-responsive {
            overflow-x: hidden;
        }
        .container {
            padding: 0;
        }
        .table th, .table td {
            font-size: 0.85rem;
            padding: 0.25rem;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server" class="container-fluid mt-3">
        <div class="row justify-content-center">
            <div class="col-12">
                <div class="card">
                    <div class="card-header">
                        Top Performers
                    </div>
                    <div class="card-body">
                        <div class="form-group">
                            <label for="DropDownList1">Select Project:</label>
                            <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="ProjectDisplay" DataValueField="PROJECTID" CssClass="form-control">
                            </asp:DropDownList>
                        </div>
                        <div class="table-responsive">
                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" CssClass="table table-striped table-bordered mt-3">
                                <Columns>
                                    <asp:BoundField DataField="USERID" HeaderText="USERID" SortExpression="USERID" />
                                    <asp:BoundField DataField="USERNAME" HeaderText="USERNAME" SortExpression="USERNAME" />
                                    <asp:BoundField DataField="PROJECTID" HeaderText="PROJECTID" SortExpression="PROJECTID" />
                                    <asp:BoundField DataField="PROJECTNAME" HeaderText="PROJECTNAME" SortExpression="PROJECTNAME" />
                                    <asp:BoundField DataField="COMPLETED_TASKS" HeaderText="COMPLETED_TASKS" SortExpression="COMPLETED_TASKS" />
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand=
            "SELECT PROJECTID, (TO_CHAR(PROJECTID) || ' - ' || PROJECTNAME) AS ProjectDisplay FROM Project"
            ></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT userId, userName, projectId, projectName, Completed_Tasks
FROM (
    SELECT 
        su.userId, 
        su.userName, 
        p.projectId,
        p.projectName,
        COUNT(DISTINCT t.taskId) AS Completed_Tasks,
        RANK() OVER (PARTITION BY p.projectId ORDER BY COUNT(DISTINCT t.taskId) DESC) AS rank
    FROM SystemUser su
    JOIN UserProjectAssignment upa ON su.userId = upa.userId
    JOIN Project p ON upa.projectId = p.projectId
    JOIN UserTaskProjectAssignment utpa ON upa.userProjectId = utpa.userProjectId
    JOIN Task t ON utpa.taskId = t.taskId
    WHERE t.taskStatus = 'Completed' and p.projectId = :projectId
    GROUP BY su.userId, su.userName, p.projectId, p.projectName
) 
WHERE rank &lt;= 3">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" Name="projectId" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
    </form>
    <script src="/scripts/jquery.min.js"></script>
    <script src="/scripts/bootstrap.bundle.min.js"></script>
</body>
</html>