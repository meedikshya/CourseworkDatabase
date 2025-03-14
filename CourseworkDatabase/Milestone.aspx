<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Milestone.aspx.cs" Inherits="CourseworkDatabase.Milestone" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="/content/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server" class="container mt-5">
                <asp:FormView ID="FormView1" runat="server" DataKeyNames="MILESTONEID" DataSourceID="SqlDataSource1">
                    <InsertItemTemplate>
                        <div class="form-group">
                            <label for="MILESTONEIDTextBox">MILESTONEID:</label>
                            <asp:TextBox ID="MILESTONEIDTextBox" runat="server" Text='<%# Bind("MILESTONEID") %>' CssClass="form-control" />
                        </div>
                        <div class="form-group">
                            <label for="MILESTONENAMETextBox">MILESTONENAME:</label>
                            <asp:TextBox ID="MILESTONENAMETextBox" runat="server" Text='<%# Bind("MILESTONENAME") %>' CssClass="form-control" />
                        </div>
                        <div class="form-group">
                            <label for="MILESTONEDUEDATETextBox">MILESTONEDUEDATE:</label>
                            <asp:TextBox ID="MILESTONEDUEDATETextBox" runat="server" Text='<%# Bind("MILESTONEDUEDATE") %>' CssClass="form-control" />
                        </div>
                        <div class="form-group">
                            <label for="DropDownList1">PROJECT:</label>
                           <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" 
    DataTextField="ProjectDisplay" DataValueField="PROJECTID" 
    SelectedValue='<%# Bind("PROJECTID") %>' CssClass="form-control">
</asp:DropDownList>
                        </div>
                        <br />
                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" CssClass="btn btn-primary" />
                        <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="btn btn-secondary" />
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="Insert" CssClass="btn btn-primary mb-3" />
                    </ItemTemplate>
                </asp:FormView>
                <br />
        <div class="card mb-4">
            <div class="card-header">
                Milestone List
            </div>
            <div class="card-body">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="MILESTONEID" DataSourceID="SqlDataSource1" CssClass="table table-striped" AllowPaging="True">
                    <Columns>
                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                        <asp:BoundField DataField="MILESTONEID" HeaderText="MILESTONEID" ReadOnly="True" SortExpression="MILESTONEID" />
                        <asp:BoundField DataField="MILESTONENAME" HeaderText="MILESTONENAME" SortExpression="MILESTONENAME" />
                        <asp:BoundField DataField="MILESTONEDUEDATE" HeaderText="MILESTONEDUEDATE" SortExpression="MILESTONEDUEDATE" />
                        <asp:TemplateField HeaderText="Project Name" >
                            <ItemTemplate>
                                <asp:DropDownList Enabled="false" ID="DropDownList2" runat="server" DataSourceID="ProjectNameDataSource" DataTextField="ProjectDisplay" DataValueField="PROJECTID" SelectedValue='<%# Bind("PROJECTID") %>'>
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="ProjectNameDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>"
                                      SelectCommand="SELECT PROJECTID, PROJECTNAME, PROJECTID || ' - ' || PROJECTNAME AS ProjectDisplay FROM PROJECT">
                                   </asp:SqlDataSource>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;MILESTONE&quot; WHERE &quot;MILESTONEID&quot; = :MILESTONEID" InsertCommand="INSERT INTO &quot;MILESTONE&quot; (&quot;MILESTONEID&quot;, &quot;MILESTONENAME&quot;, &quot;MILESTONEDUEDATE&quot;, &quot;PROJECTID&quot;) VALUES (:MILESTONEID, :MILESTONENAME, :MILESTONEDUEDATE, :PROJECTID)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;MILESTONEID&quot;, &quot;MILESTONENAME&quot;, &quot;MILESTONEDUEDATE&quot;, &quot;PROJECTID&quot; FROM &quot;MILESTONE&quot;" UpdateCommand="UPDATE &quot;MILESTONE&quot; SET &quot;MILESTONENAME&quot; = :MILESTONENAME, &quot;MILESTONEDUEDATE&quot; = :MILESTONEDUEDATE, &quot;PROJECTID&quot; = :PROJECTID WHERE &quot;MILESTONEID&quot; = :MILESTONEID">
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
                <asp:Parameter Name="PROJECTNAME" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
       <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
    ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" 
    SelectCommand="SELECT PROJECTID, PROJECTNAME, PROJECTID || ' - ' || PROJECTNAME AS ProjectDisplay FROM PROJECT">
</asp:SqlDataSource>
        </form>
</body>
</html>