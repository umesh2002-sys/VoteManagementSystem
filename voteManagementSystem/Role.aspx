<%@ Page Title="Role" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Role.aspx.cs" Inherits="voteManagementSystem.Role" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %>.</h2>
    <br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ROLE_ID" DataSourceID="SqlDataSource1" CellPadding="4" ForeColor="#333333" GridLines="None" Height="180px" Width="1216px">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="ROLE_ID" HeaderText="ROLE_ID" ReadOnly="True" SortExpression="ROLE_ID" />
            <asp:BoundField DataField="ROLE" HeaderText="ROLE" SortExpression="ROLE" />
            <asp:BoundField DataField="JOB_ID" HeaderText="JOB_ID" SortExpression="JOB_ID" />
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
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;ROLE&quot; WHERE &quot;ROLE_ID&quot; = :ROLE_ID" InsertCommand="INSERT INTO &quot;ROLE&quot; (&quot;ROLE_ID&quot;, &quot;ROLE&quot;, &quot;JOB_ID&quot;) VALUES (:ROLE_ID, :ROLE, :JOB_ID)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;ROLE_ID&quot;, &quot;ROLE&quot;, &quot;JOB_ID&quot; FROM &quot;ROLE&quot;" UpdateCommand="UPDATE &quot;ROLE&quot; SET &quot;ROLE&quot; = :ROLE, &quot;JOB_ID&quot; = :JOB_ID WHERE &quot;ROLE_ID&quot; = :ROLE_ID">
        <DeleteParameters>
            <asp:Parameter Name="ROLE_ID" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="ROLE_ID" Type="String" />
            <asp:Parameter Name="ROLE" Type="String" />
            <asp:Parameter Name="JOB_ID" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="ROLE" Type="String" />
            <asp:Parameter Name="JOB_ID" Type="String" />
            <asp:Parameter Name="ROLE_ID" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;JOB_ID&quot;, &quot;JOB&quot; FROM &quot;JOBS&quot;"></asp:SqlDataSource>
    <asp:FormView ID="FormView1" runat="server" DataKeyNames="ROLE_ID" DataSourceID="SqlDataSource1">
        <EditItemTemplate>
            ROLE_ID:
            <asp:Label ID="ROLE_IDLabel1" runat="server" Text='<%# Eval("ROLE_ID") %>' />
            <br />
            ROLE:
            <asp:TextBox ID="ROLETextBox" runat="server" Text='<%# Bind("ROLE") %>' />
            <br />
            JOB_ID:
            <asp:TextBox ID="JOB_IDTextBox" runat="server" Text='<%# Bind("JOB_ID") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>
        <InsertItemTemplate>
            <h2>Add Role</h2>
            ROLE_ID:
            <asp:TextBox ID="ROLE_IDTextBox" runat="server" Text='<%# Bind("ROLE_ID") %>' CssClass="form-control"/>
            <br />
            ROLE:
            <asp:TextBox ID="ROLETextBox" runat="server" Text='<%# Bind("ROLE") %>' CssClass="form-control"/>
            <br />
            JOB_ID:
            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="JOB" DataValueField="JOB_ID" SelectedValue='<%# Bind("JOB_ID") %>' CssClass="form-control">
            </asp:DropDownList>
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" CssClass="btn btn-primary"/>
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="btn btn-danger"/>
        </InsertItemTemplate>
        <ItemTemplate>
            <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="Add Role" CssClass="btn btn-primary"/>
        </ItemTemplate>
    </asp:FormView>
</asp:Content>
