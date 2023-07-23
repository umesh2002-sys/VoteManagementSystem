<%@ Page Title="Employee" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Employee.aspx.cs" Inherits="voteManagementSystem.Employee" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %>.</h2>
<p>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;DEPARTMENT_ID&quot;, &quot;DEPARTMENT_NAME&quot; FROM &quot;DEPARTMENT&quot;"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;ROLE_ID&quot;, &quot;ROLE&quot; FROM &quot;ROLE&quot;"></asp:SqlDataSource>
</p>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="EMPLOYEE_ID" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" Height="218px" Width="1212px" AllowSorting="True">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="EMPLOYEE_ID" HeaderText="EMPLOYEE_ID" ReadOnly="True" SortExpression="EMPLOYEE_ID" />
            <asp:BoundField DataField="EMPLOYEE_NAME" HeaderText="EMPLOYEE_NAME" SortExpression="EMPLOYEE_NAME" />
            <asp:BoundField DataField="DOB" HeaderText="DOB" SortExpression="DOB" />
            <asp:BoundField DataField="CONTACT" HeaderText="CONTACT" SortExpression="CONTACT" />
            <asp:BoundField DataField="DEPARTMENT_ID" HeaderText="DEPARTMENT_ID" SortExpression="DEPARTMENT_ID" />
            <asp:BoundField DataField="ROLE_ID" HeaderText="ROLE_ID" SortExpression="ROLE_ID" />
            <asp:CommandField EditText="Edit" DeleteText="Delete"
            ControlStyle-CssClass="btn btn-primary btn-sm" ShowDeleteButton="True" ShowEditButton="True" ><ControlStyle CssClass="btn btn-primary btn-sm" /></asp:CommandField>
        </Columns>
        <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F5F7FB" />
        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
        <SortedDescendingCellStyle BackColor="#E9EBEF" />
        <SortedDescendingHeaderStyle BackColor="#4870BE" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;EMPLOYEE&quot; WHERE &quot;EMPLOYEE_ID&quot; = :EMPLOYEE_ID" InsertCommand="INSERT INTO &quot;EMPLOYEE&quot; (&quot;EMPLOYEE_ID&quot;, &quot;EMPLOYEE_NAME&quot;, &quot;DOB&quot;, &quot;CONTACT&quot;, &quot;DEPARTMENT_ID&quot;, &quot;ROLE_ID&quot;) VALUES (:EMPLOYEE_ID, :EMPLOYEE_NAME, :DOB, :CONTACT, :DEPARTMENT_ID, :ROLE_ID)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM &quot;EMPLOYEE&quot;" UpdateCommand="UPDATE &quot;EMPLOYEE&quot; SET &quot;EMPLOYEE_NAME&quot; = :EMPLOYEE_NAME, &quot;DOB&quot; = :DOB, &quot;CONTACT&quot; = :CONTACT, &quot;DEPARTMENT_ID&quot; = :DEPARTMENT_ID, &quot;ROLE_ID&quot; = :ROLE_ID WHERE &quot;EMPLOYEE_ID&quot; = :EMPLOYEE_ID">
        <DeleteParameters>
            <asp:Parameter Name="EMPLOYEE_ID" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="EMPLOYEE_ID" Type="String" />
            <asp:Parameter Name="EMPLOYEE_NAME" Type="String" />
            <asp:Parameter Name="DOB" Type="DateTime" />
            <asp:Parameter Name="CONTACT" Type="Decimal" />
            <asp:Parameter Name="DEPARTMENT_ID" Type="String" />
            <asp:Parameter Name="ROLE_ID" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="EMPLOYEE_NAME" Type="String" />
            <asp:Parameter Name="DOB" Type="DateTime" />
            <asp:Parameter Name="CONTACT" Type="Decimal" />
            <asp:Parameter Name="DEPARTMENT_ID" Type="String" />
            <asp:Parameter Name="ROLE_ID" Type="String" />
            <asp:Parameter Name="EMPLOYEE_ID" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:FormView ID="FormView1" runat="server" DataKeyNames="EMPLOYEE_ID" DataSourceID="SqlDataSource1" OnPageIndexChanging="FormView1_PageIndexChanging">
        <EditItemTemplate>
            EMPLOYEE_ID:
            <asp:Label ID="EMPLOYEE_IDLabel1" runat="server" Text='<%# Eval("EMPLOYEE_ID") %>' />
            <br />
            EMPLOYEE_NAME:
            <asp:TextBox ID="EMPLOYEE_NAMETextBox" runat="server" Text='<%# Bind("EMPLOYEE_NAME") %>' />
            <br />
            DOB:
            <asp:TextBox ID="DOBTextBox" runat="server" Text='<%# Bind("DOB") %>' />
            <br />
            CONTACT:
            <asp:TextBox ID="CONTACTTextBox" runat="server" Text='<%# Bind("CONTACT") %>' />
            <br />
            DEPARTMENT_ID:
            <asp:TextBox ID="DEPARTMENT_IDTextBox" runat="server" Text='<%# Bind("DEPARTMENT_ID") %>' />
            <br />
            ROLE_ID:
            <asp:TextBox ID="ROLE_IDTextBox" runat="server" Text='<%# Bind("ROLE_ID") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>
        <InsertItemTemplate>
            <h2>Add Employees</h2>
            EMPLOYEE_ID:
            <asp:TextBox ID="EMPLOYEE_IDTextBox" runat="server" Text='<%# Bind("EMPLOYEE_ID") %>' CssClass="form-control"/>
            <br />
            EMPLOYEE_NAME:
            <asp:TextBox ID="EMPLOYEE_NAMETextBox" runat="server" Text='<%# Bind("EMPLOYEE_NAME") %>' CssClass="form-control"/>
            <br />
            DOB:
            <asp:TextBox ID="DOBTextBox" runat="server" Text='<%# Bind("DOB") %>' CssClass="form-control"/>
            <br />
            CONTACT:
            <asp:TextBox ID="CONTACTTextBox" runat="server" Text='<%# Bind("CONTACT") %>' CssClass="form-control"/>
            <br />
            DEPARTMENT_ID:
            <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="SqlDataSource2" DataTextField="DEPARTMENT_NAME" DataValueField="DEPARTMENT_ID" SelectedValue='<%# Bind("DEPARTMENT_ID") %>' CssClass="form-control">
            </asp:DropDownList>
            <br />
            ROLE_ID:
            <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource3" DataTextField="ROLE" DataValueField="ROLE_ID" SelectedValue='<%# Bind("ROLE_ID") %>' CssClass="form-control">
            </asp:DropDownList>
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" CssClass="btn btn-primary"/>
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="btn btn-danger"/>
        </InsertItemTemplate>
        <ItemTemplate>
            <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="Add Employee" CssClass="btn btn-primary"/>
        </ItemTemplate>
    </asp:FormView>
    <br />

</asp:Content>
