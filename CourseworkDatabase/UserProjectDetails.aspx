<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserProjectDetails.aspx.cs" Inherits="CourseworkDatabase.UserProjectDetails" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>User Project Details</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" />
    <style>
        body {
            background-color: #e9ecef;
        }
        
        .table-responsive {
            overflow-x: hidden;
        }
        
        .card {
            border-radius: 10px;
            box-shadow: 0 0.5rem 1rem rgba(0, 0, 0, 0.15);
            margin-bottom: 20px;
        }
        
        .card-header {
            background-color: #546e7a;
            color: white;
            border-radius: 10px 10px 0 0;
        }
        
        .table thead th {
            background-color: #546e7a;
            color: white;
        }

        .badge-status {
            padding: 5px 10px;
            border-radius: 15px;
            font-size: 0.8rem;
            font-weight: 500;
        }
        
        .status-active {
            background-color: #28a745;
        }
        
        .status-pending {
            background-color: #fd7e14;
        }
        
        .status-completed {
            background-color: #6c757d;
        }

        .user-info {
            background-color: #f8f9fa;
            border-radius: 5px;
            padding: 15px;
            margin-bottom: 20px;
            border-left: 5px solid #546e7a;
        }
        
        .user-info .info-item {
            margin-bottom: 8px;
        }
        
        .user-info .info-label {
            font-weight: 600;
            color: #546e7a;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server" class="container mt-4">
        <div class="card">
            <div class="card-header">
                <h3 class="m-0"><i class="fas fa-user-cog me-2"></i>User Project Details</h3>
            </div>
            <div class="card-body">
                <div class="row mb-3">
                    <div class="col-md-6">
                        <label for="DropDownList1" class="form-label">
                            <i class="fas fa-user me-2"></i>Select User:
                        </label>
                        <asp:DropDownList ID="DropDownList1" runat="server" 
                            AutoPostBack="True" 
                            DataSourceID="SqlDataSource2" 
                            DataTextField="DISPLAY_NAME" 
                            DataValueField="USERID" 
                            CssClass="form-select" 
                            OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                        </asp:DropDownList>
                    </div>
                </div>

                <asp:FormView ID="FormView1" runat="server" DataSourceID="SqlDataSource3" 
                    RenderOuterTable="false">
                    <ItemTemplate>
                        <div class="user-info">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="info-item">
                                        <span class="info-label"><i class="fas fa-id-badge me-2"></i>User ID:</span>
                                        <%# Eval("USERID") %>
                                    </div>
                                    <div class="info-item">
                                        <span class="info-label"><i class="fas fa-user me-2"></i>Username:</span>
                                        <%# Eval("USERNAME") %>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="info-item">
                                        <span class="info-label"><i class="fas fa-envelope me-2"></i>Email:</span>
                                        <%# Eval("USEREMAIL") %>
                                    </div>
                                    <div class="info-item">
                                        <span class="info-label"><i class="fas fa-phone me-2"></i>Contact:</span>
                                        <%# Eval("USERCONTACT") %>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:FormView>
                
                <h5 class="mb-3"><i class="fas fa-project-diagram me-2"></i>Assigned Projects</h5>
                
                <div class="table-responsive">
                    <asp:GridView ID="GridView1" runat="server" 
                        AutoGenerateColumns="False" 
                        DataKeyNames="PROJECTID" 
                        DataSourceID="SqlDataSource1" 
                        CssClass="table table-striped table-bordered"
                        EmptyDataText="No projects found for this user">
                        <HeaderStyle CssClass="table-dark" />
                        <Columns>
                            <asp:BoundField DataField="PROJECTID" HeaderText="ID" ReadOnly="True" SortExpression="PROJECTID" />
                            <asp:BoundField DataField="PROJECTNAME" HeaderText="Project Name" SortExpression="PROJECTNAME" />
                            <asp:BoundField DataField="PROJECTSTARTDATE" HeaderText="Start Date" SortExpression="PROJECTSTARTDATE" DataFormatString="{0:MMM dd, yyyy}" />
                            <asp:BoundField DataField="PROJECTDUEDATE" HeaderText="Due Date" SortExpression="PROJECTDUEDATE" DataFormatString="{0:MMM dd, yyyy}" />
                            <asp:TemplateField HeaderText="Status" SortExpression="PROJECTSTATUS">
                                <ItemTemplate>
                                    <span class="badge badge-status 
                                        <%# Eval("PROJECTSTATUS").ToString() == "Active" ? "status-active" : 
                                            Eval("PROJECTSTATUS").ToString() == "Pending" ? "status-pending" : 
                                            "status-completed" %>">
                                        <%# Eval("PROJECTSTATUS") %>
                                    </span>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>
        
        <asp:SqlDataSource ID="SqlDataSource2" runat="server"
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
            ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>"
            SelectCommand="SELECT USERID, (USERID || ' - ' || USERNAME) AS DISPLAY_NAME FROM SYSTEMUSER">
        </asp:SqlDataSource>

        <asp:SqlDataSource ID="SqlDataSource3" runat="server"
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
            ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>"
            SelectCommand="SELECT USERID, USERNAME, USEREMAIL, USERCONTACT FROM SYSTEMUSER WHERE USERID = :userId">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" Name="userId" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" 
            SelectCommand="SELECT 
                p.projectId,
                p.projectName,
                p.projectstartDate,
                p.projectdueDate,  
                p.projectStatus 
            FROM 
                UserProjectAssignment upa
            JOIN 
                Project p ON upa.projectId = p.projectId 
            WHERE 
                upa.userId = :userId">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" Name="userId" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
    </form>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>