<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Loan.aspx.cs" Inherits="SDPFinal.Loan" %>

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
                        title: "New Loan",
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
                    var head = $('#bnam').val();
                    var dat = $('#datepicker').val();
                    var typ = $('#typ').val();
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

                    

                    if (head!='') {
                        $.ajax

                            ({

                                type: 'POST',
                                url: 'Loan.aspx/insertdata',
                                async: false,
                                data: "{'head':'" + head + "','typ':'" + typ + "','dat':'" + dat + "','amnt':'" + amnt + "','dcc':'" + dcc + "','rmk':'" + rmk + "','ck':'" + ck + "','str':'" + str + "'}",
                                contentType: 'application/json; charset =utf-8',
                                success: function (data) {
                                    
                                    var obj = data.d;
                                    
                                    if (obj == 'OK') {

                                        alert("Data Saved Successfully");
                                        
                                    }
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
        <div id="popupdiv" title="New Loan" style="display: none">
                <asp:Label ID="Label15" runat="server" Text="Welcome" Width="180px"></asp:Label>
                <asp:TextBox ID="TextBox3" runat="server" Width="180px" Enable="false"></asp:TextBox>
                
                
                <asp:Label ID="Label4" runat="server" Text="Borrower Name" Width="180px"></asp:Label>
                <asp:TextBox ID="bnam" runat="server" Width="180px"></asp:TextBox>
                
                
                <asp:Label ID="Label5" runat="server" Text="Date" Width="180px"></asp:Label>
                <asp:TextBox ID="datepicker" runat="server" Width="180px"></asp:TextBox>
                
                
                
                
                <asp:Label ID="Label7" runat="server" Text="Amount" Width="180px"></asp:Label>
                <asp:TextBox ID="amount_ex" runat="server" Width="180px"></asp:TextBox>
                
                
                <asp:Label ID="Label8" runat="server" Text="Type" Width="180px"></asp:Label>
                <asp:DropDownList ID="typ" runat="server" Width="180px" > 
                    <asp:ListItem>Teachers</asp:ListItem>
                    <asp:ListItem>Staff</asp:ListItem>
                    <asp:ListItem>Outsiders</asp:ListItem>
                </asp:DropDownList>


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
            <asp:Button ID="btnclick" runat="server" BackColor="Gray" Font-Italic="True" Font-Size="X-Large" Font-Underline="True" Text="New Loan"  />
            <br />
        <br />
        <br />
        <br />
            <asp:Label ID="Label2" runat="server" Font-Italic="True" Font-Overline="False" Font-Size="X-Large" Font-Underline="True" Text="Table of Loan"></asp:Label>
            <br />
        <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" KeyFieldName="Loan ID">
            <Settings ShowFilterRow="True" ShowFilterBar="Visible" />
            <Columns>
                <dx:GridViewCommandColumn ShowDeleteButton="True" ShowEditButton="True" VisibleIndex="0" ShowClearFilterButton="True">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn FieldName="Loan ID" ReadOnly="True" VisibleIndex="1">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Borrower_Name" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn FieldName="Date" VisibleIndex="3">
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataTextColumn FieldName="Loan_Amount" VisibleIndex="4">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Refund_Amount" VisibleIndex="5" ReadOnly="True">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Due_Amount" VisibleIndex="6" ReadOnly="True">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Doc_Code" VisibleIndex="8">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Remarks" VisibleIndex="9">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Inserted_By" VisibleIndex="10" ReadOnly="True">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataCheckColumn FieldName="Verified" VisibleIndex="11">
                </dx:GridViewDataCheckColumn>
                <dx:GridViewDataTextColumn FieldName="Verified_By" VisibleIndex="12" ReadOnly="True">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn FieldName="Borrower_Type" VisibleIndex="7">
                    <PropertiesComboBox>
                        <Items>
                            <dx:ListEditItem Text="Teachers" Value="Teachers" />
                            <dx:ListEditItem Text="Staff" Value="Staff" />
                            <dx:ListEditItem Text="Outsiders" Value="Outsiders" />
                        </Items>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
            </Columns>
        </dx:ASPxGridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Loan] WHERE [Loan ID] = @Loan_ID" InsertCommand="INSERT INTO [Loan] ([Borrower_Name], [Date], [Loan_Amount], [Refund_Amount], [Due_Amount], [Borrower_Type], [Doc_Code], [Remarks], [Inserted_By], [Verified], [Verified_By]) VALUES (@Borrower_Name, @Date, @Loan_Amount, @Refund_Amount, @Due_Amount, @Borrower_Type, @Doc_Code, @Remarks, @Inserted_By, @Verified, @Verified_By)" SelectCommand="SELECT * FROM [Loan]" UpdateCommand="UPDATE [Loan] SET [Borrower_Name] = @Borrower_Name, [Date] = @Date, [Loan_Amount] = @Loan_Amount, [Refund_Amount] = @Refund_Amount, [Due_Amount] = @Due_Amount, [Borrower_Type] = @Borrower_Type, [Doc_Code] = @Doc_Code, [Remarks] = @Remarks, [Inserted_By] = @Inserted_By, [Verified] = @Verified, [Verified_By] = @Verified_By WHERE [Loan ID] = @Loan_ID">
            <DeleteParameters>
                <asp:Parameter Name="Loan_ID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Borrower_Name" Type="String" />
                <asp:Parameter DbType="Date" Name="Date" />
                <asp:Parameter Name="Loan_Amount" Type="Int32" />
                <asp:Parameter Name="Refund_Amount" Type="Int32" />
                <asp:Parameter Name="Due_Amount" Type="Int32" />
                <asp:Parameter Name="Borrower_Type" Type="String" />
                <asp:Parameter Name="Doc_Code" Type="String" />
                <asp:Parameter Name="Remarks" Type="String" />
                <asp:Parameter Name="Inserted_By" Type="String" />
                <asp:Parameter Name="Verified" Type="Boolean" />
                <asp:Parameter Name="Verified_By" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Borrower_Name" Type="String" />
                <asp:Parameter DbType="Date" Name="Date" />
                <asp:Parameter Name="Loan_Amount" Type="Int32" />
                <asp:Parameter Name="Refund_Amount" Type="Int32" />
                <asp:Parameter Name="Due_Amount" Type="Int32" />
                <asp:Parameter Name="Borrower_Type" Type="String" />
                <asp:Parameter Name="Doc_Code" Type="String" />
                <asp:Parameter Name="Remarks" Type="String" />
                <asp:Parameter Name="Inserted_By" Type="String" />
                <asp:Parameter Name="Verified" Type="Boolean" />
                <asp:Parameter Name="Verified_By" Type="String" />
                <asp:Parameter Name="Loan_ID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    
    </div>
    </form>
</body>
</html>
