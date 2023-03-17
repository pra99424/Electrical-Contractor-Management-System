<%@ Page Language="C#" MasterPageFile="~/UserMaster.master" AutoEventWireup="true" CodeFile="PAYGAnalyseInGraph.aspx.cs" 
Inherits="PAYGAnalyseInGraph" Title="PAYGAnalyseInGraph" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <table width="100%">

<tr>
    <td>
        <h1>Income Expence Curve </h1>
        <asp:Chart ID="Chart2" runat="server">
            <Series>
                <asp:Series Name="Series1">
                </asp:Series>
            </Series>
            <ChartAreas>
                <asp:ChartArea Name="ChartArea1">
                </asp:ChartArea>
            </ChartAreas>
        </asp:Chart>
    </td>
    <td>
        
        <asp:Chart ID="Chart1"  runat="server">
            <Series>
                <asp:Series Name="Series1" ChartType="Line">
                </asp:Series>
            </Series>
            <ChartAreas>
                <asp:ChartArea Name="ChartArea1">
                </asp:ChartArea>
            </ChartAreas>
        </asp:Chart>
                
    </td>
</tr>
</table>
   
                

    
</asp:Content>