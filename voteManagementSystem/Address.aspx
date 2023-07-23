<%@ Page Title="Address" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Address.aspx.cs" Inherits="voteManagementSystem.Address" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %>.</h2>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="ADDRESS_ID" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" Height="209px" Width="1237px">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="ADDRESS_ID" HeaderText="ADDRESS_ID" ReadOnly="True" SortExpression="ADDRESS_ID" />
            <asp:BoundField DataField="STREET_NAME" HeaderText="STREET_NAME" SortExpression="STREET_NAME" />
            <asp:BoundField DataField="CITY" HeaderText="CITY" SortExpression="CITY" />
            <asp:BoundField DataField="COUNTRY" HeaderText="COUNTRY" SortExpression="COUNTRY" />
            <asp:BoundField DataField="POSTAL_CODE" HeaderText="POSTAL_CODE" SortExpression="POSTAL_CODE" />
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
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;ADDRESS&quot; WHERE &quot;ADDRESS_ID&quot; = :ADDRESS_ID" InsertCommand="INSERT INTO &quot;ADDRESS&quot; (&quot;ADDRESS_ID&quot;, &quot;STREET_NAME&quot;, &quot;CITY&quot;, &quot;COUNTRY&quot;, &quot;POSTAL_CODE&quot;) VALUES (:ADDRESS_ID, :STREET_NAME, :CITY, :COUNTRY, :POSTAL_CODE)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM &quot;ADDRESS&quot;" UpdateCommand="UPDATE &quot;ADDRESS&quot; SET &quot;STREET_NAME&quot; = :STREET_NAME, &quot;CITY&quot; = :CITY, &quot;COUNTRY&quot; = :COUNTRY, &quot;POSTAL_CODE&quot; = :POSTAL_CODE WHERE &quot;ADDRESS_ID&quot; = :ADDRESS_ID">
        <DeleteParameters>
            <asp:Parameter Name="ADDRESS_ID" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="ADDRESS_ID" Type="String" />
            <asp:Parameter Name="STREET_NAME" Type="String" />
            <asp:Parameter Name="CITY" Type="String" />
            <asp:Parameter Name="COUNTRY" Type="String" />
            <asp:Parameter Name="POSTAL_CODE" Type="Decimal" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="STREET_NAME" Type="String" />
            <asp:Parameter Name="CITY" Type="String" />
            <asp:Parameter Name="COUNTRY" Type="String" />
            <asp:Parameter Name="POSTAL_CODE" Type="Decimal" />
            <asp:Parameter Name="ADDRESS_ID" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:FormView ID="FormView1" runat="server" DataKeyNames="ADDRESS_ID" DataSourceID="SqlDataSource1">
        <EditItemTemplate>
            ADDRESS_ID:
            <asp:Label ID="ADDRESS_IDLabel1" runat="server" Text='<%# Eval("ADDRESS_ID") %>' />
            <br />
            STREET_NAME:
            <asp:TextBox ID="STREET_NAMETextBox" runat="server" Text='<%# Bind("STREET_NAME") %>' />
            <br />
            CITY:
            <asp:TextBox ID="CITYTextBox" runat="server" Text='<%# Bind("CITY") %>' />
            <br />
            COUNTRY:
            <asp:TextBox ID="COUNTRYTextBox" runat="server" Text='<%# Bind("COUNTRY") %>' />
            <br />
            POSTAL_CODE:
            <asp:TextBox ID="POSTAL_CODETextBox" runat="server" Text='<%# Bind("POSTAL_CODE") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>
        <InsertItemTemplate>
            <h2>Add Address</h2>
            ADDRESS_ID:
            <asp:TextBox ID="ADDRESS_IDTextBox" runat="server" Text='<%# Bind("ADDRESS_ID") %>' CssClass="form-control"/>
            <br />
            STREET_NAME:
            <asp:TextBox ID="STREET_NAMETextBox" runat="server" Text='<%# Bind("STREET_NAME") %>' CssClass="form-control"/>
            <br />
            CITY:
            <asp:TextBox ID="CITYTextBox" runat="server" Text='<%# Bind("CITY") %>' CssClass="form-control"/>
            <br />
            COUNTRY:
            <asp:TextBox ID="COUNTRYTextBox" runat="server" Text='<%# Bind("COUNTRY") %>' CssClass="form-control"/>
            <br />
            POSTAL_CODE:
            <asp:TextBox ID="POSTAL_CODETextBox" runat="server" Text='<%# Bind("POSTAL_CODE") %>' CssClass="form-control"/>
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" CssClass="btn btn-primary"/>
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="btn btn-danger"/>
        </InsertItemTemplate>
        <ItemTemplate>
            <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="Add Address" CssClass="btn btn-primary"/>
        </ItemTemplate>
    </asp:FormView>
    <br />


</asp:Content>
