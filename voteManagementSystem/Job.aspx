<%@ Page Title="Job" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Job.aspx.cs" Inherits="voteManagementSystem.Job" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %>.</h2>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="JOB_ID" DataSourceID="SqlDataSource1" CellPadding="4" ForeColor="#333333" GridLines="None" Width="1215px" Height="183px">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="JOB_ID" HeaderText="JOB_ID" ReadOnly="True" SortExpression="JOB_ID" />
            <asp:BoundField DataField="JOB" HeaderText="JOB" SortExpression="JOB" />
            <asp:BoundField DataField="MINIMUM_SALARY" HeaderText="MINIMUM_SALARY" SortExpression="MINIMUM_SALARY" />
            <asp:BoundField DataField="MAXIMUM_SALARY" HeaderText="MAXIMUM_SALARY" SortExpression="MAXIMUM_SALARY" />
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
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
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;JOBS&quot; WHERE &quot;JOB_ID&quot; = :JOB_ID" InsertCommand="INSERT INTO &quot;JOBS&quot; (&quot;JOB_ID&quot;, &quot;JOB&quot;, &quot;MINIMUM_SALARY&quot;, &quot;MAXIMUM_SALARY&quot;) VALUES (:JOB_ID, :JOB, :MINIMUM_SALARY, :MAXIMUM_SALARY)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;JOB_ID&quot;, &quot;JOB&quot;, &quot;MINIMUM_SALARY&quot;, &quot;MAXIMUM_SALARY&quot; FROM &quot;JOBS&quot;" UpdateCommand="UPDATE &quot;JOBS&quot; SET &quot;JOB&quot; = :JOB, &quot;MINIMUM_SALARY&quot; = :MINIMUM_SALARY, &quot;MAXIMUM_SALARY&quot; = :MAXIMUM_SALARY WHERE &quot;JOB_ID&quot; = :JOB_ID">
    <DeleteParameters>
        <asp:Parameter Name="JOB_ID" Type="String" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="JOB_ID" Type="String" />
        <asp:Parameter Name="JOB" Type="String" />
        <asp:Parameter Name="MINIMUM_SALARY" Type="Decimal" />
        <asp:Parameter Name="MAXIMUM_SALARY" Type="Decimal" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="JOB" Type="String" />
        <asp:Parameter Name="MINIMUM_SALARY" Type="Decimal" />
        <asp:Parameter Name="MAXIMUM_SALARY" Type="Decimal" />
        <asp:Parameter Name="JOB_ID" Type="String" />
    </UpdateParameters>
</asp:SqlDataSource>
<asp:FormView ID="FormView1" runat="server" DataKeyNames="JOB_ID" DataSourceID="SqlDataSource1">
    <EditItemTemplate>
        JOB_ID:
        <asp:Label ID="JOB_IDLabel1" runat="server" Text='<%# Eval("JOB_ID") %>' />
        <br />
        JOB:
        <asp:TextBox ID="JOBTextBox" runat="server" Text='<%# Bind("JOB") %>' />
        <br />
        MINIMUM_SALARY:
        <asp:TextBox ID="MINIMUM_SALARYTextBox" runat="server" Text='<%# Bind("MINIMUM_SALARY") %>' />
        <br />
        MAXIMUM_SALARY:
        <asp:TextBox ID="MAXIMUM_SALARYTextBox" runat="server" Text='<%# Bind("MAXIMUM_SALARY") %>' />
        <br />
        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
        &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
    </EditItemTemplate>
    <InsertItemTemplate>
        <h2>Add Job</h2>
        JOB_ID:
        <asp:TextBox ID="JOB_IDTextBox" runat="server" Text='<%# Bind("JOB_ID") %>' CssClass="form-control"/>
        <br />
        JOB:
        <asp:TextBox ID="JOBTextBox" runat="server" Text='<%# Bind("JOB") %>' CssClass="form-control"/>
        <br />
        MINIMUM_SALARY:
        <asp:TextBox ID="MINIMUM_SALARYTextBox" runat="server" Text='<%# Bind("MINIMUM_SALARY") %>' CssClass="form-control"/>
        <br />
        MAXIMUM_SALARY:
        <asp:TextBox ID="MAXIMUM_SALARYTextBox" runat="server" Text='<%# Bind("MAXIMUM_SALARY") %>' CssClass="form-control"/>
        <br />
        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" CssClass="btn btn-primary"/>
        &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="btn btn-danger"/>
    </InsertItemTemplate>
    <ItemTemplate>
        <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="Add Jobs" CssClass="btn btn-primary"/>
    </ItemTemplate>
</asp:FormView>
    <br />

</asp:Content>
