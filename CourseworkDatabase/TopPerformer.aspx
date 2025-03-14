<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TopPerformer.aspx.cs" Inherits="CourseworkDatabase.TopPerformer" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Top Performers</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" />
    <style>
        body {
            background-color: #f0f2f5;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        
        .table-responsive {
            overflow-x: hidden;
        }
        
        .card {
            border: none;
            border-radius: 12px;
            box-shadow: 0 0.5rem 1.5rem rgba(0, 0, 0, 0.08);
            margin-bottom: 30px;
            transition: transform 0.2s;
        }
        
        .card:hover {
            transform: translateY(-5px);
        }
        
        .card-header {
            background: linear-gradient(135deg, #546e7a 0%, #37474f 100%);
            color: white;
            border-radius: 12px 12px 0 0 !important;
            padding: 18px 25px;
            border-bottom: none;
        }
        
        .card-header h3 {
            font-weight: 600;
            letter-spacing: 0.5px;
        }
        
        .card-body {
            padding: 25px;
        }
        
        .table {
            border-collapse: separate;
            border-spacing: 0;
            border-radius: 8px;
            overflow: hidden;
            margin-bottom: 0;
        }
        
        .table thead th {
            background: linear-gradient(135deg, #546e7a 0%, #455a64 100%);
            color: white;
            font-weight: 500;
            text-transform: uppercase;
            font-size: 0.85rem;
            padding: 14px 10px;
            border: none;
            letter-spacing: 0.5px;
        }
        
        .table tbody td {
            vertical-align: middle;
            padding: 14px 10px;
            border-top: none;
            border-bottom: 1px solid rgba(0, 0, 0, 0.05);
            font-size: 0.95rem;
        }
        
        .table-striped tbody tr:nth-of-type(odd) {
            background-color: rgba(0, 0, 0, 0.02);
        }
        
        .table-bordered {
            border: 1px solid rgba(0, 0, 0, 0.05);
        }
        
        .form-label {
            font-weight: 600;
            color: #455a64;
            margin-bottom: 8px;
            font-size: 0.95rem;
        }
        
        .form-select {
            border: 2px solid rgba(84, 110, 122, 0.2);
            border-radius: 8px;
            padding: 10px 15px;
            height: calc(3rem + 2px);
            font-size: 1rem;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.05);
            transition: all 0.2s;
        }
        
        .form-select:focus {
            border-color: #546e7a;
            box-shadow: 0 0 0 0.25rem rgba(84, 110, 122, 0.15);
        }

        /* Top performer styling */
        .performer-rank {
            display: inline-block;
            width: 30px;
            height: 30px;
            line-height: 30px;
            border-radius: 50%;
            text-align: center;
            font-weight: 700;
            margin-right: 10px;
            color: white;
        }
        
        .rank-1 {
            background: linear-gradient(45deg, #FFD700, #FFA500);
            box-shadow: 0 2px 5px rgba(255, 165, 0, 0.4);
        }
        
        .rank-2 {
            background: linear-gradient(45deg, #C0C0C0, #A9A9A9);
            box-shadow: 0 2px 5px rgba(169, 169, 169, 0.4);
        }
        
        .rank-3 {
            background: linear-gradient(45deg, #CD7F32, #A0522D);
            box-shadow: 0 2px 5px rgba(160, 82, 45, 0.4);
        }
        
        .completed-tasks {
            background-color: #e8f5e9;
            color: #2e7d32;
            padding: 5px 10px;
            border-radius: 15px;
            font-weight: 600;
            display: inline-flex;
            align-items: center;
        }
        
        .completed-tasks i {
            margin-right: 5px;
        }
        
        .user-id {
            font-family: 'Courier New', monospace;
            background: #e3f2fd;
            color: #0d47a1;
            padding: 3px 8px;
            border-radius: 4px;
            font-weight: 600;
        }
        
        .project-id {
            font-family: 'Courier New', monospace;
            background: #fff3e0;
            color: #e65100;
            padding: 3px 8px;
            border-radius: 4px;
            font-weight: 600;
        }
        
        .user-name {
            font-weight: 600;
            color: #455a64;
            display: flex;
            align-items: center;
        }
        
        .user-name i {
            margin-right: 8px;
        }
        
        .empty-state {
            color: #78909c;
            font-style: italic;
            text-align: center;
            padding: 30px;
        }
        
        /* Project section at top */
        .project-info {
            background: #fff;
            border-radius: 8px;
            padding: 15px 20px;
            margin-bottom: 20px;
            border-left: 5px solid #546e7a;
            box-shadow: 0 3px 10px rgba(0, 0, 0, 0.05);
        }
        
        .project-info h5 {
            margin-bottom: 10px;
            color: #455a64;
            font-weight: 600;
        }
        
        .project-info p {
            margin-bottom: 5px;
            color: #607d8b;
        }
        
        /* Trophy icons */
        .trophy-gold {
            color: #FFD700;
            font-size: 1.2rem;
            margin-right: 5px;
            text-shadow: 0 2px 3px rgba(0,0,0,0.1);
        }
        
        .trophy-silver {
            color: #C0C0C0;
            font-size: 1.2rem;
            margin-right: 5px;
            text-shadow: 0 2px 3px rgba(0,0,0,0.1);
        }
        
        .trophy-bronze {
            color: #CD7F32;
            font-size: 1.2rem;
            margin-right: 5px;
            text-shadow: 0 2px 3px rgba(0,0,0,0.1);
        }
    </style>
</head>
<body>
    <form id="form1" runat="server" class="container mt-4">
        <div class="card">
            <div class="card-header">
                <h3 class="m-0"><i class="fas fa-award me-2"></i>Top Performers</h3>
            </div>
            <div class="card-body">
                <div class="row mb-4">
                    <div class="col-md-5">
                        <label for="DropDownList1" class="form-label">
                            <i class="fas fa-folder-open me-2"></i>Select Project:
                        </label>
                        <div class="input-group">
                            <span class="input-group-text bg-light border-end-0">
                                <i class="fas fa-search text-muted"></i>
                            </span>
                            <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
                                DataSourceID="SqlDataSource2" DataTextField="ProjectDisplay" 
                                DataValueField="PROJECTID" CssClass="form-select border-start-0">
                            </asp:DropDownList>
                        </div>
                    </div>
                </div>

                <!-- Project info section using FormView -->
                <asp:FormView ID="ProjectInfoForm" runat="server" DataSourceID="SqlDataSource1" 
                    RenderOuterTable="false">
                    <ItemTemplate>
                        <div class="project-info mb-4">
                            <h5><i class="fas fa-folder me-2"></i><%# Eval("PROJECTNAME") %></h5>
                            <p><strong>Project ID:</strong> <span class="project-id"><%# Eval("PROJECTID") %></span></p>
                        </div>
                    </ItemTemplate>
                </asp:FormView>
                
                <div class="table-responsive">
                    <table class="table table-striped table-bordered">
                        <thead>
                            <tr>
                                <th style="width: 5%">Rank</th>
                                <th style="width: 15%">User ID</th>
                                <th style="width: 30%">User Name</th>
                                <th style="width: 20%">Project</th>
                                <th style="width: 30%">Completed Tasks</th>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
                                <ItemTemplate>
                                    <%# GetRankingHtml(Container.ItemIndex) %>
                                    <td><span class="user-id"><%# Eval("USERID") %></span></td>
                                    <td class="user-name"><i class="fas fa-user-circle"></i><%# Eval("USERNAME") %></td>
                                    <td>
                                        <div class="small text-muted"><%# Eval("PROJECTNAME") %></div>
                                        <div><span class="project-id"><%# Eval("PROJECTID") %></span></div>
                                    </td>
                                    <td>
                                        <span class="completed-tasks">
                                            <i class="fas fa-check-circle"></i>
                                            <%# Eval("COMPLETED_TASKS") %> tasks
                                        </span>
                                    </td>
                                </tr>
                                </ItemTemplate>
                                <FooterTemplate>
                                    <% if(Repeater1.Items.Count == 0) { %>
                                        <tr>
                                            <td colspan="5" class="empty-state">
                                                <i class="fas fa-info-circle me-2"></i>
                                                No top performers data available for this project.
                                            </td>
                                        </tr>
                                    <% } %>
                                </FooterTemplate>
                            </asp:Repeater>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" 
            SelectCommand="SELECT PROJECTID, (TO_CHAR(PROJECTID) || ' - ' || PROJECTNAME) AS ProjectDisplay FROM Project">
        </asp:SqlDataSource>
        
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" 
            SelectCommand="SELECT userId, userName, projectId, projectName, Completed_Tasks
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

    <script runat="server">
        protected string GetRankingHtml(int index)
        {
            string html = "<tr><td class=\"text-center\">";
            
            switch (index)
            {
                case 0:
                    html += "<span class=\"performer-rank rank-1\">1</span>";
                    break;
                case 1:
                    html += "<span class=\"performer-rank rank-2\">2</span>";
                    break;
                case 2:
                    html += "<span class=\"performer-rank rank-3\">3</span>";
                    break;
                default:
                    html += (index + 1).ToString();
                    break;
            }
            
            html += "</td>";
            return html;
        }
    </script>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>