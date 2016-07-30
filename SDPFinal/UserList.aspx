<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserList.aspx.cs" Inherits="SDPFinal.UserList" %>

<%@ Register assembly="DevExpress.Web.v15.2, Version=15.2.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <br />
        <asp:Button ID="logout" runat="server" OnClick="logout_Click" Text="Log Out" />
        <br />
        <br />
        <br />
        <asp:Label ID="Label1" runat="server" Text="Welcome "></asp:Label>
        <asp:Label ID="nam_label" runat="server" Text="Mike"></asp:Label>
        <br />
        <br />
            <asp:Button ID="Expenses_btn" runat="server" Text="Expenses" OnClick="Expenses_btn_Click" style="height: 26px" />
            <asp:Button ID="Revenues_btn" runat="server" Text="Revenues" OnClick="Revenues_btn_Click" />
            <asp:Button ID="Loan_btn" runat="server" Text="Loan" OnClick="Loan_btn_Click" />
            <asp:Button ID="Loan_refund_btn" runat="server" Text="Loan Refund" OnClick="Loan_refund_btn_Click" />
            <br />
        <br />
        <br />
            <asp:Label ID="Label3" runat="server" Font-Italic="True" Font-Overline="False" Font-Size="X-Large" Font-Underline="True" Text="Table of Revenues"></asp:Label>
            <br />
        <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" KeyFieldName="Id">
            <Settings ShowFilterBar="Visible" />
            <Columns>
                <dx:GridViewCommandColumn ShowDeleteButton="True" ShowEditButton="True" VisibleIndex="0">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn FieldName="User_Name" ReadOnly="True" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Full_Name" ReadOnly="True" VisibleIndex="3">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Type" ReadOnly="True" VisibleIndex="4">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn FieldName="Date" ReadOnly="True" VisibleIndex="5">
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataCheckColumn FieldName="Authenticated" VisibleIndex="6">
                </dx:GridViewDataCheckColumn>
                <dx:GridViewDataTextColumn FieldName="Id" ReadOnly="True" VisibleIndex="1">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
            </Columns>
        </dx:ASPxGridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [LogIn] WHERE [Id] = @Id" InsertCommand="INSERT INTO [LogIn] ([User_Name], [Full_Name], [Type], [Date], [Authenticated]) VALUES (@User_Name, @Full_Name, @Type, @Date, @Authenticated)" SelectCommand="SELECT [User_Name], [Full_Name], [Type], [Date], [Authenticated], [Id] FROM [LogIn]" UpdateCommand="UPDATE [LogIn] SET [User_Name] = @User_Name, [Full_Name] = @Full_Name, [Type] = @Type, [Date] = @Date, [Authenticated] = @Authenticated WHERE [Id] = @Id">
            <DeleteParameters>
                <asp:Parameter Name="Id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="User_Name" Type="String" />
                <asp:Parameter Name="Full_Name" Type="String" />
                <asp:Parameter Name="Type" Type="String" />
                <asp:Parameter DbType="Date" Name="Date" />
                <asp:Parameter Name="Authenticated" Type="Boolean" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="User_Name" Type="String" />
                <asp:Parameter Name="Full_Name" Type="String" />
                <asp:Parameter Name="Type" Type="String" />
                <asp:Parameter DbType="Date" Name="Date" />
                <asp:Parameter Name="Authenticated" Type="Boolean" />
                <asp:Parameter Name="Id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    
    </div>
    </form>
</body>
</html>
