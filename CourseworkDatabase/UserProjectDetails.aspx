<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserProjectDetails.aspx.cs" Inherits="CourseworkDatabase.UserProjectDetails" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="/content/bootstrap.min.css" rel="stylesheet" />
    <style>
        .card-body {
            max-height: 200px; /* Reduced height */
            overflow-y: auto;
        }
        .table-responsive {
            overflow-x: hidden;
        }
        .container {
            padding: 0;
        }
        .table th, .table td {
            font-size: 0.85rem;
            padding: 0.25rem;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server" class="container-fluid mt-3">
        <div class="row justify-content-center">
            <div class="col-12">
                <div class="card">
                    <div class="card-header">
                        User Project Details
                    </div>
                    <div class="card-body">
                        <div class="form-group">
                            <label for="DropDownList1">Select User:</label>
                     <asp:DropDownList ID="DropDownList1" runat="server" 
    AutoPostBack="True" 
    DataSourceID="SqlDataSource2" 
    DataTextField="DISPLAY_NAME" 
    DataValueField="USERID" 
    CssClass="form-control" 
    OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
</asp:DropDownList>
                        </div>
                        <div class="table-responsive">
                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="USERID,PROJECTID" DataSourceID="SqlDataSource1" CssClass="table table-striped table-bordered mt-3">
                                <Columns>
                                    <asp:BoundField DataField="USERID" HeaderText="USERID" ReadOnly="True" SortExpression="USERID" />
                                    <asp:BoundField DataField="USERNAME" HeaderText="USERNAME" SortExpression="USERNAME" />
                                    <asp:BoundField DataField="USEREMAIL" HeaderText="USEREMAIL" SortExpression="USEREMAIL" />
                                    <asp:BoundField DataField="USERCONTACT" HeaderText="USERCONTACT" SortExpression="USERCONTACT" />
                                    <asp:BoundField DataField="PROJECTID" HeaderText="PROJECTID" ReadOnly="True" SortExpression="PROJECTID" />
                                    <asp:BoundField DataField="PROJECTNAME" HeaderText="PROJECTNAME" SortExpression="PROJECTNAME" />
                                    <asp:BoundField DataField="PROJECTSTARTDATE" HeaderText="PROJECTSTARTDATE" SortExpression="PROJECTSTARTDATE" />
                                    <asp:BoundField DataField="PROJECTDUEDATE" HeaderText="PROJECTDUEDATE" SortExpression="PROJECTDUEDATE" />
                                    <asp:BoundField DataField="PROJECTSTATUS" HeaderText="PROJECTSTATUS" SortExpression="PROJECTSTATUS" />
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server"
    ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
    ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>"
    SelectCommand="SELECT USERID, (USERID || ' - ' || USERNAME) AS DISPLAY_NAME FROM SYSTEMUSER"></asp:SqlDataSource>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT 
    su.userId,
    su.userName,
    su.useremail,
    su.usercontact,
    p.projectId,
    p.projectName,
   p.projectstartDate,
    p.projectdueDate,  p.projectStatus 
FROM SystemUser su
 JOIN UserProjectAssignment upa ON su.userId = upa.userId
 JOIN Project p ON upa.projectId = p.projectId WHERE su.userId = :userId">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" Name="userId" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
    </form>
    <script src="/scripts/jquery.min.js"></script>
    <script src="/scripts/bootstrap.bundle.min.js"></script>
</body>
</html>