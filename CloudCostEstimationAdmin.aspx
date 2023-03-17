
<%@ Page Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true" 
CodeFile="CloudCostEstimationAdmin.aspx.cs" Inherits="CloudCostEstimationAdmin" Title="Authentication" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


    
        <div align="center"  >
            <table  cellspacing="10" width="100%">
               
                <tr>
                    <td >
                        <asp:GridView ID="GridView" runat="server" AutoGenerateColumns="False" CellPadding="4"
                            ForeColor="#333333" GridLines="None" AllowPaging="True" 
                            AllowSorting="True" OnPageIndexChanging="GridView_PageIndexChanging" 
                            onrowdatabound="GridView_RowDataBound" Width="100%">
                            <RowStyle BackColor="#EFF3FB" />
                            <Columns>
                              
                               <asp:BoundField DataField="UserName" HeaderText="UserName" />
                                 <asp:BoundField DataField="PriceType" HeaderText="Price Type" />
                                 <asp:BoundField DataField="MemorySize" HeaderText="Memory Size" />
                                 <asp:BoundField DataField="Price" HeaderText="Price" />
                                 <asp:BoundField DataField="TotalCost" HeaderText="Total Cost" />
                                 
                               
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
            <asp:HiddenField ID="hf" runat="server" />
        </div>
    
</asp:Content>