<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ESS_AuthorizationGroup_List.aspx.cs" Inherits="ESS_AuthorizationGroup_List" MasterPageFile="~/MainMasterPage.master" %>
<%@ Register Src="~/controls/DetailToolBar.ascx" TagName="DetailToolBar" TagPrefix="tb" %>
<%@ Register Src="~/controls/RecordListFooter.ascx" TagName="RecordListFooter" TagPrefix="tb" %>

<asp:Content ID="Content1" ContentPlaceHolderID="mainContentPlaceHolder" runat="server">
        <table border="0" width="100%" cellpadding="0" cellspacing="0" class="pm_page_title">
            <tr>
                <td>
                    <asp:Label Text="Authorization Group Setup" runat="Server" /></td>
            </tr>
        </table>
                    
        <table border="0" cellpadding="0" cellspacing="0" width="100%" class="pm_section_title">
            <tr>
                <td>
                    <asp:Label ID="Label1" runat="server" Text="Authorization Group Search" />
                </td>
            </tr>
        </table>
        <asp:UpdatePanel ID="SearchUpdatePanel" runat="server" UpdateMode="Conditional" >
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="Reset" EventName="Click" />
        </Triggers>
        <ContentTemplate >
        <table width="100%" class="pm_section">
            <tr>
                <td class="pm_search_header">
                    <asp:Label ID="Label2" runat="server" Text="Code" />:
                </td>
                <td class="pm_search">
                    <asp:TextBox runat="server" ID="AuthorizationGroupCode" /></td>
                <td class="pm_search_header">
                    <asp:Label ID="Label3" runat="server" Text="Description" />:
                </td>
                <td class="pm_search">
                    <asp:TextBox runat="server" ID="AuthorizationGroupDesc" /></td>
            </tr>
        </table>
        </ContentTemplate >
        </asp:UpdatePanel>
        <table width="100%" cellpadding="0" cellspacing="0" class="pm_button_section">
            <tr>
                <td>
                    <asp:Button ID="Search" runat="server" Text="Search" CssClass="button" OnClick="Search_Click" />
                    <asp:Button ID="Reset" runat="server" Text="Reset" CssClass="button" OnClick="Reset_Click" />
                </td>
            </tr>
        </table>
        <br />
                        
                            
                    
        <table width="100%" cellpadding="0" cellspacing="0" class="pm_button_section">
            <tr>
                <td>
                    <tb:DetailToolBar id="toolBar" runat="server"
                     EditButton_Visible="false" 
                     BackButton_Visible="false"
                     SaveButton_Visible ="false"
                     OnNewButton_Click="New_Click"
                     OnDeleteButton_Click="Delete_Click"
                      />
                </td>
                <td align="right">
                    <asp:Button ID="btnHelp" runat="server" CSSClass="button" Text=" Help" Visible="false" UseSubmitBehavior="false" OnClientClick="openAlert(); return false;"/>
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
                <tr>
                    <td class="pm_list_header">
                    </td>
                    <td align="left" class="pm_list_header">
                        <asp:LinkButton runat="server" ID="_AuthorizationCode" OnClick="ChangeOrder_Click" Text="Code"/>
                    </td>
                    <td align="left" class="pm_list_header">
                        <asp:LinkButton runat="server" ID="_AuthorizationDesc" OnClick="ChangeOrder_Click" Text="Description"/>
                    </td>
                    <td align="left" class="pm_list_header">
                        <asp:LinkButton runat="server" ID="_AuthorizationGroupIsReceiveOtherGrpAlert" OnClick="ChangeOrder_Click" Text="Receive Other Group Alert"/>
                    </td>                                                                     
                </tr>
                <asp:DataList ID="Repeater" runat="server" RepeatLayout="Flow" RepeatDirection="Horizontal" ShowFooter="false"
                    ShowHeader="false" OnItemDataBound="Repeater_ItemDataBound">
                    <ItemTemplate>
                        <tr>
                            <td class="pm_list" align="center">
                                <asp:CheckBox ID="DeleteItem" runat="server" />
                                <input type="hidden" runat="server" id="AuthorizationGroupID" />
                            </td>
                            <td class="pm_list">
                                <a href="<%#HROne.Common.WebUtility.URLwithEncryptQueryString(Session, "ESS_AuthorizationGroup_View.aspx?AuthorizationGroupID=" + sbinding.getValue(Container.DataItem,"AuthorizationGroupID")) %>">
                                <%#sbinding.getValue(Container.DataItem,"AuthorizationCode")%>
                                </a>
                            </td>
                            <td class="pm_list">
                                <%#sbinding.getValue(Container.DataItem,"AuthorizationDesc")%>
                            </td>
                            <td class="pm_list">
                                <%#sbinding.getValue(Container.DataItem,"AuthorizationGroupIsReceiveOtherGrpAlert")%>
                            </td>                                                                                                            
                        </tr>
                    </ItemTemplate>
                </asp:DataList>
            </table>
            <tb:RecordListFooter id="ListFooter" runat="server"
                OnFirstPageClick="FirstPage_Click"
                OnPrevPageClick="PrevPage_Click"
                OnNextPageClick="NextPage_Click"
                OnLastPageClick="LastPage_Click"
                ListOrderBy="AuthorizationCode" ListOrder="true" 
              />
        </ContentTemplate> 
        </asp:UpdatePanel> 
</asp:Content> 