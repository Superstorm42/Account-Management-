<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoanRefund.aspx.cs" Inherits="SDPFinal.LoanRefund" %>

<%@ Register assembly="DevExpress.Web.v15.2, Version=15.2.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head <asp:PlaceHolder runat="server">
    <title></title>
        
        <link type="text/css" rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
        <script type="text/javascript" src="http://code.jquery.com/jquery-1.8.2.js"></script>
        <script type="text/javascript" src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
    <link rel="stylesheet" href="/resources/demos/style.css">
    <script>
        $(function () {
            $("#datepicker").datepicker();
        });
  </script>
        <script type="text/javascript">
            $(function () {
                $('#<%=btnclick.ClientID%>').click(function () {
                    $("#popupdiv").dialog({
                        title: "New Loan Refund",
                        width: 430,
                        height: 500,
                        modal: true,
                        buttons: {
                            Close: function () {
                                $(this).dialog('close');
                            }
                        }
                    });
                    return false;
                });
            })

        </script>

        <script type="text/javascript">
            $(function () {

                $('#submit').click(function () {
                    var lid = $('#lid').val();
                    var dat = $('#datepicker').val();
                    
                    var amnt = $('#amount_ex').val();
                    var dcc = $('#doccode').val();

                    var rmk = $('#remarks').val();
                    var chkPassport = document.getElementById("veri");
                    var ck;
                    var str = $('#TextBox3').val();
                    if (chkPassport.checked) {
                        
                        ck = 1;
                    } else {
                        
                        ck = 0;
                    }

                    

                    if (lid != '') {
                        $.ajax

                            ({

                                type: 'POST',
                                url: 'LoanRefund.aspx/insertdata',
                                async: false,
                                data: "{'lid':'" + lid + "','dat':'" + dat + "','amnt':'" + amnt + "','dcc':'" + dcc + "','rmk':'" + rmk + "','ck':'" + ck + "','str':'" + str + "'}",
                                contentType: 'application/json; charset =utf-8',
                                success: function (data) {

                                    var obj = data.d;
                                    
                                    if (obj == 'OK') {

                                        alert("Data Saved Successfully");

                                    }
                                    else if(obj == 'notok')
                                    { alert("This Loan ID does not exist.");}
                                },

                                error: function (result) {
                                    alert("Error Occured, Try Again");
                                }
                            });
                    } else {
                        alert("Pleae Fill all the Fields");
                        return false;
                    }
                })
            });
        </script>
    </asp:PlaceHolder>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        
        <div id="popupdiv" title="New Loan Refund" style="display: none">
                <asp:Label ID="Label15" runat="server" Text="Welcome" Width="180px"></asp:Label>
                <asp:TextBox ID="TextBox3" runat="server" Width="180px" Enable="false"></asp:TextBox>
                
                <asp:Label ID="Label4" runat="server" Text="Loan ID" Width="180px"></asp:Label>
                <asp:TextBox ID="lid" runat="server" Width="180px"></asp:TextBox>
                
                
                <asp:Label ID="Label5" runat="server" Text="Date" Width="180px"></asp:Label>
                <asp:TextBox ID="datepicker" runat="server" Width="180px"></asp:TextBox>
                
                
                
                
                <asp:Label ID="Label7" runat="server" Text="Amount" Width="180px"></asp:Label>
                <asp:TextBox ID="amount_ex" runat="server" Width="180px"></asp:TextBox>
                
            
                <asp:Label ID="Label10" runat="server" Text="Doc Code" Width="180px"></asp:Label>
                <asp:TextBox ID="doccode" runat="server" Width="180px"></asp:TextBox>


                


                <asp:Label ID="Label13" runat="server" Text="Remarks" Width="180px"></asp:Label>
                <asp:TextBox ID="remarks" runat="server" Width="180px"></asp:TextBox>


                <asp:Label ID="Label14" runat="server" Text="Verified" Width="180px"></asp:Label>
                <asp:CheckBox ID="veri" runat="server" Width="180px" />



                <asp:Button ID="submit" runat="server" Text="Submit" Width="180px"/>


            </div>

        <br />
        <asp:Button ID="logout" runat="server" OnClick="logout_Click" Text="Log Out" />
        <asp:Button ID="userlist" runat="server" OnClick="userlist_Click" Text="User List" />
        <br />

        <br />
        <br />
            <asp:Label ID="Label3" runat="server" Text="Welcome "></asp:Label>
            <asp:Label ID="nam_label" runat="server" Text="Megazord"></asp:Label>
            <br />
        <br />
            <asp:Button ID="Expenses_btn" runat="server" Text="Expenses" OnClick="Expenses_btn_Click" />
            <asp:Button ID="Revenues_btn" runat="server" Text="Revenues" OnClick="Revenues_btn_Click" />
            <asp:Button ID="Loan_btn" runat="server" Text="Loan" OnClick="Loan_btn_Click" />
            <asp:Button ID="Loan_refund_btn" runat="server" Text="Loan Refund" OnClick="Loan_refund_btn_Click" />
            <br />
        <br />
        <br />
            <asp:Button ID="btnclick" runat="server" BackColor="#6699FF" Font-Italic="True" Font-Size="X-Large" Font-Underline="True" Text="New Refund"  />
            <br />
        <br />
        <br />
        <br />
            <asp:Label ID="Label2" runat="server" Font-Italic="True" Font-Overline="False" Font-Size="X-Large" Font-Underline="True" Text="Table of Refund"></asp:Label>
            <br />
        <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" KeyFieldName="Refund_ID" Theme="Office2003Blue">
            <Settings ShowFilterRow="True" ShowFilterBar="Visible" />
            <Columns>
                <dx:GridViewCommandColumn ShowClearFilterButton="True" ShowDeleteButton="True" ShowEditButton="True" VisibleIndex="0">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn FieldName="Refund_ID" ReadOnly="True" VisibleIndex="1">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Loan_ID" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Borrower_Name" VisibleIndex="3">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn FieldName="Date" VisibleIndex="4">
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataTextColumn FieldName="Amount" VisibleIndex="5">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Doc_Code" VisibleIndex="6">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Remarks" VisibleIndex="7">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Inserted_By" VisibleIndex="8">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataCheckColumn FieldName="Verified" VisibleIndex="9">
                </dx:GridViewDataCheckColumn>
                <dx:GridViewDataTextColumn FieldName="Verified_By" VisibleIndex="10">
                </dx:GridViewDataTextColumn>
            </Columns>
        </dx:ASPxGridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [LoanRefund] WHERE [Refund_ID] = @Refund_ID" InsertCommand="INSERT INTO [LoanRefund] ([Refund_ID], [Loan_ID], [Borrower_Name], [Date], [Amount], [Doc_Code], [Remarks], [Inserted_By], [Verified], [Verified_By]) VALUES (@Refund_ID, @Loan_ID, @Borrower_Name, @Date, @Amount, @Doc_Code, @Remarks, @Inserted_By, @Verified, @Verified_By)" SelectCommand="SELECT * FROM [LoanRefund]" UpdateCommand="UPDATE [LoanRefund] SET [Loan_ID] = @Loan_ID, [Borrower_Name] = @Borrower_Name, [Date] = @Date, [Amount] = @Amount, [Doc_Code] = @Doc_Code, [Remarks] = @Remarks, [Inserted_By] = @Inserted_By, [Verified] = @Verified, [Verified_By] = @Verified_By WHERE [Refund_ID] = @Refund_ID">
            <DeleteParameters>
                <asp:Parameter Name="Refund_ID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Refund_ID" Type="Int32" />
                <asp:Parameter Name="Loan_ID" Type="Int32" />
                <asp:Parameter Name="Borrower_Name" Type="String" />
                <asp:Parameter DbType="Date" Name="Date" />
                <asp:Parameter Name="Amount" Type="Int32" />
                <asp:Parameter Name="Doc_Code" Type="String" />
                <asp:Parameter Name="Remarks" Type="String" />
                <asp:Parameter Name="Inserted_By" Type="String" />
                <asp:Parameter Name="Verified" Type="Boolean" />
                <asp:Parameter Name="Verified_By" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Loan_ID" Type="Int32" />
                <asp:Parameter Name="Borrower_Name" Type="String" />
                <asp:Parameter DbType="Date" Name="Date" />
                <asp:Parameter Name="Amount" Type="Int32" />
                <asp:Parameter Name="Doc_Code" Type="String" />
                <asp:Parameter Name="Remarks" Type="String" />
                <asp:Parameter Name="Inserted_By" Type="String" />
                <asp:Parameter Name="Verified" Type="Boolean" />
                <asp:Parameter Name="Verified_By" Type="String" />
                <asp:Parameter Name="Refund_ID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    
    </div>
    </form>
</body>
</html>
