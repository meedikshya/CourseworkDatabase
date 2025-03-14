<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProjectMilestone.aspx.cs" Inherits="CourseworkDatabase.ProjectMilestone" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Project Milestones</title>
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
                        Project Milestones
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
                                    <asp:BoundField DataField="PROJECTID" HeaderText="PROJECTID" SortExpression="PROJECTID" />
                                    <asp:BoundField DataField="PROJECTNAME" HeaderText="PROJECTNAME" SortExpression="PROJECTNAME" />
                                    <asp:BoundField DataField="PROJECTSTARTDATE" HeaderText="PROJECTSTARTDATE" SortExpression="PROJECTSTARTDATE" />
                                    <asp:BoundField DataField="PROJECTDUEDATE" HeaderText="PROJECTDUEDATE" SortExpression="PROJECTDUEDATE" />
                                    <asp:BoundField DataField="MILESTONEID" HeaderText="MILESTONEID" SortExpression="MILESTONEID" />
                                    <asp:BoundField DataField="MILESTONENAME" HeaderText="MILESTONENAME" SortExpression="MILESTONENAME" />
                                    <asp:BoundField DataField="MILESTONEDUEDATE" HeaderText="MILESTONEDUEDATE" SortExpression="MILESTONEDUEDATE" />
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
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT 
    p.projectId,
    p.projectName,
   p.projectstartDate,
    p.projectdueDate,
    m.milestoneId,
    m.milestoneName,
    m.milestonedueDate  
FROM 
    Project p 
LEFT JOIN 
    Milestone m ON p.projectId = m.projectId WHERE p.projectId = :projectId">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" Name="projectId" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
    </form>
    <script src="/scripts/jquery.min.js"></script>
    <script src="/scripts/bootstrap.bundle.min.js"></script>
</body>
</html>