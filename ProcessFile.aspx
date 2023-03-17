
<%@ Page Language="C#" MasterPageFile="~/UserMaster.master" AutoEventWireup="true" 
CodeFile="ProcessFile.aspx.cs" Inherits="ProcessFile" Title="ProcessFile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <script type="text/javascript">
$(document).ready(function(){
$( ".view" ).hide();
    $(function () {
        $(".addNew").dialog({
            autoOpen: false,
            width: 300,
            height: 300,
            modal: true,
            close: function (event, ui) {
                location.reload(false);
            },
            buttons:
            {
                "View Download Link": function () {
                     var Password = $("#<%= txtPassword.ClientID  %>").val();
                     var HiddenField1 = $("#<%= HiddenField1.ClientID  %>").val();
                       $( ".view" ).hide();
                       
                     //$.fileDownload('images/Desert.jpg');
                    $.ajax({
                        type: 'POST',
                        url: 'MyWebPage.aspx/AddNewItem',
                        data: '{"Password":"' + Password + '","HiddenField1":"' + HiddenField1 + '"}',
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (msg) {
                            if (msg.d) {
                            alert('1');
                               // $.fileDownload('images/Desert.jpg');
                                $( ".view" ).show();
                                 $(".view").attr('href', HiddenField1);
                                alert("Successfully Processed!!");                                    
                            }
                        },
                        error: function () {
                            $( ".view" ).hide();
                            alert("OTP Error! Try again...");
                        }
                    });
                    //add functionality
                    //make ajax post
                }
                ,
                "Exit": function () {
                      $(".addNew").dialog("destroy");    
                }
            }
        });

        $(".add").click(function (event) {
            
            event.preventDefault();
            $(".addNew").dialog("open");                
            //alert(1);
        });
    });
    });
 
</script>
    <div>
        <table width="100%">
            
            <tr>
                <td >
                    <asp:Label ID="lblImage" runat="server" Text="Search"></asp:Label></td>
                <td >
                    <asp:TextBox ID="txtImage" runat="server" Width="300px"></asp:TextBox>
                    </td>
                <td width="300px" >
                    </td>
            </tr>
            <tr>
                <td align="center" >
                    
                    </td>
                <td  ><asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" />
                &nbsp;<asp:Button ID="Button1" runat="server" Text="Show My Friends List" Visible="false"
                        onclick="Button1_Click" />
                </td>
                <td >
                </td>
            </tr>
            <tr>
                <td colspan="2" valign="top">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                        onrowdatabound="GridView1_RowDataBound">
                        <Columns>
                            <asp:BoundField DataField="Categories" HeaderText="File Name" />
                            <asp:BoundField DataField="Description" HeaderText="Description" />
                            <asp:TemplateField>
                                <ItemTemplate>
                                   <%-- <asp:HyperLink ID="HyperLink2" NavigateUrl='<%# Eval("ImagePath") %>'  runat="server">Download</asp:HyperLink>--%>
                                    <asp:LinkButton ID="LinkButton1" runat="server" 
                                        CommandArgument='<%# Eval("ImagePath") %>' OnCommand="LinkButton1_Command">Sent 
                                    OTP</asp:LinkButton>
                                        <a href="" class="add"> Download</a>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                    </td>
                <td valign="top">
            <asp:GridView ID="gvUser" Width="100%" runat="server" AutoGenerateColumns="False" 
                CellPadding="4" ForeColor="#333333" GridLines="None">
                <RowStyle BackColor="#EFF3FB" />
                <Columns>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:CheckBox ID="chkFriends" runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="User Image">
                        <ItemTemplate>
                            <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("ImagePath") %>' 
                                Height="50px" Width="50px" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="username" HeaderText="User Name" />
                    
                    <asp:TemplateField HeaderText="Email">
                        <ItemTemplate>
                            <asp:Label ID="lblEmailId" runat="server" Text='<%# Eval("Emailid") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    
                </Columns>
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <EditRowStyle BackColor="#2461BF" />
                <AlternatingRowStyle BackColor="White" />
            </asp:GridView>
                    </td>
            </tr>
        </table>
    
    </div>
   <%-- <a href="" id="a    dd">add</a>--%>
    <asp:HiddenField ID="HiddenField1" runat="server" />
    <div class="addNew" title="Basic modal dialog" style="display: none">
        <table width="100%">
            <tr>
                <td colspan="2">
                    <b> <asp:Label ID="Label2" runat="server" Text="One Time Email Password"></asp:Label></b>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label1" runat="server" Text="Password"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtPassword" TextMode="Password" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    
                </td>
                <td>
                    <asp:HyperLink class="view" ID="HyperLink1"  runat="server">Download File</asp:HyperLink>
              <%--      <a  href="images/Desert.jpg" > Download File</a>--%>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>