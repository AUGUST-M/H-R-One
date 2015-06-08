<%@ Page Language="C#" AutoEventWireup="true" CodeFile="LeavePlan_List.aspx.cs" Inherits="LeavePlan_List"  MasterPageFile="~/MainMasterPage.master"  %>
<%@ Register Src="~/controls/DetailToolBar.ascx" TagName="DetailToolBar" TagPrefix="tb" %>
<%@ Register Src="~/controls/RecordListFooter.ascx" TagName="RecordListFooter" TagPrefix="tb" %>

<asp:Content ID="Content1" ContentPlaceHolderID="mainContentPlaceHolder" runat="server">
        <table border="0" cellpadding="0" cellspacing="0" width="100%" class="pm_page_title">
            <tr>
                <td>
                    <asp:Label runat="server" Text="Leave Plan Setup" />
                </td>
            </tr>
        </table>
        <table border="0" cellpadding="0" cellspacing="0" width="100%" class="pm_section_title">
            <tr>
                <td>
                    <asp:Label runat="server" Text="Leave Plan Search" />
                </td>
            </tr>
        </table>
        
        <asp:UpdatePanel ID="SearchUpdatePanel" runat="server" UpdateMode="Conditional" >
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="Reset" EventName="Click" />
        </Triggers>
        <ContentTemplate >
        <table width="100%" cellpadding="0" cellspacing="0" class="pm_section">
            <tr>
                <td class="pm_search_header">
                    <asp:Label runat="server" Text="Code" />:
                </td>
                <td class="pm_search">
                    <asp:TextBox runat="server" ID="LeavePlanCode" /></td>
                <td class="pm_search_header">
                    <asp:Label runat="server" Text="Description" />:
                </td>
                <td class="pm_search">
                    <asp:TextBox runat="server" ID="LeavePlanDesc" /></td>
            </tr>
        </table>
        </ContentTemplate> 
        </asp:UpdatePanel> 
        <table width="100%" cellpadding="0" cellspacing="0" class="pm_button_section">
            <tr>
                <td>
                    <asp:Button ID="Search" runat="server" Text="Search" CssClass="button" OnClick="Search_Click" />
                    <asp:Button ID="Reset" runat="server" Text="Reset" CssClass="button" OnClick="Reset_Click" />
                </td>
            </tr>
        </table>
        <br /><br />
        <table border="0" cellpadding="0" cellspacing="0" width="100%" class="pm_section_title">
            <tr>
                <td>
                    <asp:Label runat="server" Text="Leave Plan List" />
                </td>
            </tr>
        </table>

        <table width="100%" cellpadding="0" cellspacing="0" class="pm_button_section">
            <tr>
                <td>
                    <%-- Start 0000006, Miranda, 2014-06-16 --%>
                     <tb:DetailToolBar id="toolBar" runat="server"
                     CopyButton_Visible="true" 
                     BackButton_Visible="false"
                     EditButton_Visible="false" 
                     SaveButton_Visible="false" 
                     OnNewButton_Click ="New_Click"
                     OnCopyButton_Click="Copy_Click"
                     OnDeleteButton_Click="Delete_Click"
                      />
                    <%-- End 0000006, Miranda, 2014-06-16 --%>
                </td>
                <td align="right">
                    <asp:Button ID="btnHelp" runat="server" CSSClass="button" Text=" Help" Visible="false" UseSubmitBehavior="false" OnClientClick="openHelp(); return false;"/>
                </td>
            </tr>
        </table>
        <asp:UpdatePanel ID="ListUpdatePanel" runat="server" UpdateMode="Conditional" >
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="Search" EventName="Click" />
            <asp:AsyncPostBackTrigger ControlID="Reset" EventName="Click" />
            <asp:AsyncPostBackTrigger ControlID="toolBar"  />
        </Triggers>
        <ContentTemplate >        
        <table border="0" width="100%" class="pm_list_section" cellspacing="0" cellpadding="1">
            <col width="26px" />
            <col width="200px" />
            <tr>
                <td class="pm_list_header" align="center">
                    <asp:Panel ID="SelectAllPanel" runat="server">
                    <input type="checkbox" onclick="checkAll('<%=Repeater.ClientID %>','ItemSelect',this.checked);" />
                    </asp:Panel>
                </td>
                <td align="left" class="pm_list_header">
                    <asp:LinkButton runat="server" ID="_LeavePlanCode" OnClick="ChangeOrder_Click" Text="Code"/></td>
                <td align="left" class="pm_list_header">
                    <asp:LinkButton runat="server" ID="_LeavePlanDesc" OnClick="ChangeOrder_Click" Text="Description"/></td>
            </tr>
            <asp:Repeater ID="Repeater" runat="server" OnItemDataBound="Repeater_ItemDataBound">
                <ItemTemplate>
                    <tr>
                        <td class="pm_list" align="center">
                            <asp:CheckBox ID="ItemSelect" runat="server" />
                        </td>
                        <td class="pm_list">
                            <a href="<%#HROne.Common.WebUtility.URLwithEncryptQueryString(Session, "LeavePlan_View.aspx?LeavePlanID=" + binding.getValue(Container.DataItem,"LeavePlanID"))%>">
                                <%#binding.getValue(Container.DataItem,"LeavePlanCode")%>
                            </a>
                        </td>
                        <td class="pm_list">
                            <%#binding.getValue(Container.DataItem,"LeavePlanDesc")%>
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
        </ContentTemplate> 
        </asp:UpdatePanel> 
</asp:Content> 