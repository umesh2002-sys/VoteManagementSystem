<%@ Page Title="Employee of the Month" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Employee_Of_The_Month.aspx.cs" Inherits="voteManagementSystem.Employee_Of_The_Month" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %>.</h2>
    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="VOTING_MONTH" DataValueField="VOTING_MONTH" Height="54px" Width="133px">
    </asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT DISTINCT &quot;VOTING_MONTH&quot; FROM &quot;VOTING_RECORDS&quot;"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT *
FROM (
    SELECT 
        e.employee_id AS &quot;Candidate ID&quot;,
        e.employee_name AS &quot;Candidate Name&quot;,
        COUNT(*) AS &quot;Total Votes&quot;
    FROM 
        employee e
    JOIN 
        voting_records vr ON (e.employee_id = vr.candidate_id)
    WHERE 
         vr.voting_month =:data
    GROUP BY 
        e.employee_id, e.employee_name
    ORDER BY 
        COUNT(*) DESC
)
WHERE ROWNUM &lt;= 3">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList1" Name="data" PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:GridView ID="GridView1" runat="server" CellPadding="4" DataSourceID="SqlDataSource2" ForeColor="#333333" GridLines="None" Height="203px" Width="1192px">
        <AlternatingRowStyle BackColor="White" />
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
    <br />


</asp:Content>