<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Project.aspx.cs" Inherits="CourseworkDatabase.Project" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Project Management</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" integrity="sha512-9usAa10IRO0HhonpyAIVpjrylPvoDwiPUiKdWk5t3PyolY1cOd4DSE0Ga+ri4AuTroPR5aQvXU9xC6qOPnzFeg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #e9ecef;
            color: #495057;
        }

        .form-control:focus {
            border-color: #546e7a;
            box-shadow: 0 0 0 0.2rem rgba(84, 110, 122, 0.25);
        }

        .btn-primary {
            background-color: #546e7a;
            border-color: #546e7a;
        }

        .btn-primary:hover {
            background-color: #435760;
            border-color: #435760;
        }

        .btn-secondary {
            background-color: #6c757d;
            border-color: #6c757d;
        }

        .btn-secondary:hover {
            background-color: #5a6268;
            border-color: #545b62;
        }

        .table thead th {
            background-color: #546e7a;
            color: white;
            border-color: #546e7a;
            text-align: center;
        }

        .table-striped tbody tr:nth-of-type(odd) {
            background-color: rgba(0, 0, 0, 0.05);
        }

        .table td {
            vertical-align: middle;
        }

        .alert {
            margin-top: 20px;
        }

        /* Hide the insert form by default */
        #insertForm {
            display: none;
            padding: 20px;
            background-color: #f8f9fa;
            border-radius: 5px;
            margin-bottom: 20px;
            border-left: 5px solid #546e7a;
            box-shadow: 0 0.125rem 0.25rem rgba(0, 0, 0, 0.075);
        }

        .card {
            border: none;
            border-radius: 10px;
            box-shadow: 0 0.5rem 1rem rgba(0, 0, 0, 0.15);
            margin-bottom: 20px;
        }

        .card-header {
            background-color: #546e7a;
            color: white;
            border-radius: 10px 10px 0 0;
            padding: 15px;
        }

        .action-buttons .btn {
            margin-right: 5px;
            min-width: 80px;
        }

        .action-btn {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            margin: 0 5px;
            transition: all 0.3s;
        }

        .action-btn:hover {
            transform: scale(1.1);
        }

        .btn-edit {
            background-color: #4caf50;
            border-color: #4caf50;
            color: white;
        }

        .btn-delete {
            background-color: #f44336;
            border-color: #f44336;
            color: white;
        }

        .btn-success {
            background-color: #28a745;
            border-color: #28a745;
            color: white;
        }

        .btn-cancel {
            background-color: #6c757d;
            border-color: #6c757d;
            color: white;
        }

        .form-label {
            font-weight: 500;
            color: #546e7a;
        }

        /* Editing row style */
        .editing-row {
            background-color: #fff8e1 !important;
        }

        /* Status badges */
        .badge-not-started {
            background-color: #dc3545;
        }

        .badge-in-progress {
            background-color: #fd7e14;
        }

        .badge-on-hold {
            background-color: #6c757d;
        }

        .badge-completed {
            background-color: #28a745;
        }

        .project-status {
            font-weight: bold;
            padding: 5px 10px;
            border-radius: 15px;
            color: white;
            display: inline-block;
            min-width: 100px;
            text-align: center;
        }
    </style>
