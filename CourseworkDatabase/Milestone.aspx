<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Milestone.aspx.cs" Inherits="CourseworkDatabase.Milestone" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Milestone Management</title>
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

        /* Project badge styling */
        .project-badge {
            padding: 5px 10px;
            border-radius: 15px;
            width: 50px;
/*            background-color: #7986cb;*/
            color: white;
            font-weight: 500;
            font-size: 0.9rem;
        }

        /* Custom styles for dropdown in table */
        .grid-dropdown {
            background-color: transparent;
            border: none;
            width: 80%;
            color: #495057;
            font-weight: 500;
            cursor: default;
        }

        /* Milestone progress indicators */
        .milestone-status {
            width: 15px;
            height: 15px;
            border-radius: 50%;
            display: inline-block;
            margin-right: 5px;
        }

        .milestone-upcoming {
            background-color: #ffc107;
        }

        .milestone-overdue {
            background-color: #dc3545;
        }

        .milestone-completed {
            background-color: #28a745;
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
                <h3 class="m-0"><i class="fas fa-flag me-2"></i>Milestone Management</h3>
            </div>
            <div class="card-body">
                <div class="d-flex justify-content-end mb-3">
                    <button type="button" class="btn btn-primary" id="showInsertFormBtn">
                        <i class="fas fa-plus-circle me-2"></i>Add New Milestone
                    </button>
                </div>

                <div id="insertForm">
                    <h4 class="mb-4"><i class="fas fa-flag-checkered me-2"></i>Create New Milestone</h4>
                    <asp:FormView ID="FormView1" runat="server" DataKeyNames="MILESTONEID" DataSourceID="SqlDataSource1" DefaultMode="Insert" Width="100%">
                        <InsertItemTemplate>
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label for="MILESTONEIDTextBox" class="form-label">MILESTONE ID:</label>
                                    <asp:TextBox ID="MILESTONEIDTextBox" runat="server" Text='<%# Bind("MILESTONEID") %>' CssClass="form-control" placeholder="Enter milestone ID" />
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label for="MILESTONENAMETextBox" class="form-label">MILESTONE NAME:</label>
                                    <asp:TextBox ID="MILESTONENAMETextBox" runat="server" Text='<%# Bind("MILESTONENAME") %>' CssClass="form-control" placeholder="Enter milestone name" />
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label for="MILESTONEDUEDATETextBox" class="form-label">DUE DATE:</label>
                                    <asp:TextBox ID="MILESTONEDUEDATETextBox" runat="server" Text='<%# Bind("MILESTONEDUEDATE") %>' CssClass="form-control" TextMode="Date" />
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label for="DropDownList1" class="form-label">PROJECT:</label>
                                    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="ProjectNameDataSource" 
                                        DataTextField="ProjectDisplay" DataValueField="PROJECTID" 
                                        SelectedValue='<%# Bind("PROJECTID") %>' CssClass="form-select">
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="mt-4">
                                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" CssClass="btn btn-primary">
                                    <i class="fas fa-save me-2"></i>Save Milestone
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

                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="MILESTONEID" 
                    DataSourceID="SqlDataSource1" CssClass="table table-striped table-bordered table-hover" 
                    AllowPaging="True" PageSize="10" EmptyDataText="No milestones found." BorderWidth="0px">
                    <Columns>
                        <asp:BoundField DataField="MILESTONEID" HeaderText="ID" ReadOnly="True" SortExpression="MILESTONEID" />
                        <asp:BoundField DataField="MILESTONENAME" HeaderText="NAME" SortExpression="MILESTONENAME" />
                        <asp:TemplateField HeaderText="DUE DATE" SortExpression="MILESTONEDUEDATE">
                            <ItemTemplate>
                                <div class="d-flex align-items-center">
                                    <span class="milestone-status 
                                        <%# DateTime.Parse(Eval("MILESTONEDUEDATE").ToString()).Date < DateTime.Now.Date ? "milestone-overdue" :
                                            DateTime.Parse(Eval("MILESTONEDUEDATE").ToString()).Date == DateTime.Now.Date ? "milestone-upcoming" : 
                                            "milestone-upcoming" %>">
                                    </span>
                                    <%# Eval("MILESTONEDUEDATE", "{0:MMM dd, yyyy}") %>
                                </div>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="MILESTONEDUEDATETextBox" runat="server" Text='<%# Bind("MILESTONEDUEDATE", "{0:yyyy-MM-dd}") %>' CssClass="form-control" TextMode="Date" />
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="PROJECT" SortExpression="PROJECTID">
                            <ItemTemplate>
                                <span class="project-badge">
                                    <asp:DropDownList ID="ProjectDropDown" runat="server" Enabled="false" 
                                        DataSourceID="ProjectNameDataSource" 
                                        DataTextField="ProjectDisplay" 
                                        DataValueField="PROJECTID" 
                                        SelectedValue='<%# Bind("PROJECTID") %>'
                                        CssClass="grid-dropdown">
                                    </asp:DropDownList>
                                </span>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:DropDownList ID="DropDownList2" runat="server" 
                                    DataSourceID="ProjectNameDataSource" 
                                    DataTextField="ProjectDisplay" 
                                    DataValueField="PROJECTID" 
                                    SelectedValue='<%# Bind("PROJECTID") %>' 
                                    CssClass="form-select">
                                </asp:DropDownList>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="ACTIONS">
                            <ItemTemplate>
                                <div class="d-flex justify-content-center">
                                    <asp:LinkButton ID="EditButton" runat="server" CommandName="Edit" CssClass="btn action-btn btn-edit" ToolTip="Edit Milestone">
                                        <i class="fas fa-edit"></i>
                                    </asp:LinkButton>
                                    <asp:LinkButton ID="DeleteButton" runat="server" CommandName="Delete" CssClass="btn action-btn btn-delete" 
                                        ToolTip="Delete Milestone" OnClientClick="return confirm('Are you sure you want to delete this milestone?');">
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
            DeleteCommand="DELETE FROM &quot;MILESTONE&quot; WHERE &quot;MILESTONEID&quot; = :MILESTONEID"
            InsertCommand="INSERT INTO &quot;MILESTONE&quot; (&quot;MILESTONEID&quot;, &quot;MILESTONENAME&quot;, &quot;MILESTONEDUEDATE&quot;, &quot;PROJECTID&quot;) 
                           VALUES (:MILESTONEID, :MILESTONENAME, :MILESTONEDUEDATE, :PROJECTID)"
            ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" 
            SelectCommand="SELECT &quot;MILESTONEID&quot;, &quot;MILESTONENAME&quot;, &quot;MILESTONEDUEDATE&quot;, &quot;PROJECTID&quot; FROM &quot;MILESTONE&quot;" 
            UpdateCommand="UPDATE &quot;MILESTONE&quot; SET &quot;MILESTONENAME&quot; = :MILESTONENAME, &quot;MILESTONEDUEDATE&quot; = :MILESTONEDUEDATE, 
                           &quot;PROJECTID&quot; = :PROJECTID WHERE &quot;MILESTONEID&quot; = :MILESTONEID">
            <DeleteParameters>
                <asp:Parameter Name="MILESTONEID" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="MILESTONEID" Type="String" />
                <asp:Parameter Name="MILESTONENAME" Type="String" />
                <asp:Parameter Name="MILESTONEDUEDATE" Type="DateTime" />
                <asp:Parameter Name="PROJECTID" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="MILESTONENAME" Type="String" />
                <asp:Parameter Name="MILESTONEDUEDATE" Type="DateTime" />
                <asp:Parameter Name="PROJECTID" Type="String" />
                <asp:Parameter Name="MILESTONEID" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>

        <asp:SqlDataSource ID="ProjectNameDataSource" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>"
            SelectCommand="SELECT PROJECTID, PROJECTNAME, PROJECTID || ' - ' || PROJECTNAME AS ProjectDisplay 
                           FROM PROJECT">
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
</body>
</html>