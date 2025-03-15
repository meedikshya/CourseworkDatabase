<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="CourseworkDatabase.Dashboard" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
<head runat="server">
    <title>Project Management Dashboard</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/chart.js@3.9.1/dist/chart.min.js"></script>
    <style>
        /* General Body Styles */
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f8f9fa;
            color: #333;
            padding: 20px;
            line-height: 1.6;
        }

        /* Container Styles */
        .container {
            max-width: 1200px;
            margin: 0 auto;
        }

        /* Dashboard Title */
        .dashboard-title {
            font-size: 2rem;
            color: #3498db;
            margin-bottom: 30px;
            text-align: center;
            font-weight: 600;
        }

        /* Stats Card Styles */
        .stats-card {
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 0.25rem 0.5rem rgba(0, 0, 0, 0.05);
            padding: 20px;
            margin-bottom: 20px;
            text-align: center;
            transition: transform 0.3s ease;
            border: 1px solid #ddd;
        }

        .stats-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 0.5rem 1rem rgba(0, 0, 0, 0.1);
        }

        .stats-icon {
            font-size: 2.5rem;
            margin-bottom: 10px;
            color: #3498db;
        }

        .stats-value {
            font-size: 1.75rem;
            font-weight: bold;
            color: #333;
        }

        .stats-label {
            font-size: 1rem;
            color: #777;
        }

        /* Chart Card Styles */
        .chart-card {
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 0.25rem 0.5rem rgba(0, 0, 0, 0.05);
            margin-bottom: 20px;
            border: 1px solid #ddd;
        }

        .chart-header {
            padding: 15px;
            border-bottom: 1px solid #ddd;
            font-weight: 500;
            color: #333;
        }

        .chart-body {
            padding: 15px;
            height: 400px; /* Adjusted height */
        }

        /* Icon Colors */
        .project-icon { color: #3498db; }
        .task-icon { color: #2ecc71; }
        .user-icon { color: #9b59b6; }
        .milestone-icon { color: #f39c12; }
        .comment-icon { color: #e67e22; }
        .resource-icon { color: #1abc9c; }

        /* Table Styles */
        .milestone-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        .milestone-table th,
        .milestone-table td {
            padding: 8px 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        .milestone-table th {
            background-color: #f2f2f2;
            font-weight: bold;
        }

        .milestone-table tbody tr:hover {
            background-color: #f9f9f9;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h1 class="dashboard-title"><i class="fas fa-tachometer-alt me-2"></i>Project Management Dashboard</h1>

            <!-- Stats Cards -->
            <div class="row mb-4">
                <div class="col-md-3">
                    <div class="stats-card">
                        <div class="stats-icon project-icon">
                            <i class="fas fa-folder"></i>
                        </div>
                        <div class="stats-value" id="projectCount">0</div>
                        <div class="stats-label">Total Projects</div>
                    </div>
                </div>

                <div class="col-md-3">
                    <div class="stats-card">
                        <div class="stats-icon task-icon">
                            <i class="fas fa-tasks"></i>
                        </div>
                        <div class="stats-value" id="taskCount">0</div>
                        <div class="stats-label">Total Tasks</div>
                    </div>
                </div>

                <div class="col-md-3">
                    <div class="stats-card">
                        <div class="stats-icon user-icon">
                            <i class="fas fa-users"></i>
                        </div>
                        <div class="stats-value" id="userCount">0</div>
                        <div class="stats-label">Total Users</div>
                    </div>
                </div>

                <div class="col-md-3">
                    <div class="stats-card">
                        <div class="stats-icon milestone-icon">
                            <i class="fas fa-flag"></i>
                        </div>
                        <div class="stats-value" id="milestoneCount">0</div>
                        <div class="stats-label">Total Milestones</div>
                    </div>
                </div>
            </div>

            <div class="row mb-4">
                <div class="col-md-3">
                    <div class="stats-card">
                        <div class="stats-icon milestone-icon">
                            <i class="fas fa-flag-checkered"></i>
                        </div>
                        <div class="stats-value" id="upcomingMilestoneCount">0</div>
                        <div class="stats-label">Upcoming Milestones</div>
                    </div>
                </div>

                <div class="col-md-3">
                    <div class="stats-card">
                        <div class="stats-icon task-icon">
                            <i class="fas fa-list-ul"></i>
                        </div>
                        <div class="stats-value" id="subtaskCount">0</div>
                        <div class="stats-label">Total Subtasks</div>
                    </div>
                </div>

                <div class="col-md-3">
                    <div class="stats-card">
                        <div class="stats-icon comment-icon">
                            <i class="fas fa-comment"></i>
                        </div>
                        <div class="stats-value" id="commentCount">0</div>
                        <div class="stats-label">Total Comments</div>
                    </div>
                </div>

                <div class="col-md-3">
                    <div class="stats-card">
                        <div class="stats-icon resource-icon">
                            <i class="fas fa-cubes"></i>
                        </div>
                        <div class="stats-value" id="resourceCount">0</div>
                        <div class="stats-label">Total Resources</div>
                    </div>
                </div>
            </div>

            <!-- Charts -->
            <div class="row">
                <!-- Number of Tasks per Project Chart -->
                <div class="col-md-6">
                    <div class="card chart-card">
                        <div class="card-header chart-header">
                            <i class="fas fa-tasks me-2 project-icon"></i> Tasks per Project
                        </div>
                        <div class="card-body chart-body">
                            <canvas id="tasksPerProjectChart" aria-label="Tasks per Project Chart" role="img"></canvas>
                        </div>
                    </div>
                </div>

                <!-- Number of Subtasks per Task Chart -->
                <div class="col-md-6">
                    <div class="card chart-card">
                        <div class="card-header chart-header">
                            <i class="fas fa-list-ul me-2 task-icon"></i> Subtasks per Task
                        </div>
                        <div class="card-body chart-body">
                            <canvas id="subtasksPerTaskChart" aria-label="Subtasks per Task Chart" role="img"></canvas>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Upcoming Deadlines -->
            <div class="row">
                <!-- Upcoming Milestones -->
                <div class="col-md-6">
                    <div class="card">
                        <div class="card-header">
                            <i class="fas fa-flag-checkered me-2 milestone-icon"></i> Upcoming Milestones
                        </div>
                        <div class="card-body">
                            <table class="table table-sm milestone-table">
                                <thead>
                                    <tr>
                                        <th>Milestone Name</th>
                                        <th>Due Date</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <asp:Repeater ID="UpcomingMilestonesRepeater" runat="server" DataSourceID="UpcomingMilestonesDS">
                                        <ItemTemplate>
                                            <tr>
                                                <td><%# Eval("MilestoneName") %></td>
                                                <td><%# Eval("MilestoneDueDate", "{0:MM/dd/yyyy}") %></td>
                                            </tr>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

                <!-- Upcoming Project Deadlines -->
                <div class="col-md-6">
                    <div class="card">
                        <div class="card-header">
                            <i class="fas fa-project-diagram me-2 project-icon"></i> Upcoming Project Deadlines
                        </div>
                        <div class="card-body">
                            <table class="table table-sm milestone-table">
                                <thead>
                                    <tr>
                                        <th>Project Name</th>
                                        <th>Due Date</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <asp:Repeater ID="UpcomingProjectsRepeater" runat="server" DataSourceID="UpcomingProjectsDS">
                                        <ItemTemplate>
                                            <tr>
                                                <td><%# Eval("ProjectName") %></td>
                                                <td><%# Eval("ProjectDueDate", "{0:MM/dd/yyyy}") %></td>
                                            </tr>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <!-- Upcoming Task Deadlines -->
                <div class="col-md-6">
                    <div class="card">
                        <div class="card-header">
                            <i class="fas fa-tasks me-2 task-icon"></i> Upcoming Task Deadlines
                        </div>
                        <div class="card-body">
                            <table class="table table-sm milestone-table">
                                <thead>
                                    <tr>
                                        <th>Task Name</th>
                                        <th>Due Date</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <asp:Repeater ID="UpcomingTasksRepeater" runat="server" DataSourceID="UpcomingTasksDS">
                                        <ItemTemplate>
                                            <tr>
                                                <td><%# Eval("TaskName") %></td>
                                                <td><%# Eval("TaskDueDate", "{0:MM/dd/yyyy}") %></td>
                                            </tr>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

                <!-- Upcoming Subtask Deadlines -->
                <div class="col-md-6">
                    <div class="card">
                        <div class="card-header">
                            <i class="fas fa-list-ul me-2 task-icon"></i> Upcoming Subtask Deadlines
                        </div>
                        <div class="card-body">
                            <table class="table table-sm milestone-table">
                                <thead>
                                    <tr>
                                        <th>Subtask Name</th>
                                        <th>Due Date</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <asp:Repeater ID="UpcomingSubtasksRepeater" runat="server" DataSourceID="UpcomingSubtasksDS">
                                        <ItemTemplate>
                                            <tr>
                                                <td><%# Eval("SubTaskName") %></td>
                                                <td><%# Eval("SubTaskDueDate", "{0:MM/dd/yyyy}") %></td>
                                            </tr>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </tbody>
                            </table>
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

        <!-- Milestones -->
        <asp:FormView ID="MilestoneCountForm" runat="server" DataSourceID="MilestoneCountDS">
            <ItemTemplate>
                <script>document.getElementById('milestoneCount').innerText = '<%# Eval("COUNT") %>';</script>
            </ItemTemplate>
        </asp:FormView>
        <asp:SqlDataSource ID="MilestoneCountDS" runat="server"
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
            ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>"
            SelectCommand="SELECT COUNT(*) AS COUNT FROM MILESTONE">
        </asp:SqlDataSource>

        <!-- Upcoming Milestones -->
        <asp:FormView ID="UpcomingMilestoneCountForm" runat="server" DataSourceID="UpcomingMilestoneCountDS">
            <ItemTemplate>
                <script>document.getElementById('upcomingMilestoneCount').innerText = '<%# Eval("COUNT") %>';</script>
            </ItemTemplate>
        </asp:FormView>
        <asp:SqlDataSource ID="UpcomingMilestoneCountDS" runat="server"
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
            ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>"
            SelectCommand="SELECT COUNT(*) AS COUNT FROM MILESTONE WHERE MILESTONEDUEDATE > SYSDATE">
        </asp:SqlDataSource>

        <!-- Subtask Count -->
        <asp:FormView ID="SubtaskCountForm" runat="server" DataSourceID="SubtaskCountDS">
            <ItemTemplate>
                <script>document.getElementById('subtaskCount').innerText = '<%# Eval("COUNT") %>';</script>
            </ItemTemplate>
        </asp:FormView>
        <asp:SqlDataSource ID="SubtaskCountDS" runat="server"
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
            ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>"
            SelectCommand="SELECT COUNT(*) AS COUNT FROM SUBTASK">
        </asp:SqlDataSource>

        <!-- Comment Count -->
        <asp:FormView ID="CommentCountForm" runat="server" DataSourceID="CommentCountDS">
            <ItemTemplate>
                <script>document.getElementById('commentCount').innerText = '<%# Eval("COUNT") %>';</script>
            </ItemTemplate>
        </asp:FormView>
        <asp:SqlDataSource ID="CommentCountDS" runat="server"
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
            ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>"
            SelectCommand='SELECT COUNT(*) AS COUNT FROM "Comment"'>
        </asp:SqlDataSource>

        <!-- Resource Count -->
        <asp:FormView ID="ResourceCountForm" runat="server" DataSourceID="ResourceCountDS">
            <ItemTemplate>
                <script>document.getElementById('resourceCount').innerText = '<%# Eval("COUNT") %>';</script>
            </ItemTemplate>
        </asp:FormView>
        <asp:SqlDataSource ID="ResourceCountDS" runat="server"
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
            ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>"
            SelectCommand='SELECT COUNT(*) AS COUNT FROM "Resource"'>
        </asp:SqlDataSource>

        <!-- Tasks per Project DataSource -->
        <asp:SqlDataSource ID="TasksPerProjectDS" runat="server"
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
            ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>"
            SelectCommand="SELECT 
                p.ProjectId,
                p.ProjectName,
                COUNT(t.TaskId) AS NumberOfTasks
            FROM 
                Project p
            LEFT JOIN 
                UserProjectAssignment upa ON p.ProjectId = upa.ProjectId
            LEFT JOIN 
                UserTaskProjectAssignment utpa ON upa.UserProjectId = utpa.UserProjectId
            LEFT JOIN 
                Task t ON utpa.TaskId = t.TaskId
            GROUP BY 
                p.ProjectId, p.ProjectName">
        </asp:SqlDataSource>

        <!-- Repeater for Tasks per Project -->
        <asp:Repeater ID="TasksPerProjectRepeater" runat="server" DataSourceID="TasksPerProjectDS">
            <ItemTemplate>
                <span style="display:none;"
                    class="project-task-data"
                    data-project-name='<%# Eval("ProjectName") %>'
                    data-task-count='<%# Eval("NumberOfTasks") %>'>
                </span>
            </ItemTemplate>
        </asp:Repeater>

        <!-- Subtasks per Task DataSource -->
        <asp:SqlDataSource ID="SubtasksPerTaskDS" runat="server"
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
            ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>"
            SelectCommand="SELECT 
                t.TaskId,
                t.TaskName,
                COUNT(st.SubTaskId) AS NumberOfSubTasks
            FROM 
                Task t
            LEFT JOIN 
                SubTask st ON t.TaskId = st.TaskId
            GROUP BY 
                t.TaskId, t.TaskName">
        </asp:SqlDataSource>

        <!-- Repeater for Subtasks per Task -->
        <asp:Repeater ID="SubtasksPerTaskRepeater" runat="server" DataSourceID="SubtasksPerTaskDS">
            <ItemTemplate>
                <span style="display:none;"
                    class="task-subtask-data"
                    data-task-name='<%# Eval("TaskName") %>'
                    data-subtask-count='<%# Eval("NumberOfSubTasks") %>'>
                </span>
            </ItemTemplate>
        </asp:Repeater>

        <!-- Upcoming Milestones DataSource -->
        <asp:SqlDataSource ID="UpcomingMilestonesDS" runat="server"
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
            ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>"
            SelectCommand="SELECT 
                MilestoneName,
                MilestoneDueDate
            FROM 
                Milestone
            WHERE 
                MilestoneDueDate BETWEEN TRUNC(SYSDATE) AND TRUNC(SYSDATE + 30)">
        </asp:SqlDataSource>

               <!-- Upcoming Projects DataSource -->
        <asp:SqlDataSource ID="UpcomingProjectsDS" runat="server"
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
            ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>"
            SelectCommand="SELECT 
                ProjectName,
                ProjectDueDate
            FROM 
                Project
            WHERE 
                ProjectDueDate BETWEEN TRUNC(SYSDATE) AND TRUNC(SYSDATE + 30)">
        </asp:SqlDataSource>

        <!-- Upcoming Tasks DataSource -->
        <asp:SqlDataSource ID="UpcomingTasksDS" runat="server"
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
            ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>"
            SelectCommand="SELECT 
                TaskName,
                TaskDueDate
            FROM 
                Task
            WHERE 
                TaskDueDate BETWEEN TRUNC(SYSDATE) AND TRUNC(SYSDATE + 30)">
        </asp:SqlDataSource>

        <!-- Upcoming Subtasks DataSource -->
        <asp:SqlDataSource ID="UpcomingSubtasksDS" runat="server"
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
            ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>"
            SelectCommand="SELECT 
                SubTaskName,
                SubTaskDueDate
            FROM 
                SubTask
            WHERE 
                SubTaskDueDate BETWEEN TRUNC(SYSDATE) AND TRUNC(SYSDATE + 30)">
        </asp:SqlDataSource>

        <!-- Project-Task-User Relationships DataSource -->
<asp:SqlDataSource ID="ProjectTaskUserDS" runat="server"
    ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
    ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>"
    SelectCommand="SELECT 
        p.ProjectName,
        t.TaskName,
        st.SubTaskName,
        u.UserName
    FROM 
        Project p
    LEFT JOIN 
        UserProjectAssignment upa ON p.ProjectId = upa.ProjectId
    LEFT JOIN 
        SystemUser u ON upa.UserId = u.UserId
    LEFT JOIN 
        UserTaskProjectAssignment utpa ON upa.UserProjectId = utpa.UserProjectId
    LEFT JOIN 
        Task t ON utpa.TaskId = t.TaskId
    LEFT JOIN 
        SubTask st ON t.TaskId = st.TaskId">
</asp:SqlDataSource>

        <!-- Chart JavaScript -->
        <script>
            document.addEventListener('DOMContentLoaded', function () {
                // Tasks per Project Chart
                const projectTaskDataElements = document.querySelectorAll('.project-task-data');
                const projectNames = [];
                const numberOfTasks = [];

                projectTaskDataElements.forEach(function (element) {
                    projectNames.push(element.getAttribute('data-project-name'));
                    numberOfTasks.push(parseInt(element.getAttribute('data-task-count')));
                });

                const tasksCtx = document.getElementById('tasksPerProjectChart').getContext('2d');
                new Chart(tasksCtx, {
                    type: 'bar',
                    data: {
                        labels: projectNames,
                        datasets: [{
                            label: 'Number of Tasks',
                            data: numberOfTasks,
                            backgroundColor: 'rgba(54, 162, 235, 0.7)', // Blue
                            borderWidth: 1
                        }]
                    },
                    options: {
                        responsive: true,
                        maintainAspectRatio: false,
                        scales: {
                            y: {
                                beginAtZero: true,
                                title: {
                                    display: true,
                                    text: 'Number of Tasks'
                                }
                            },
                            x: {
                                title: {
                                    display: true,
                                    text: 'Projects'
                                }
                            }
                        },
                        plugins: {
                            legend: {
                                display: false
                            }
                        }
                    }
                });

                // Subtasks per Task Chart
                const taskSubtaskDataElements = document.querySelectorAll('.task-subtask-data');
                const taskNames = [];
                const numberOfSubtasks = [];

                taskSubtaskDataElements.forEach(function (element) {
                    taskNames.push(element.getAttribute('data-task-name'));
                    numberOfSubtasks.push(parseInt(element.getAttribute('data-subtask-count')));
                });

                const subtasksCtx = document.getElementById('subtasksPerTaskChart').getContext('2d');
                new Chart(subtasksCtx, {
                    type: 'bar',
                    data: {
                        labels: taskNames,
                        datasets: [{
                            label: 'Number of Subtasks',
                            data: numberOfSubtasks,
                            backgroundColor: 'rgba(255, 99, 132, 0.7)', // Red
                            borderWidth: 1
                        }]
                    },
                    options: {
                        responsive: true,
                        maintainAspectRatio: false,
                        scales: {
                            y: {
                                beginAtZero: true,
                                title: {
                                    display: true,
                                    text: 'Number of Subtasks'
                                }
                            },
                            x: {
                                title: {
                                    display: true,
                                    text: 'Tasks'
                                }
                            }
                        },
                        plugins: {
                            legend: {
                                display: false
                            }
                        }
                    }
                });
            });
        </script>
    </form>
</body>
</html>