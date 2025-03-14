<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="CourseworkDatabase.Dashboard" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/chart.js@3.9.1/dist/chart.min.js"></script>
    <style>
        body {
            background-color: #f8f9fa;
            padding: 20px;
        }
        .dashboard-title {
            margin-bottom: 30px;
            color: #333;
            font-weight: 600;
        }
        .stats-card {
            background: white;
            border-radius: 8px;
            box-shadow: 0 2px 6px rgba(0,0,0,0.1);
            margin-bottom: 20px;
            padding: 20px 15px;
            text-align: center;
            transition: transform 0.2s;
        }
        .stats-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 4px 8px rgba(0,0,0,0.15);
        }
        .stats-icon {
            font-size: 28px;
            margin-bottom: 10px;
        }
        .stats-value {
            font-size: 24px;
            font-weight: 700;
            margin-bottom: 5px;
        }
        .stats-label {
            font-size: 14px;
            color: #6c757d;
        }
        .chart-card {
            background: white;
            border-radius: 8px;
            box-shadow: 0 2px 6px rgba(0,0,0,0.1);
            margin-bottom: 20px;
        }
        .chart-header {
            padding: 15px;
            border-bottom: 1px solid #f0f0f0;
            font-weight: 600;
        }
        .chart-body {
            padding: 15px;
            height: 250px;
        }
        .project-icon { color: #0d6efd; }
        .task-icon { color: #198754; }
        .user-icon { color: #6610f2; }
        .complete-icon { color: #20c997; }
        .overdue-icon { color: #dc3545; }
        .milestone-icon { color: #fd7e14; }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container py-3">
            <h2 class="dashboard-title"><i class="fas fa-tachometer-alt me-2"></i>Project Management Dashboard</h2>
            
            <!-- Stats Cards -->
            <div class="row mb-4">
                <!-- Projects Card -->
                <div class="col-md-2 col-sm-4">
                    <div class="stats-card">
                        <div class="stats-icon project-icon">
                            <i class="fas fa-folder"></i>
                        </div>
                        <div class="stats-value" id="projectCount">0</div>
                        <div class="stats-label">Projects</div>
                    </div>
                </div>
                
                <!-- Tasks Card -->
                <div class="col-md-2 col-sm-4">
                    <div class="stats-card">
                        <div class="stats-icon task-icon">
                            <i class="fas fa-tasks"></i>
                        </div>
                        <div class="stats-value" id="taskCount">0</div>
                        <div class="stats-label">Tasks</div>
                    </div>
                </div>
                
                <!-- Users Card -->
                <div class="col-md-2 col-sm-4">
                    <div class="stats-card">
                        <div class="stats-icon user-icon">
                            <i class="fas fa-users"></i>
                        </div>
                        <div class="stats-value" id="userCount">0</div>
                        <div class="stats-label">Users</div>
                    </div>
                </div>
                
                <!-- Completed Tasks Card -->
                <div class="col-md-2 col-sm-4">
                    <div class="stats-card">
                        <div class="stats-icon complete-icon">
                            <i class="fas fa-check-circle"></i>
                        </div>
                        <div class="stats-value" id="completedCount">0</div>
                        <div class="stats-label">Completed</div>
                    </div>
                </div>
                
                <!-- Overdue Tasks Card -->
                <div class="col-md-2 col-sm-4">
                    <div class="stats-card">
                        <div class="stats-icon overdue-icon">
                            <i class="fas fa-exclamation-triangle"></i>
                        </div>
                        <div class="stats-value" id="overdueCount">0</div>
                        <div class="stats-label">Overdue</div>
                    </div>
                </div>
                
                <!-- Milestones Card -->
                <div class="col-md-2 col-sm-4">
                    <div class="stats-card">
                        <div class="stats-icon milestone-icon">
                            <i class="fas fa-flag"></i>
                        </div>
                        <div class="stats-value" id="milestoneCount">0</div>
                        <div class="stats-label">Milestones</div>
                    </div>
                </div>
            </div>
            
            <!-- Task Status Chart -->
            <div class="row justify-content-center">
                <div class="col-md-8">
                    <div class="chart-card">
                        <div class="chart-header">
                            <i class="fas fa-chart-pie me-2"></i>Task Status Distribution
                        </div>
                        <div class="chart-body">
                            <canvas id="taskStatusChart"></canvas>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <!-- Project Count -->
        <asp:FormView ID="ProjectCountForm" runat="server" DataSourceID="ProjectCountDS">
            <ItemTemplate>
                <script>document.getElementById('projectCount').innerText = '<%# Eval("COUNT") %>';</script>
            </ItemTemplate>
        </asp:FormView>
        <asp:SqlDataSource ID="ProjectCountDS" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" 
            SelectCommand="SELECT COUNT(*) AS COUNT FROM PROJECT">
        </asp:SqlDataSource>
        
        <!-- Task Count -->
        <asp:FormView ID="TaskCountForm" runat="server" DataSourceID="TaskCountDS">
            <ItemTemplate>
                <script>document.getElementById('taskCount').innerText = '<%# Eval("COUNT") %>';</script>
            </ItemTemplate>
        </asp:FormView>
        <asp:SqlDataSource ID="TaskCountDS" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" 
            SelectCommand="SELECT COUNT(*) AS COUNT FROM TASK">
        </asp:SqlDataSource>
        
        <!-- User Count -->
        <asp:FormView ID="UserCountForm" runat="server" DataSourceID="UserCountDS">
            <ItemTemplate>
                <script>document.getElementById('userCount').innerText = '<%# Eval("COUNT") %>';</script>
            </ItemTemplate>
        </asp:FormView>
        <asp:SqlDataSource ID="UserCountDS" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" 
            SelectCommand="SELECT COUNT(*) AS COUNT FROM SYSTEMUSER">
        </asp:SqlDataSource>
        
        <!-- Completed Tasks -->
        <asp:FormView ID="CompletedTasksForm" runat="server" DataSourceID="CompletedTasksDS">
            <ItemTemplate>
                <script>document.getElementById('completedCount').innerText = '<%# Eval("COUNT") %>';</script>
            </ItemTemplate>
        </asp:FormView>
        <asp:SqlDataSource ID="CompletedTasksDS" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" 
            SelectCommand="SELECT COUNT(*) AS COUNT FROM TASK WHERE TASKSTATUS = 'Completed'">
        </asp:SqlDataSource>
        
        <!-- Overdue Tasks -->
        <asp:FormView ID="OverdueTasksForm" runat="server" DataSourceID="OverdueTasksDS">
            <ItemTemplate>
                <script>document.getElementById('overdueCount').innerText = '<%# Eval("COUNT") %>';</script>
            </ItemTemplate>
        </asp:FormView>
        <asp:SqlDataSource ID="OverdueTasksDS" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" 
            SelectCommand="SELECT COUNT(*) AS COUNT FROM TASK WHERE TASKDUEDATE < SYSDATE AND TASKSTATUS <> 'Completed'">
        </asp:SqlDataSource>
        
        <!-- Milestones -->
        <asp:FormView ID="MilestoneCountForm" runat="server" DataSourceID="MilestoneCountDS">
            <ItemTemplate>
                <script>document.getElementById('milestoneCount').innerText = '<%# Eval("COUNT") %>';</script>
            </ItemTemplate>
        </asp:FormView>
        <asp:SqlDataSource ID="MilestoneCountDS" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" 
            SelectCommand="SELECT COUNT(*) AS COUNT FROM MILESTONE WHERE MILESTONEDUEDATE > SYSDATE">
        </asp:SqlDataSource>
        
        <!-- Task Status Chart Data -->
        <asp:Repeater ID="TaskStatusRepeater" runat="server" DataSourceID="TaskStatusDS">
            <HeaderTemplate>
                <script>
                    var taskStatusLabels = [];
                    var taskStatusData = [];
                    var taskStatusColors = ['#4bc0c0', '#36a2eb', '#ff6384', '#ffcd56', '#9966ff', '#fd7e14'];
                </script>
            </HeaderTemplate>
            <ItemTemplate>
                <script>
                    taskStatusLabels.push('<%# Eval("TASKSTATUS") %>');
                    taskStatusData.push(<%# Eval("COUNT") %>);
                </script>
            </ItemTemplate>
            <FooterTemplate>
                <script>
                    // Create Task Status Chart
                    var ctxTaskStatus = document.getElementById('taskStatusChart').getContext('2d');
                    var taskStatusChart = new Chart(ctxTaskStatus, {
                        type: 'doughnut',
                        data: {
                            labels: taskStatusLabels,
                            datasets: [{
                                data: taskStatusData,
                                backgroundColor: taskStatusColors,
                                borderWidth: 1
                            }]
                        },
                        options: {
                            responsive: true,
                            maintainAspectRatio: false,
                            plugins: {
                                legend: {
                                    position: 'bottom'
                                }
                            }
                        }
                    });
                </script>
            </FooterTemplate>
        </asp:Repeater>
        <asp:SqlDataSource ID="TaskStatusDS" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" 
            SelectCommand="SELECT TASKSTATUS, COUNT(*) AS COUNT FROM TASK GROUP BY TASKSTATUS">
        </asp:SqlDataSource>
    </form>
</body>
</html>