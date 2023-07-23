<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="voteManagementSystem._Default" %>
<%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <asp:Panel ID="Panel1" runat="server" Height="545px" Width="1126px">
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;JOB&quot;, &quot;MINIMUM_SALARY&quot; FROM &quot;JOBS&quot;"></asp:SqlDataSource>
        <br />
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;JOB&quot;, &quot;MAXIMUM_SALARY&quot; FROM &quot;JOBS&quot;"></asp:SqlDataSource>
        Minimum Salary<asp:Chart ID="Chart1" runat="server" DataSourceID="SqlDataSource1" Width="999px" Height="198px">
            <series>
                <asp:Series Name="Series1" XValueMember="JOB" YValueMembers="MINIMUM_SALARY">
                </asp:Series>
            </series>
            <chartareas>
                <asp:ChartArea Name="ChartArea1">
                </asp:ChartArea>
            </chartareas>
        </asp:Chart>
        <br />
        Maximum Salary<asp:Chart ID="Chart2" runat="server" DataSourceID="SqlDataSource2" Width="997px" Height="186px">
            <series>
                <asp:Series Name="Series1" XValueMember="JOB" YValueMembers="MAXIMUM_SALARY">
                </asp:Series>
            </series>
            <chartareas>
                <asp:ChartArea Name="ChartArea1">
                </asp:ChartArea>
            </chartareas>
        </asp:Chart>

    </asp:Panel>
</asp:Content>

