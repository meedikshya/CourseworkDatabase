<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Subtask.aspx.cs" Inherits="CourseworkDatabase.Subtask" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Subtask Management</title>
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

        /* Table styles with horizontal scrolling */
        .table-responsive {
            overflow-x: auto;
            width: 100%;
        }

        .table {
            min-width: 1400px; /* Increased min-width for more space */
            width: 100%;
        }

        .table thead th {
            background-color: #546e7a;
            color: white;
            border-color: #546e7a;
            text-align: center;
            position: sticky;
            top: 0;
            z-index: 1;
            padding: 0.75rem; /* Add padding to header cells */
        }

        .table-striped tbody tr:nth-of-type(odd) {
            background-color: rgba(0, 0, 0, 0.05);
        }

        .table td {
            vertical-align: middle;
            padding: 0.75rem; /* Add padding to data cells */
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

        /* Status badge styling */
        .status-badge {
            padding: 5px 10px;
            border-radius: 15px;
            color: white;
            font-weight: 500;
            font-size: 0.9rem;
            display: inline-block;
            width: auto;
            text-align: center;
        }

        .status-pending {
            background-color: #ffc107;
        }

        .status-completed {
            background-color: #28a745;
        }

        .status-progress {
            background-color: #17a2b8;
        }

        .status-delayed {
            background-color: #dc3545;
        }

        /* Custom styles for dropdown in table */
        .grid-dropdown {
            background-color: transparent;
            border: none;
            width: 100%;
            color: #495057;
            font-weight: 500;
            cursor: default;
        }

        /* Improved select dropdown styling */
        .form-select {
            padding: 0.375rem 2.25rem 0.375rem 0.75rem;
            background-color: #fff;
            background-image: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 16 16'%3e%3cpath fill='none' stroke='%23343a40' stroke-linecap='round' stroke-linejoin='round' stroke-width='2' d='M2 5l6 6 6-6'/%3e%3c/svg%3e");
            background-repeat: no-repeat;
            background-position: right 0.75rem center;
            background-size: 16px 12px;
        }
        
        /* Date field styling */
        .date-field {
            position: relative;
        }
        
        .date-field i {
            position: absolute;
            top: 12px;
            right: 10px;
            color: #546e7a;
        }
        
        /* Column width adjustments */
        .col-id {
            width: 80px;
        }
        
        .col-name {
            width: 200px;
        }
        
        .col-description {
            width: 250px;
        }
        
        .col-date {
            width: 200px; /* Adjusted width */
        }
        
        .col-status {
            width: 120px;
        }
        
        .col-user, .col-task {
            width: 350px; 
        }
        
        .col-actions {
            width: 120px;
        }
        
        /* Date and Task/User Column Styling */
        .col-date i {
            margin-right: 5px;
        }
        
        .col-task .grid-dropdown,
        .col-user .grid-dropdown {
            padding: 0.375rem 0.75rem;
            border-radius: 0.25rem;
            background-color: #f8f9fa;
            border: 1px solid #ced4da;
        }
        
        .col-task .grid-dropdown:hover,
        .col-user .grid-dropdown:hover {
            background-color: #e2e6ea;
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
                <h3 class="m-0"><i class="fas fa-tasks me-2"></i>Subtask Management</h3>
            </div>
            <div class="card-body">
                <div class="d-flex justify-content-end mb-3">
                    <button type="button" class="btn btn-primary" id="showInsertFormBtn">
                        <i class="fas fa-plus-circle me-2"></i>Add New Subtask
                    </button>
                </div>

                <div id="insertForm">
                    <h4 class="mb-4"><i class="fas fa-clipboard-list me-2"></i>Create New Subtask</h4>
                    <asp:FormView ID="FormView1" runat="server" DataKeyNames="SUBTASKID" DataSourceID="SqlDataSource1" DefaultMode="Insert" Width="100%">
                        <InsertItemTemplate>
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label for="SUBTASKIDTextBox" class="form-label">Subtask ID:</label>
                                    <asp:TextBox ID="SUBTASKIDTextBox" runat="server" Text='<%# Bind("SUBTASKID") %>' CssClass="form-control" placeholder="Enter subtask ID" />
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label for="SUBTASKNAMETextBox" class="form-label">Name:</label>
                                    <asp:TextBox ID="SUBTASKNAMETextBox" runat="server" Text='<%# Bind("SUBTASKNAME") %>' CssClass="form-control" placeholder="Enter subtask name" />
                                </div>
                            </div>
                            <div class="mb-3">
                                <label for="SUBTASKDESCRIPTIONTextBox" class="form-label">Description:</label>
                                <asp:TextBox ID="SUBTASKDESCRIPTIONTextBox" runat="server" Text='<%# Bind("SUBTASKDESCRIPTION") %>' CssClass="form-control" TextMode="MultiLine" Rows="3" placeholder="Enter description" />
                            </div>
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label for="SUBTASKSTARTDATETextBox" class="form-label">Start Date:</label>
                                    <div class="date-field">
                                        <asp:TextBox ID="SUBTASKSTARTDATETextBox" runat="server" Text='<%# Bind("SUBTASKSTARTDATE", "{0:yyyy-MM-dd}") %>' CssClass="form-control" TextMode="Date" />
                                        <i class="far fa-calendar-alt"></i>
                                    </div>
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label for="SUBTASKDUEDATETextBox" class="form-label">Due Date:</label>
                                    <div class="date-field">
                                        <asp:TextBox ID="SUBTASKDUEDATETextBox" runat="server" Text='<%# Bind("SUBTASKDUEDATE", "{0:yyyy-MM-dd}") %>' CssClass="form-control" TextMode="Date" />
                                        <i class="far fa-calendar-alt"></i>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-4 mb-3">
                                    <label for="SUBTASKSTATUSDropDown" class="form-label">Status:</label>
                                    <asp:DropDownList ID="SUBTASKSTATUSDropDown" runat="server" CssClass="form-select" SelectedValue='<%# Bind("SUBTASKSTATUS") %>'>
                                        <asp:ListItem Text="Pending" Value="Pending"></asp:ListItem>
                                        <asp:ListItem Text="In Progress" Value="In Progress"></asp:ListItem>
                                        <asp:ListItem Text="Completed" Value="Completed"></asp:ListItem>
                                        <asp:ListItem Text="Delayed" Value="Delayed"></asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                                <div class="col-md-4 mb-3">
                                    <label for="DropDownList2" class="form-label">Task:</label>
                                    <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource3" DataTextField="TaskDisplay" DataValueField="TASKID" SelectedValue='<%# Bind("TASKID") %>' CssClass="form-select"></asp:DropDownList>
                                </div>
                                <div class="col-md-4 mb-3">
                                    <label for="DropDownList3" class="form-label">Assigned To:</label>
                                    <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="SqlDataSource2" DataTextField="UserDisplay" DataValueField="USERID" SelectedValue='<%# Bind("USERID") %>' CssClass="form-select"></asp:DropDownList>
                                </div>
                            </div>
                            <div class="mt-4">
                                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" CssClass="btn btn-primary">
                                    <i class="fas fa-save me-2"></i>Save Subtask
                                </asp:LinkButton>
                                <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" CssClass="btn btn-secondary ms-2" OnClientClick="hideInsertForm(); return false;">
                                    <i class="fas fa-times me-2"></i>Cancel
                                </asp:LinkButton>
                            </div>
                        </InsertItemTemplate>
                        <ItemTemplate>
                        </ItemTemplate>
                    </asp:FormView>
                </div>

                <div class="table-responsive">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="SUBTASKID" 
                        DataSourceID="SqlDataSource1" CssClass="table table-striped table-bordered table-hover" 
                        AllowPaging="True" PageSize="10" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                        <Columns>
                            <asp:BoundField DataField="SUBTASKID" HeaderText="ID" ReadOnly="True" SortExpression="SUBTASKID" ItemStyle-CssClass="col-id" />
                            <asp:BoundField DataField="SUBTASKNAME" HeaderText="Name" SortExpression="SUBTASKNAME" ItemStyle-CssClass="col-name" />
                            <asp:BoundField DataField="SUBTASKDESCRIPTION" HeaderText="Description" SortExpression="SUBTASKDESCRIPTION" ItemStyle-CssClass="col-description" />
                            <asp:TemplateField HeaderText="Start Date" SortExpression="SUBTASKSTARTDATE" ItemStyle-CssClass="col-date">
                                <ItemTemplate>
                                    <div class="d-flex align-items-center">
                                        <i class="far fa-calendar-check me-1 text-muted"></i>
                                        <%# Eval("SUBTASKSTARTDATE", "{0:MMM dd, yyyy}") %>
                                    </div>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("SUBTASKSTARTDATE", "{0:yyyy-MM-dd}") %>' CssClass="form-control" TextMode="Date" />
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Due Date" SortExpression="SUBTASKDUEDATE" ItemStyle-CssClass="col-date">
                                <ItemTemplate>
                                    <div class="d-flex align-items-center">
                                        <i class="far fa-calendar-alt me-1 text-muted"></i>
                                        <%# Eval("SUBTASKDUEDATE", "{0:MMM dd, yyyy}") %>
                                    </div>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("SUBTASKDUEDATE", "{0:yyyy-MM-dd}") %>' CssClass="form-control" TextMode="Date" />
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Status" SortExpression="SUBTASKSTATUS" ItemStyle-CssClass="col-status">
                                <ItemTemplate>
                                    <span class="status-badge <%# GetStatusClass(Eval("SUBTASKSTATUS").ToString()) %>">
                                        <%# Eval("SUBTASKSTATUS") %>
                                    </span>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:DropDownList ID="StatusDropDown" runat="server" CssClass="form-select" SelectedValue='<%# Bind("SUBTASKSTATUS") %>'>
                                        <asp:ListItem Text="Pending" Value="Pending"></asp:ListItem>
                                        <asp:ListItem Text="In Progress" Value="In Progress"></asp:ListItem>
                                        <asp:ListItem Text="Completed" Value="Completed"></asp:ListItem>
                                        <asp:ListItem Text="Delayed" Value="Delayed"></asp:ListItem>
                                    </asp:DropDownList>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Task" SortExpression="TASKID" ItemStyle-CssClass="col-task">
                                <ItemTemplate>
                                    <div class="d-flex align-items-center">
                                        <asp:DropDownList Enabled="false" ID="DropDownList5" runat="server" DataSourceID="SqlDataSource3" DataTextField="TaskDisplay" DataValueField="TASKID" SelectedValue='<%# Bind("TASKID") %>' CssClass="grid-dropdown">
                                        </asp:DropDownList>
                                    </div>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:DropDownList ID="DropDownList5" runat="server" DataSourceID="SqlDataSource3" DataTextField="TaskDisplay" DataValueField="TASKID" SelectedValue='<%# Bind("TASKID") %>' CssClass="form-select">
                                    </asp:DropDownList>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Assigned To" SortExpression="USERID" ItemStyle-CssClass="col-user">
                                <ItemTemplate>
                                    <div class="d-flex align-items-center">
                                        <i class="fas fa-user-circle me-2 text-secondary"></i>
                                        <asp:DropDownList Enabled="false" ID="DropDownList4" runat="server" DataSourceID="SqlDataSource2" DataTextField="UserDisplay" DataValueField="USERID" SelectedValue='<%# Bind("USERID") %>' CssClass="grid-dropdown">
                                        </asp:DropDownList>
                                    </div>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:DropDownList ID="DropDownList4" runat="server" DataSourceID="SqlDataSource2" DataTextField="UserDisplay" DataValueField="USERID" SelectedValue='<%# Bind("USERID") %>' CssClass="form-select">
                                    </asp:DropDownList>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Actions" ItemStyle-CssClass="col-actions">
                                <ItemTemplate>
                                    <div class="d-flex justify-content-center">
                                        <asp:LinkButton ID="EditButton" runat="server" CommandName="Edit" CssClass="btn action-btn btn-edit" ToolTip="Edit Subtask">
                                            <i class="fas fa-edit"></i>
                                        </asp:LinkButton>
                                        <asp:LinkButton ID="DeleteButton" runat="server" CommandName="Delete" CssClass="btn action-btn btn-delete" ToolTip="Delete Subtask" OnClientClick="return confirm('Are you sure you want to delete this subtask?');">
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
        </div>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;SUBTASK&quot; WHERE &quot;SUBTASKID&quot; = :SUBTASKID" InsertCommand="INSERT INTO &quot;SUBTASK&quot; (&quot;SUBTASKID&quot;, &quot;SUBTASKNAME&quot;, &quot;SUBTASKDESCRIPTION&quot;, &quot;SUBTASKSTARTDATE&quot;, &quot;SUBTASKDUEDATE&quot;, &quot;SUBTASKSTATUS&quot;, &quot;TASKID&quot;, &quot;USERID&quot;) VALUES (:SUBTASKID, :SUBTASKNAME, :SUBTASKDESCRIPTION, :SUBTASKSTARTDATE, :SUBTASKDUEDATE, :SUBTASKSTATUS, :TASKID, :USERID)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;SUBTASKID&quot;, &quot;SUBTASKNAME&quot;, &quot;SUBTASKDESCRIPTION&quot;, &quot;SUBTASKSTARTDATE&quot;, &quot;SUBTASKDUEDATE&quot;, &quot;SUBTASKSTATUS&quot;, &quot;TASKID&quot;, &quot;USERID&quot; FROM &quot;SUBTASK&quot;" UpdateCommand="UPDATE &quot;SUBTASK&quot; SET &quot;SUBTASKNAME&quot; = :SUBTASKNAME, &quot;SUBTASKDESCRIPTION&quot; = :SUBTASKDESCRIPTION, &quot;SUBTASKSTARTDATE&quot; = :SUBTASKSTARTDATE, &quot;SUBTASKDUEDATE&quot; = :SUBTASKDUEDATE, &quot;SUBTASKSTATUS&quot; = :SUBTASKSTATUS, &quot;TASKID&quot; = :TASKID, &quot;USERID&quot; = :USERID WHERE &quot;SUBTASKID&quot; = :SUBTASKID">
            <DeleteParameters>
                <asp:Parameter Name="SUBTASKID" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="SUBTASKID" Type="String" />
                <asp:Parameter Name="SUBTASKNAME" Type="String" />
                <asp:Parameter Name="SUBTASKDESCRIPTION" Type="String" />
                <asp:Parameter Name="SUBTASKSTARTDATE" Type="DateTime" />
                <asp:Parameter Name="SUBTASKDUEDATE" Type="DateTime" />
                <asp:Parameter Name="SUBTASKSTATUS" Type="String" />
                <asp:Parameter Name="TASKID" Type="String" />
                <asp:Parameter Name="USERID" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="SUBTASKNAME" Type="String" />
                <asp:Parameter Name="SUBTASKDESCRIPTION" Type="String" />
                <asp:Parameter Name="SUBTASKSTARTDATE" Type="DateTime" />
                <asp:Parameter Name="SUBTASKDUEDATE" Type="DateTime" />
                <asp:Parameter Name="SUBTASKSTATUS" Type="String" />
                <asp:Parameter Name="TASKID" Type="String" />
                <asp:Parameter Name="USERID" Type="String" />
                <asp:Parameter Name="SUBTASKID" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>

        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT USERID, USERID || ' - ' || USERNAME AS UserDisplay FROM SYSTEMUSER">
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT TASKID, TASKID || ' - ' || TASKNAME AS TaskDisplay FROM TASK">
        </asp:SqlDataSource>
    </form>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Function to show the insert form
        document.getElementById('showInsertFormBtn').addEventListener('click', function () {
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

    <script runat="server">
        protected string GetStatusClass(string status)
        {
            switch (status)
            {
                case "Completed":
                    return "status-completed";
                case "In Progress":
                    return "status-progress";
                case "Delayed":
                    return "status-delayed";
                default:
                    return "status-pending";
            }
        }
    </script>
</body>
</html>