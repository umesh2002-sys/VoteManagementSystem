<%@ Page Title="Voting Records" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Voting_Records.aspx.cs" Inherits="voteManagementSystem.Voting_Records" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %>.</h2>
    <br />

    

    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="EMPLOYEE_NAME" DataValueField="EMPLOYEE_ID">
    </asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;EMPLOYEE_ID&quot;, &quot;EMPLOYEE_NAME&quot; FROM &quot;EMPLOYEE&quot;"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT employee.Employee_ID as &quot;VoterID&quot;, employee.Employee_Name as &quot;Voter_Name&quot;, jh.voting_month, jh.voting_year, c.Employee_ID as &quot;CandidateID&quot;, c.Employee_Name as &quot;Candidate_Name&quot;, c.department_id as &quot;CandidateDepartment&quot;
FROM employee
JOIN voting_records jh ON (employee.Employee_ID = jh.voter_id)
JOIN employee c ON (c.Employee_ID = jh.candidate_id) where Employee.Employee_ID  = :employee">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList1" Name="employee" PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="VoterID" DataSourceID="SqlDataSource2" ForeColor="#333333" GridLines="None" Height="201px" Width="1102px">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="VoterID" HeaderText="VoterID" ReadOnly="True" SortExpression="VoterID" />
            <asp:BoundField DataField="Voter_Name" HeaderText="Voter_Name" SortExpression="Voter_Name" />
            <asp:BoundField DataField="VOTING_MONTH" HeaderText="VOTING_MONTH" SortExpression="VOTING_MONTH" />
            <asp:BoundField DataField="VOTING_YEAR" HeaderText="VOTING_YEAR" SortExpression="VOTING_YEAR" />
            <asp:BoundField DataField="CandidateID" HeaderText="CandidateID" SortExpression="CandidateID" />
            <asp:BoundField DataField="Candidate_Name" HeaderText="Candidate_Name" SortExpression="Candidate_Name" />
            <asp:BoundField DataField="CandidateDepartment" HeaderText="CandidateDepartment" SortExpression="CandidateDepartment" />
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

    

</asp:Content>