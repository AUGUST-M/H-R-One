<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Emp_MPFPlan_List.ascx.cs"
    Inherits="Emp_MPFPlan_List" %>
<%@ Register Src="DetailToolBar.ascx" TagName="DetailToolBar" TagPrefix="tb" %>
<%@ Register Src="RecordListFooter.ascx" TagName="RecordListFooter" TagPrefix="tb" %> 

<input type="hidden" id="EmpID" runat="server" name="ID" />
        <table width="100%" cellpadding="0" cellspacing="0" class="pm_button_section">
            <tr>
                <td>
                    <tb:DetailToolBar id="toolBar" runat="server"
                     BackButton_Visible="false"
                     EditButton_Visible="false" 
                     SaveButton_Visible="false" 
                     OnNewButton_Click ="New_Click"
                     OnDeleteButton_Click="Delete_Click"
                      />
                </td>
            </tr>
        </table>
<table border="0" width="100%" class="pm_list_section" cellspacing="0" cellpadding="1">
    <col width="26px" />
    <col width="100px" />
    <col width="100px" />
    <tr>
        <td class="pm_list_header" align="center">
                    <asp:Panel ID="SelectAllPanel" runat="server">
                    <input type="checkbox" onclick="checkAll('<%=Repeater.ClientID %>','ItemSelect',this.checked);" />
                    </asp:Panel> 
        </td>

        <td align="left" class="pm_list_header" >
            <asp:LinkButton runat="server" ID="_EmpMPFEffFr" OnClick="ChangeOrder_Click" Text="From"></asp:LinkButton></td>
        <td align="left" class="pm_list_header" >
            <asp:LinkButton runat="server" ID="_EmpMPFEffTo" OnClick="ChangeOrder_Click" Text="To"></asp:LinkButton></td>
        <td align="left" class="pm_list_header">
            <asp:LinkButton runat="server" ID="_MPFPlanID" OnClick="ChangeOrder_Click" Text="MPF Plan"></asp:LinkButton></td>
    </tr>
    <asp:Repeater ID="Repeater" runat="server" OnItemDataBound="Repeater_ItemDataBound">
        <ItemTemplate>
            <tr>
                <td class="pm_list" align="center">
		    <asp:CheckBox ID="ItemSelect" runat="server" />
                </td>
                <td class="pm_list">
                    <a href="<%#HROne.Common.WebUtility.URLwithEncryptQueryString(Session, "Emp_MPFPlan_View.aspx?EmpID=" + sbinding.getValue(Container.DataItem,"EmpID") + "&EmpMPFID=" + sbinding.getValue(Container.DataItem,"EmpMPFID"))%>">
                    <%#sbinding.getFValue(Container.DataItem,"EmpMPFEffFr")%>
		    </a>
                </td>
                <td class="pm_list">
                    <%#sbinding.getFValue(Container.DataItem, "EmpMPFEffTo")%>
                </td>
                <td class="pm_list">
                    <%#sbinding.getValue(Container.DataItem,"MPFPlanID")%>
                </td>
            </tr>
        </ItemTemplate>
    </asp:Repeater>
</table>
<tb:RecordListFooter id="ListFooter" runat="server"
    OnFirstPageClick="FirstPage_Click"
    OnPrevPageClick="PrevPage_Click"
    OnNextPageClick="NextPage_Click"
    OnLastPageClick="LastPage_Click"
  />