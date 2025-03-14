<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Navbar.aspx.cs" Inherits="CourseworkDatabase.Navbar" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Project Management Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" integrity="sha512-9usAa10IRO0HhonpyAIVpjrylPvoDwiPUiKdWk5t3PyolY1cOd4DSE0Ga+ri4AuTroPR5aQvXU9xC6qOPnzFeg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <style>
        body {
            padding-top: 50px; /* Further reduced padding for smaller navbar */
            font-family: 'Arial', sans-serif; /* Simpler font */
            background-color: #e9ecef; /* Lighter background */
            color: #495057;
        }

        /* Compact Navbar Styles */
        .navbar {
            background-color: #546e7a; /* Muted dark blue-gray */
            box-shadow: 0 1px 3px rgba(0,0,0,.1);
        }

        .navbar-brand {
            color: #fff;
            font-size: 1.2em; /* Further reduced brand size */
            font-weight: bold;
        }

        .navbar-nav .nav-link {
            color: rgba(255,255,255,.7) !important;
            font-size: 0.85em; /* Significantly reduced font size */
            padding: 6px 10px; /* Further reduced padding */
            transition: color 0.3s ease, background-color 0.3s ease;
        }

        .navbar-nav .nav-link:hover, .navbar-nav .nav-link:focus {
            color: #fff !important;
            background-color: rgba(255,255,255,.1);
            border-radius: 4px;
        }

        .navbar-toggler-icon {
            background-color: #fff;
        }

        /* Iframe Styles */
        .iframe-container {
            margin-top: 15px; /* Further reduced margin */
/*            box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);*/
            border-radius: 6px;
            overflow: hidden;
        }

        iframe {
            border: none;
            height: 200vh; /* Increased iframe height */
            width: 100%;
        }

        /* Responsive Adjustments */
        @media (max-width: 992px) { /* Adjusted breakpoint */
            body {
                padding-top: 40px; /* Even smaller padding for small screens */
            }

            .navbar-brand {
                font-size: 1em;
            }

            .navbar-nav .nav-link {
                font-size: 0.75em;
                padding: 4px 8px;
            }

            iframe {
                height: 65vh; /* Adjust iframe height for smaller screens */
            }
        }
    </style>
</head>
<body>

    <!-- Bootstrap Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark fixed-top">
        <div class="container">
            <a class="navbar-brand" href="#">
                LS Corporation
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="Dashboard.aspx" target="contentFrame">Dashboard</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="SystemUser.aspx" target="contentFrame">Users</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="Project.aspx" target="contentFrame">Projects</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="Milestone.aspx" target="contentFrame">Milestones</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="Task.aspx" target="contentFrame">Tasks</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="Subtask.aspx" target="contentFrame">Subtasks</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="ProjectMilestone.aspx" target="contentFrame">Project Milestones</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="UserProjectDetails.aspx" target="contentFrame">User Projects</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="TopPerformer.aspx" target="contentFrame">Top Performers</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Iframe to load content -->
        <iframe name="contentFrame" src="Dashboard.aspx"></iframe>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/2.11.6/umd/popper.min.js"></script>
</body>
</html>