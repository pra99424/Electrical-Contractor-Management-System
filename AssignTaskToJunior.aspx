
<%@ Page Language="C#" MasterPageFile="~/SeniorMaster.master" AutoEventWireup="true" 
CodeFile="AssignTaskToJunior.aspx.cs" Inherits="AssignTaskToJunior" Title="AssignTaskToJunior" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


    
        


    
        <div align="center"  >
            <table  cellspacing="10" >
                
                <tr>
                    <td colspan="3">
                      <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4"
                            ForeColor="#333333" GridLines="None" AllowPaging="True"  width="100%" 
                            AllowSorting="True"  >
                            <RowStyle BackColor="#EFF3FB" />
                            <Columns>
                              <asp:BoundField DataField="Username" HeaderText="Username" />
                                <asp:BoundField DataField="Category" HeaderText="Category" />
                                <asp:BoundField DataField="LocationUrl" HeaderText="LocationUrl" />
                                <asp:BoundField DataField="EndDate" HeaderText="EndDate" />
                                <asp:BoundField DataField="Address" HeaderText="Address" />
                                <asp:BoundField DataField="Status" HeaderText="Status" />
                                 
                                 
                                <asp:TemplateField HeaderText="Assign Task To Junior">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lbtnEditTaskElement" runat="server" CommandArgument='<%# Eval("Id") %>' OnCommand="lbtnEditTaskElement_Command" >Select</asp:LinkButton>
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
               <tr>
                    <td colspan="3">
                        <h1>Assign Task To Junior</h1>
                    </td>
                </tr>
                <tr>
                    <td >
                        <asp:Label ID="lblCategories0" runat="server" Text="Task Id"></asp:Label></td>
                    <td >
                        <asp:Label ID="lblTaskId" runat="server"></asp:Label></td>
                    <td >
                        &nbsp;</td>
                </tr>
               
                <tr>
                    <td >
                        <asp:Label ID="lblCategories" runat="server" Text="Junior Engineer User Name"></asp:Label></td>
                    <td >
                        <asp:DropDownList ID="cboJuniorEng" runat="server"></asp:DropDownList>    
                    
                    </td>
                    <td >
                        </td>
                </tr>
                <tr>
                    <td style="width: 100px; height: 62px;" colspan="3">
                        <asp:Button ID="btnSave" runat="server" Text="Save" Height="30px" OnClick="btnSave_Click" Width="150px" ValidationGroup="g" />
                        
                    </td>
                </tr>
            </table>
            <asp:HiddenField ID="hf" runat="server" />
            <asp:HiddenField ID="hfTaskId" runat="server" />
        </div>
    
        
    
</asp:Content>