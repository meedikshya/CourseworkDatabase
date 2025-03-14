<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProjectMilestone.aspx.cs" Inherits="CourseworkDatabase.ProjectMilestone" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Project Milestones</title>
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
        
        /* Project and milestone styling */
        .project-id {
            font-family: 'Courier New', monospace;
            background: #e3f2fd;
            color: #0d47a1;
            padding: 3px 8px;
            border-radius: 4px;
            font-weight: 600;
        }
        
        .project-name {
            font-weight: 600;
            color: #455a64;
        }
        
        .milestone-id {
            font-family: 'Courier New', monospace;
            background: #fff3e0;
            color: #e65100;
            padding: 3px 8px;
            border-radius: 4px;
            font-weight: 600;
        }
        
        .milestone-name {
            font-weight: 600;
            color: #37474f;
        }
        
        .date-range {
            color: #607d8b;
            font-size: 0.9rem;
            display: flex;
            align-items: center;
        }
        
        .date-range i {
            margin-right: 5px;
        }
        
        .due-date {
            white-space: nowrap;
            color: #455a64;
            font-weight: 500;
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
        
        /* Empty state styling */
        .empty-state {
            color: #78909c;
            font-style: italic;
            text-align: center;
            padding: 30px;
        }
        
        /* Responsive adjustments */
        @media (max-width: 768px) {
            .card-header h3 {
                font-size: 1.5rem;
            }
            
            .table thead th {
                font-size: 0.75rem;
                padding: 10px 8px;
            }
            
            .table tbody td {
                font-size: 0.85rem;
                padding: 10px 8px;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server" class="container mt-4">
        <div class="card">
            <div class="card-header">
                <h3 class="m-0"><i class="fas fa-project-diagram me-2"></i>Project Milestones</h3>
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
                            <p><strong>Project ID:</strong> <%# Eval("PROJECTID") %></p>
                            <p><strong>Timeline:</strong> <%# Eval("PROJECTSTARTDATE", "{0:MMM dd, yyyy}") %> - <%# Eval("PROJECTDUEDATE", "{0:MMM dd, yyyy}") %></p>
                        </div>
                    </ItemTemplate>
                </asp:FormView>
                
                <div class="table-responsive mt-3">
                    <table class="table table-striped table-bordered">
                        <thead>
                            <tr>
                                <th style="width: 15%">Milestone ID</th>
                                <th style="width: 35%">Milestone Name</th>
                                <th style="width: 20%">Due Date</th>
                                <th style="width: 30%">Project</th>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
                                <ItemTemplate>
                                    <tr>
                                        <td><span class="milestone-id"><%# Eval("MILESTONEID") %></span></td>
                                        <td class="milestone-name"><%# Eval("MILESTONENAME") %></td>
                                        <td>
                                            <span class="due-date">
                                                <i class="far fa-calendar-check me-1"></i>
                                                <%# Eval("MILESTONEDUEDATE", "{0:MMM dd, yyyy}") %>
                                            </span>
                                        </td>
                                        <td>
                                            <div><span class="project-id"><%# Eval("PROJECTID") %></span></div>
                                            <div class="small mt-1 text-muted"><%# Eval("PROJECTNAME") %></div>
                                        </td>
                                    </tr>
                                </ItemTemplate>
                                <FooterTemplate>
                                    <% if(Repeater1.Items.Count == 0) { %>
                                        <tr>
                                            <td colspan="4" class="empty-state">
                                                <i class="fas fa-info-circle me-2"></i>
                                                No milestones found for this project.
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
            SelectCommand="SELECT 
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
                Milestone m ON p.projectId = m.projectId 
            WHERE 
                p.projectId = :projectId
            ORDER BY
                m.milestonedueDate ASC">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" Name="projectId" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
    </form>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>