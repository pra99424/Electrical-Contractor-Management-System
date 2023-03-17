<%@ Page Title="" Language="C#" MasterPageFile="~/UserMaster.master" AutoEventWireup="true" CodeFile="VirtualMachineList.aspx.cs" Inherits="VirtualMachineList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1>Virtual Machine List</h1>
    <asp:DataList ID="DataList1" runat="server" RepeatDirection="Horizontal" CellPadding="40">
        <ItemTemplate>
            <table width="100%" >
                <tr>
                    <td >
                        <asp:Label ID="Label1" runat="server" Text="Virtual Machine Name" Font-Bold="True"></asp:Label></td>
                    <td>
                        <asp:Label ID="Label5" runat="server" Text='<%# Eval("VirtualMachineName") %>' ></asp:Label>

                        </td>
                    
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl='<%# Eval("ImagePath") %>'  Width="200px" Height="200px" CommandArgument='<%# Eval("VirtualMachineName") %>' OnCommand="ImageButton1_Command"  />
                        
                    </td>
                </tr>
                <tr>
                    <td >
                        <asp:Label ID="lblImageUpload" runat="server" Text="Payment Type" Font-Bold="True"></asp:Label></td>
                    <td >
                        <asp:Label ID="Label6" runat="server" Text='<%# Eval("PriceType") %>' ></asp:Label>
                     </td>
                </tr>
                <tr>
                    <td >
                        <asp:Label ID="lblCategories" runat="server" Text="Price" Font-Bold="True"></asp:Label></td>
                    <td >
                        <asp:Label ID="Label4" runat="server" Text='<%# Eval("Price") %>' ></asp:Label>
                    </td>
                    
                </tr>
                <tr>
                    <td >
                        <asp:Label ID="Label2" runat="server" Text="Memory Size in GB" Font-Bold="True"></asp:Label></td>
                    <td >
                        <asp:Label ID="Label7" runat="server" Text='<%# Eval("MemorySizeinGB") %>'  ></asp:Label>
                    </td>
                   
                </tr>
                <tr>
                    <td >
                        <asp:Label ID="Label3" runat="server" Text="VMLocation" Font-Bold="True"></asp:Label></td>
                    <td >
                        <asp:Label ID="Label8" runat="server" Text='<%# Eval("VMLocation") %>'  ></asp:Label></td>
                </tr>
            </table>
        </ItemTemplate>
    </asp:DataList>
</asp:Content>

