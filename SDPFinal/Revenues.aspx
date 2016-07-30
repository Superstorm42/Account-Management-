<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Revenues.aspx.cs" Inherits="SDPFinal.Revenues" %>

<%@ Register assembly="DevExpress.Web.ASPxTreeList.v15.2, Version=15.2.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxTreeList" tagprefix="dx" %>
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
                        title: "New Revenue",
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
                    var head = $('#head').val();
                    var dat = $('#datepicker').val();
                    var typ = $('#typ').val();
                    var amnt = $('#amount_ex').val();
                    var jnm = $('#jobname').val();
                    var dcc = $('#doccode').val();
                    var pyr = $('#payer').val();
                    var pye = $('#payee').val();
                    var rmk = $('#remarks').val();
                    var chkPassport = document.getElementById("veri");
                    var ck;
                    var str = $('#TextBox3').val();
                    if (chkPassport.checked) {
                        
                        ck = 1;
                    } else {
                        
                        ck = 0;
                    }

                    


                    if (head != '' && typ != '') {
                        $.ajax

                            ({

                                type: 'POST',
                                url: 'Revenues.aspx/insertdata',
                                async: false,
                                data: "{'head':'" + head + "','typ':'" + typ + "','dat':'" + dat + "','amnt':'" + amnt + "','jnm':'" + jnm + "','dcc':'" + dcc + "','pyr':'" + pyr + "','pye':'" + pye + "','rmk':'" + rmk + "','ck':'" + ck + "','str':'" + str + "'}",
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
        <div id="popupdiv" title="New Revenue" style="display: none">
                <asp:Label ID="Label15" runat="server" Text="Welcome" Width="180px"></asp:Label>
                <asp:TextBox ID="TextBox3" runat="server" Width="180px" Enable="false"></asp:TextBox>
                
                
                <asp:Label ID="Label4" runat="server" Text="Head" Width="180px"></asp:Label>
                <asp:DropDownList ID="head" runat="server" Width="180px" DataSourceID="SqlDataSource1" DataTextField="Name" DataValueField="Name">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [Name] FROM [Etree]"></asp:SqlDataSource>
                
                
                <asp:Label ID="Label5" runat="server" Text="Date" Width="180px"></asp:Label>
                <asp:TextBox ID="datepicker" runat="server" Width="180px"></asp:TextBox>
                
                
                
                
                <asp:Label ID="Label7" runat="server" Text="Amount" Width="180px"></asp:Label>
                <asp:TextBox ID="amount_ex" runat="server" Width="180px"></asp:TextBox>
                
                
                <asp:Label ID="Label8" runat="server" Text="Type" Width="180px"></asp:Label>
                <asp:DropDownList ID="typ" runat="server" Width="180px" > 
                    <asp:ListItem>Cash</asp:ListItem>
                    <asp:ListItem>Cheque</asp:ListItem>
                    <asp:ListItem>Cash_Cheque</asp:ListItem>
                </asp:DropDownList>


                <asp:Label ID="Label9" runat="server" Text="Job Name" Width="180px"></asp:Label>
                <asp:TextBox ID="jobname" runat="server" Width="180px"></asp:TextBox>


                <asp:Label ID="Label10" runat="server" Text="Doc Code" Width="180px"></asp:Label>
                <asp:TextBox ID="doccode" runat="server" Width="180px"></asp:TextBox>


                <asp:Label ID="Label11" runat="server" Text="Payer" Width="180px"></asp:Label>
                <asp:TextBox ID="payer" runat="server" Width="180px"></asp:TextBox>


                <asp:Label ID="Label12" runat="server" Text="Payee" Width="180px"></asp:Label>
                <asp:TextBox ID="payee" runat="server" Width="180px"></asp:TextBox>


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
        <asp:Label ID="Label1" runat="server" Text="Welcome "></asp:Label>
        <asp:Label ID="nam_label" runat="server" Text="Mike"></asp:Label>
        <br />
        <br />
            <asp:Button ID="Expenses_btn" runat="server" Text="Expenses" OnClick="Expenses_btn_Click" />
            <asp:Button ID="Revenues_btn" runat="server" Text="Revenues" OnClick="Revenues_btn_Click" />
            <asp:Button ID="Loan_btn" runat="server" Text="Loan" OnClick="Loan_btn_Click" />
            <asp:Button ID="Loan_refund_btn" runat="server" Text="Loan Refund" OnClick="Loan_refund_btn_Click" />
            <br />
        <br />
        <br />
        <br />
            <asp:Label ID="Label2" runat="server" Font-Italic="True" Font-Size="X-Large" Font-Strikeout="False" Font-Underline="True" ForeColor="Black" Text="Revenue Tree"></asp:Label>
            <dx:ASPxTreeList ID="ASPxTreeList2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" KeyFieldName="Id" ParentFieldName="Parentid" Theme="Youthful" EnableTheming="True">
                <Columns>
                    <dx:TreeListTextColumn FieldName="Name" VisibleIndex="0">
                    </dx:TreeListTextColumn>
                    <dx:TreeListCommandColumn VisibleIndex="1">
                        <editbutton visible="True">
                        </editbutton>
                        <newbutton visible="True">
                        </newbutton>
                        <deletebutton visible="True">
                        </deletebutton>
                    </dx:TreeListCommandColumn>
                </Columns>
        </dx:ASPxTreeList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Rtree] WHERE [Id] = @Id" InsertCommand="INSERT INTO [Rtree] ([Name], [Parentid]) VALUES (@Name, @Parentid)" SelectCommand="SELECT * FROM [Rtree]" UpdateCommand="UPDATE [Rtree] SET [Name] = @Name, [Parentid] = @Parentid WHERE [Id] = @Id">
            <DeleteParameters>
                <asp:Parameter Name="Id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter Name="Parentid" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter Name="Parentid" Type="String" />
                <asp:Parameter Name="Id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <br />
        <br />
        <br />
            <asp:Button ID="btnclick" runat="server" BackColor="#66FF33" Font-Italic="True" Font-Size="X-Large" Font-Underline="True" Text="New Revenue"  />
            <br />
        <br />
        <br />
        <br />
            <asp:Label ID="Label3" runat="server" Font-Italic="True" Font-Overline="False" Font-Size="X-Large" Font-Underline="True" Text="Table of Revenues"></asp:Label>
            <br />
        <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" EnableTheming="True" KeyFieldName="ID" Theme="Youthful">
            <Settings ShowFilterRow="True" ShowFilterBar="Visible" />
            <Columns>
                <dx:GridViewCommandColumn ShowClearFilterButton="True" ShowDeleteButton="True" ShowEditButton="True" VisibleIndex="0">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn FieldName="ID" ReadOnly="True" VisibleIndex="1">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Head" VisibleIndex="2">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropDownList1" runat="server" SelectedValue='<%# Bind("head") %>' DataSourceID="SqlDataSource2" DataTextField="Name" DataValueField="Name">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [Name] FROM [Rtree]"></asp:SqlDataSource>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [Name] FROM [Rtree]"></asp:SqlDataSource>
                    </EditItemTemplate>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn FieldName="Date" VisibleIndex="3">
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataTextColumn FieldName="Amount" VisibleIndex="4">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Job_Name" VisibleIndex="6">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Doc_Code" VisibleIndex="7">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Payer" VisibleIndex="8">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Payee" VisibleIndex="9">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Remarks" VisibleIndex="10">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Inserted_By" VisibleIndex="11" ReadOnly="True">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataCheckColumn FieldName="Verified" VisibleIndex="12">
                </dx:GridViewDataCheckColumn>
                <dx:GridViewDataTextColumn FieldName="Verified_By" VisibleIndex="13" ReadOnly="True">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn FieldName="Type" VisibleIndex="5">
                    <PropertiesComboBox>
                        <Items>
                            <dx:ListEditItem Text="Cash" Value="Cash" />
                            <dx:ListEditItem Text="Cheque" Value="Cheque" />
                            <dx:ListEditItem Text="Cash_Cheque" Value="Cash_Cheque" />
                        </Items>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
            </Columns>
        </dx:ASPxGridView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Revenue] WHERE [ID] = @ID" InsertCommand="INSERT INTO [Revenue] ([Head], [Date], [Amount], [Type], [Job_Name], [Doc_Code], [Payer], [Payee], [Remarks], [Inserted_By], [Verified], [Verified_By]) VALUES (@Head, @Date, @Amount, @Type, @Job_Name, @Doc_Code, @Payer, @Payee, @Remarks, @Inserted_By, @Verified, @Verified_By)" SelectCommand="SELECT * FROM [Revenue]" UpdateCommand="UPDATE [Revenue] SET [Head] = @Head, [Date] = @Date, [Amount] = @Amount, [Type] = @Type, [Job_Name] = @Job_Name, [Doc_Code] = @Doc_Code, [Payer] = @Payer, [Payee] = @Payee, [Remarks] = @Remarks, [Inserted_By] = @Inserted_By, [Verified] = @Verified, [Verified_By] = @Verified_By WHERE [ID] = @ID">
            <DeleteParameters>
                <asp:Parameter Name="ID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Head" Type="String" />
                <asp:Parameter DbType="Date" Name="Date" />
                <asp:Parameter Name="Amount" Type="Int32" />
                <asp:Parameter Name="Type" Type="String" />
                <asp:Parameter Name="Job_Name" Type="String" />
                <asp:Parameter Name="Doc_Code" Type="String" />
                <asp:Parameter Name="Payer" Type="String" />
                <asp:Parameter Name="Payee" Type="String" />
                <asp:Parameter Name="Remarks" Type="String" />
                <asp:Parameter Name="Inserted_By" Type="String" />
                <asp:Parameter Name="Verified" Type="Boolean" />
                <asp:Parameter Name="Verified_By" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Head" Type="String" />
                <asp:Parameter DbType="Date" Name="Date" />
                <asp:Parameter Name="Amount" Type="Int32" />
                <asp:Parameter Name="Type" Type="String" />
                <asp:Parameter Name="Job_Name" Type="String" />
                <asp:Parameter Name="Doc_Code" Type="String" />
                <asp:Parameter Name="Payer" Type="String" />
                <asp:Parameter Name="Payee" Type="String" />
                <asp:Parameter Name="Remarks" Type="String" />
                <asp:Parameter Name="Inserted_By" Type="String" />
                <asp:Parameter Name="Verified" Type="Boolean" />
                <asp:Parameter Name="Verified_By" Type="String" />
                <asp:Parameter Name="ID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
            <br />
    
    </div>
    </form>
</body>
</html>
