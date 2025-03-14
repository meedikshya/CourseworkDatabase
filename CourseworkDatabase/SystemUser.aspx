<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SystemUser.aspx.cs" Inherits="CourseworkDatabase.SystemUser" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>System Users</title>
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

        /* Input field styling for inline editing */
        .grid-edit-control {
            width: 100%;
            padding: 5px;
            border: 1px solid #ced4da;
            border-radius: 4px;
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
                <h3 class="m-0"><i class="fas fa-users me-2"></i>System Users</h3>
            </div>
            <div class="card-body">
                <div class="d-flex justify-content-end mb-3">
                    <button type="button" class="btn btn-primary" id="showInsertFormBtn">
                        <i class="fas fa-plus-circle me-2"></i>Add New User
                    </button>
                </div>

                <div id="insertForm">
                    <h4 class="mb-4"><i class="fas fa-user-plus me-2"></i>Create New User</h4>
                    <asp:FormView ID="FormView2" runat="server" DataKeyNames="USERID" DataSourceID="SqlDataSource1" DefaultMode="Insert" Width="100%">
                        <InsertItemTemplate>
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label for="USERIDTextBox" class="form-label">USER ID:</label>
                                    <asp:TextBox ID="USERIDTextBox" runat="server" Text='<%# Bind("USERID") %>' CssClass="form-control" />
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label for="USERNAMETextBox" class="form-label">USER NAME:</label>
                                    <asp:TextBox ID="USERNAMETextBox" runat="server" Text='<%# Bind("USERNAME") %>' CssClass="form-control" />
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label for="USEREMAILTextBox" class="form-label">EMAIL ADDRESS:</label>
                                    <asp:TextBox ID="USEREMAILTextBox" runat="server" Text='<%# Bind("USEREMAIL") %>' CssClass="form-control" TextMode="Email" />
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label for="USERCONTACTTextBox" class="form-label">CONTACT NUMBER:</label>
                                    <asp:TextBox ID="USERCONTACTTextBox" runat="server" Text='<%# Bind("USERCONTACT") %>' CssClass="form-control" TextMode="Phone" />
                                </div>
                            </div>
                            <div class="mt-3">
                                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" CssClass="btn btn-primary">
                                    <i class="fas fa-save me-2"></i>Save User
                                </asp:LinkButton>
                                <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" CssClass="btn btn-secondary ms-2" OnClientClick="hideInsertForm(); return false;">
                                    <i class="fas fa-times me-2"></i>Cancel
                                </asp:LinkButton>
                            </div>
                        </InsertItemTemplate>
                        <EditItemTemplate>
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label for="USERIDLabel1" class="form-label">USER ID:</label>
                                    <asp:Label ID="USERIDLabel1" runat="server" Text='<%# Eval("USERID") %>' CssClass="form-control-plaintext fw-bold" />
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label for="USERNAMETextBox" class="form-label">USER NAME:</label>
                                    <asp:TextBox ID="USERNAMETextBox" runat="server" Text='<%# Bind("USERNAME") %>' CssClass="form-control" />
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label for="USEREMAILTextBox" class="form-label">EMAIL ADDRESS:</label>
                                    <asp:TextBox ID="USEREMAILTextBox" runat="server" Text='<%# Bind("USEREMAIL") %>' CssClass="form-control" TextMode="Email" />
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label for="USERCONTACTTextBox" class="form-label">CONTACT NUMBER:</label>
                                    <asp:TextBox ID="USERCONTACTTextBox" runat="server" Text='<%# Bind("USERCONTACT") %>' CssClass="form-control" TextMode="Phone" />
                                </div>
                            </div>
                            <div class="mt-3">
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

                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="USERID" 
                    DataSourceID="SqlDataSource1" CssClass="table table-striped table-bordered table-hover" AllowPaging="True" 
                    PageSize="10" EmptyDataText="No users found." BorderWidth="0px">
                    <Columns>
                        <asp:BoundField DataField="USERID" HeaderText="USER ID" ReadOnly="True" SortExpression="USERID" />
                        <asp:BoundField DataField="USERNAME" HeaderText="USER NAME" SortExpression="USERNAME" />
                        <asp:BoundField DataField="USEREMAIL" HeaderText="EMAIL" SortExpression="USEREMAIL" />
                        <asp:BoundField DataField="USERCONTACT" HeaderText="CONTACT" SortExpression="USERCONTACT" />
                        <asp:TemplateField HeaderText="ACTIONS">
                            <ItemTemplate>
                                <div class="d-flex justify-content-center">
                                    <asp:LinkButton ID="EditButton" runat="server" CommandName="Edit" CssClass="btn action-btn btn-edit" ToolTip="Edit User">
                                        <i class="fas fa-edit"></i>
                                    </asp:LinkButton>
                                    <asp:LinkButton ID="DeleteButton" runat="server" CommandName="Delete" CssClass="btn action-btn btn-delete" 
                                        ToolTip="Delete User" OnClientClick="return confirm('Are you sure you want to delete this user?');">
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
            DeleteCommand="DELETE FROM &quot;SYSTEMUSER&quot; WHERE &quot;USERID&quot; = :USERID" 
            InsertCommand="INSERT INTO &quot;SYSTEMUSER&quot; (&quot;USERID&quot;, &quot;USERNAME&quot;, &quot;USEREMAIL&quot;, &quot;USERCONTACT&quot;) VALUES (:USERID, :USERNAME, :USEREMAIL, :USERCONTACT)" 
            ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" 
            SelectCommand="SELECT &quot;USERID&quot;, &quot;USERNAME&quot;, &quot;USEREMAIL&quot;, &quot;USERCONTACT&quot; FROM &quot;SYSTEMUSER&quot;" 
            UpdateCommand="UPDATE &quot;SYSTEMUSER&quot; SET &quot;USERNAME&quot; = :USERNAME, &quot;USEREMAIL&quot; = :USEREMAIL, &quot;USERCONTACT&quot; = :USERCONTACT WHERE &quot;USERID&quot; = :USERID">
            <DeleteParameters>
                <asp:Parameter Name="USERID" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="USERID" Type="String" />
                <asp:Parameter Name="USERNAME" Type="String" />
                <asp:Parameter Name="USEREMAIL" Type="String" />
                <asp:Parameter Name="USERCONTACT" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="USERNAME" Type="String" />
                <asp:Parameter Name="USEREMAIL" Type="String" />
                <asp:Parameter Name="USERCONTACT" Type="String" />
                <asp:Parameter Name="USERID" Type="String" />
            </UpdateParameters>
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