</head>
<body>

    <form id="form1" runat="server" class="container mt-4">
        <asp:Panel ID="AlertPanel" runat="server" Visible="false" CssClass="alert alert-success alert-dismissible fade show" role="alert">
            <asp:Label ID="AlertMessage" runat="server" Text=""></asp:Label>
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </asp:Panel>

        <div class="card">
            <div class="card-header">
                <h3 class="m-0"><i class="fas fa-project-diagram me-2"></i>Project Management</h3>
            </div>
            <div class="card-body">
                <div class="d-flex justify-content-end mb-3">
                    <button type="button" class="btn btn-primary" id="showInsertFormBtn">
                        <i class="fas fa-plus-circle me-2"></i>Add New Project
                    </button>
                </div>

                <div id="insertForm">
                    <h4 class="mb-4"><i class="fas fa-folder-plus me-2"></i>Create New Project</h4>
                    <asp:FormView ID="FormView1" runat="server" DataKeyNames="PROJECTID" DataSourceID="SqlDataSource1" DefaultMode="Insert" Width="100%">
                        <InsertItemTemplate>
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label for="PROJECTIDTextBox" class="form-label">PROJECT ID:</label>
                                    <asp:TextBox ID="PROJECTIDTextBox" runat="server" Text='<%# Bind("PROJECTID") %>' CssClass="form-control" placeholder="Enter project ID" />
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label for="PROJECTNAMETextBox" class="form-label">PROJECT NAME:</label>
                                    <asp:TextBox ID="PROJECTNAMETextBox" runat="server" Text='<%# Bind("PROJECTNAME") %>' CssClass="form-control" placeholder="Enter project name" />
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label for="PROJECTSTARTDATETextBox" class="form-label">START DATE:</label>
                                    <asp:TextBox ID="PROJECTSTARTDATETextBox" runat="server" Text='<%# Bind("PROJECTSTARTDATE") %>' CssClass="form-control" TextMode="Date" />
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label for="PROJECTDUEDATETextBox" class="form-label">DUE DATE:</label>
                                    <asp:TextBox ID="PROJECTDUEDATETextBox" runat="server" Text='<%# Bind("PROJECTDUEDATE") %>' CssClass="form-control" TextMode="Date" />
                                </div>
                            </div>
                            <div class="mb-3">
                                <label for="PROJECTSTATUSDropDown" class="form-label">PROJECT STATUS:</label>
                                <asp:DropDownList ID="PROJECTSTATUSDropDown" runat="server" CssClass="form-select" SelectedValue='<%# Bind("PROJECTSTATUS") %>'>
                                    <asp:ListItem Text="Not Started" Value="Not Started"></asp:ListItem>
                                    <asp:ListItem Text="In Progress" Value="In Progress"></asp:ListItem>
                                    <asp:ListItem Text="On Hold" Value="On Hold"></asp:ListItem>
                                    <asp:ListItem Text="Completed" Value="Completed"></asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class="mt-4">
                                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" CssClass="btn btn-primary">
                                    <i class="fas fa-save me-2"></i>Save Project
                                </asp:LinkButton>
                                <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" CssClass="btn btn-secondary ms-2" OnClientClick="hideInsertForm(); return false;">
                                    <i class="fas fa-times me-2"></i>Cancel
                                </asp:LinkButton>
                            </div>
                        </InsertItemTemplate>
                        <EditItemTemplate>
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label for="PROJECTIDLabel" class="form-label">PROJECT ID:</label>
                                    <asp:Label ID="PROJECTIDLabel" runat="server" Text='<%# Eval("PROJECTID") %>' CssClass="form-control-plaintext fw-bold" />
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label for="PROJECTNAMETextBox" class="form-label">PROJECT NAME:</label>
                                    <asp:TextBox ID="PROJECTNAMETextBox" runat="server" Text='<%# Bind("PROJECTNAME") %>' CssClass="form-control" />
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label for="PROJECTSTARTDATETextBox" class="form-label">START DATE:</label>
                                    <asp:TextBox ID="PROJECTSTARTDATETextBox" runat="server" Text='<%# Bind("PROJECTSTARTDATE", "{0:yyyy-MM-dd}") %>' CssClass="form-control" TextMode="Date" />
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label for="PROJECTDUEDATETextBox" class="form-label">DUE DATE:</label>
                                    <asp:TextBox ID="PROJECTDUEDATETextBox" runat="server" Text='<%# Bind("PROJECTDUEDATE", "{0:yyyy-MM-dd}") %>' CssClass="form-control" TextMode="Date" />
                                </div>
                            </div>
                            <div class="mb-3">
                                <label for="PROJECTSTATUSDropDown" class="form-label">PROJECT STATUS:</label>
                                <asp:DropDownList ID="PROJECTSTATUSDropDown" runat="server" CssClass="form-select" SelectedValue='<%# Bind("PROJECTSTATUS") %>'>
                                    <asp:ListItem Text="Not Started" Value="Not Started"></asp:ListItem>
                                    <asp:ListItem Text="In Progress" Value="In Progress"></asp:ListItem>
                                    <asp:ListItem Text="On Hold" Value="On Hold"></asp:ListItem>
                                    <asp:ListItem Text="Completed" Value="Completed"></asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class="mt-4">
                                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" CssClass="btn btn-success">
                                    <i class="fas fa-check me-2"></i>Update
                                </asp:LinkButton>
                                <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" CssClass="btn btn-secondary ms-2">
                                    <i class="fas fa-times me-2"></i>Cancel
                                </asp:LinkButton>
                            </div>
                        </EditItemTemplate>
                        <ItemTemplate>
                        </ItemTemplate>
                    </asp:FormView>
                </div>

                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="PROJECTID" 
                    DataSourceID="SqlDataSource1" CssClass="table table-striped table-bordered table-hover" AllowPaging="True" 
                    PageSize="10" EmptyDataText="No projects found." BorderWidth="0px">
                    <Columns>
                        <asp:BoundField DataField="PROJECTID" HeaderText="ID" ReadOnly="True" SortExpression="PROJECTID" />
                        <asp:BoundField DataField="PROJECTNAME" HeaderText="NAME" SortExpression="PROJECTNAME" />
                        <asp:BoundField DataField="PROJECTSTARTDATE" HeaderText="START DATE" SortExpression="PROJECTSTARTDATE" DataFormatString="{0:MMM dd, yyyy}" />
                        <asp:BoundField DataField="PROJECTDUEDATE" HeaderText="DUE DATE" SortExpression="PROJECTDUEDATE" DataFormatString="{0:MMM dd, yyyy}" />
                        <asp:TemplateField HeaderText="STATUS" SortExpression="PROJECTSTATUS">
                            <ItemTemplate>
                                <span class="project-status 
                                    <%# Eval("PROJECTSTATUS").ToString() == "Not Started" ? "badge-not-started" :
                                        Eval("PROJECTSTATUS").ToString() == "In Progress" ? "badge-in-progress" :
                                        Eval("PROJECTSTATUS").ToString() == "On Hold" ? "badge-on-hold" :
                                        "badge-completed" %>">
                                    <%# Eval("PROJECTSTATUS") %>
                                </span>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:DropDownList ID="EditStatusDropDown" runat="server" CssClass="form-select" SelectedValue='<%# Bind("PROJECTSTATUS") %>'>
                                    <asp:ListItem Text="Not Started" Value="Not Started"></asp:ListItem>
                                    <asp:ListItem Text="In Progress" Value="In Progress"></asp:ListItem>
                                    <asp:ListItem Text="On Hold" Value="On Hold"></asp:ListItem>
                                    <asp:ListItem Text="Completed" Value="Completed"></asp:ListItem>
                                </asp:DropDownList>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="ACTIONS">
                            <ItemTemplate>
                                <div class="d-flex justify-content-center">
                                    <asp:LinkButton ID="EditButton" runat="server" CommandName="Edit" CssClass="btn action-btn btn-edit" ToolTip="Edit Project">
                                        <i class="fas fa-edit"></i>
                                    </asp:LinkButton>
                                    <asp:LinkButton ID="DeleteButton" runat="server" CommandName="Delete" CssClass="btn action-btn btn-delete" 
                                        ToolTip="Delete Project" OnClientClick="return confirm('Are you sure you want to delete this project?');">
                                        <i class="fas fa-trash"></i>
                                    </asp:LinkButton>
                                </div>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <div class="d-flex justify-content-center">
                                    <asp:LinkButton ID="UpdateButton" runat="server" CommandName="Update" CssClass="btn action-btn btn-success" ToolTip="Save Changes">
                                        <i class="fas fa-check"></i>
                                    </asp:LinkButton>
                                    <asp:LinkButton ID="CancelButton" runat="server" CommandName="Cancel" CssClass="btn action-btn btn-cancel" ToolTip="Cancel Edit">
                                        <i class="fas fa-times"></i>
                                    </asp:LinkButton>
                                </div>
                            </EditItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <HeaderStyle CssClass="table-dark" />
                    <RowStyle CssClass="align-middle" />
                    <EditRowStyle CssClass="editing-row" />
                    <PagerStyle CssClass="pagination-container" HorizontalAlign="Center" />
                    <PagerSettings Mode="NumericFirstLast" FirstPageText="&laquo;" LastPageText="&raquo;" />
                </asp:GridView>
            </div>
        </div>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            DeleteCommand="DELETE FROM &quot;PROJECT&quot; WHERE &quot;PROJECTID&quot; = :PROJECTID" 
            InsertCommand="INSERT INTO &quot;PROJECT&quot; (&quot;PROJECTID&quot;, &quot;PROJECTNAME&quot;, &quot;PROJECTSTARTDATE&quot;, &quot;PROJECTDUEDATE&quot;, &quot;PROJECTSTATUS&quot;) VALUES (:PROJECTID, :PROJECTNAME, :PROJECTSTARTDATE, :PROJECTDUEDATE, :PROJECTSTATUS)" 
            ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" 
            SelectCommand="SELECT &quot;PROJECTID&quot;, &quot;PROJECTNAME&quot;, &quot;PROJECTSTARTDATE&quot;, &quot;PROJECTDUEDATE&quot;, &quot;PROJECTSTATUS&quot; FROM &quot;PROJECT&quot;" 
            UpdateCommand="UPDATE &quot;PROJECT&quot; SET &quot;PROJECTNAME&quot; = :PROJECTNAME, &quot;PROJECTSTARTDATE&quot; = :PROJECTSTARTDATE, &quot;PROJECTDUEDATE&quot; = :PROJECTDUEDATE, &quot;PROJECTSTATUS&quot; = :PROJECTSTATUS WHERE &quot;PROJECTID&quot; = :PROJECTID">
            <DeleteParameters>
                <asp:Parameter Name="PROJECTID" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="PROJECTID" Type="String" />
                <asp:Parameter Name="PROJECTNAME" Type="String" />
                <asp:Parameter Name="PROJECTSTARTDATE" Type="DateTime" />
                <asp:Parameter Name="PROJECTDUEDATE" Type="DateTime" />
                <asp:Parameter Name="PROJECTSTATUS" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="PROJECTNAME" Type="String" />
                <asp:Parameter Name="PROJECTSTARTDATE" Type="DateTime" />
                <asp:Parameter Name="PROJECTDUEDATE" Type="DateTime" />
                <asp:Parameter Name="PROJECTSTATUS" Type="String" />
                <asp:Parameter Name="PROJECTID" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </form>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Function to show the insert form
        document.getElementById('showInsertFormBtn').addEventListener('click', function() {
            document.getElementById('insertForm').style.display = 'block';
            this.style.display = 'none';
        });

        // Function to hide the insert form
        function hideInsertForm() {
            document.getElementById('insertForm').style.display = 'none';
            document.getElementById('showInsertFormBtn').style.display = 'block';
            return false;
        }
    </script>
</body>
</html>