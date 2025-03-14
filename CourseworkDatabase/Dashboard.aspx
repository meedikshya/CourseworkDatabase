<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="CourseworkDatabase.Dashboard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Dashboard</title>
    <link href="/content/bootstrap.min.css" rel="stylesheet" />
    <style>
        body {
            padding-top: 56px;
        }
        .card {
            margin: 10px; 
        }
        iframe {
            width: 100%;
            height: 300px; 
            border: none;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
            <a class="navbar-brand" href="#">Dashboard</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <asp:HyperLink ID="lnkSystemUser" runat="server" NavigateUrl="SystemUser.aspx" Text="View Users" CssClass="nav-link" />
                    </li>
                    <li class="nav-item">
                        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="Project.aspx" Text="View Projects" CssClass="nav-link" />
                    </li>
                    <li class="nav-item">
                        <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="Task.aspx" Text="View Task" CssClass="nav-link" />
                    </li>
                    <li class="nav-item">
                        <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="Subtask.aspx" Text="View Subtasks" CssClass="nav-link" />
                    </li>
                    <li class="nav-item">
                        <asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="Milestone.aspx" Text="View Milestones" CssClass="nav-link" />
                    </li>
                </ul>
            </div>
        </nav>
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="card">
                        <div class="card-body">
                            <iframe src="UserProjectDetails.aspx"></iframe>
                        </div>
                    </div>
                </div>
                <div class="col-12">
                    <div class="card">
                        <div class="card-body">
                            <iframe src="ProjectMilestone.aspx"></iframe>
                        </div>
                    </div>
                </div>
                <div class="col-12">
                    <div class="card">
                        <div class="card-body">
                            <iframe src="TopPerformer.aspx"></iframe>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
    <script src="/scripts/jquery.min.js"></script>
    <script src="/scripts/bootstrap.bundle.min.js"></script>
</body>
</html>