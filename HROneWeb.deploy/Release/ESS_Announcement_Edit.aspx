﻿<%@ page language="C#" autoeventwireup="true" inherits="ESS_Announcement_Edit, HROneWeb.deploy" masterpagefile="~/MainMasterPage.master" viewStateEncryptionMode="Always" %>
<%@ Register Src="~/controls/DetailToolBar.ascx" TagName="DetailToolBar" TagPrefix="tb" %>
<%@ Register Src="~/controls/WebDatePicker.ascx" TagName="WebDatePicker" TagPrefix="uc1" %>
<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="mainContentPlaceHolder" runat="server">
        <input type="hidden" id="ESSAnnouncementID" runat="server" name="ID" />
        <table border="0" cellpadding="0" cellspacing="0" width="100%" class="pm_page_title">
            <tr>
                <td>
                    <asp:Label ID="Label1" runat="server" EnableViewState="false" Text="ESS Announcement Setup" />
                </td>
            </tr>
        </table>
        <table border="0" cellpadding="0" cellspacing="0" width="100%" class="pm_section_title">
            <tr>
                <td>
                    <%=CurID<=0?HROne.Common.WebUtility.GetLocalizedString("Add"):HROne.Common.WebUtility.GetLocalizedString("Edit") %>
                    <asp:Label runat="server" EnableViewState="false" Text="ESS Announcement " />:
                    <%=ESSAnnouncementCode.Text %>
                </td>
            </tr>
        </table>
        
            
                
        
        <table width="100%" cellpadding="0" cellspacing="0" class="pm_button_section">
            <tr>
                <td>
                    <tb:DetailToolBar id="toolBar" runat="server"
                     NewButton_Visible="false" 
                     EditButton_Visible="false" 
                     OnBackButton_Click="Back_Click"
                     OnSaveButton_Click ="Save_Click"
                     OnDeleteButton_Click="Delete_Click"
                      />
                </td>
                <td align="right">
                    <asp:Button ID="btnHelp" runat="server" CSSClass="button" EnableViewState="false" Text=" Help" Visible="false" UseSubmitBehavior="false" OnClientClick="openHelp(); return false;"/>
                </td>
            </tr>
        </table>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional" >
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="toolbar"/>
        </Triggers>
        <ContentTemplate >
        <table border="0" width="100%" cellpadding="0" cellspacing="0" class="pm_field_section">
            <col width="15%" />
            <col width="35%" />
            <col width="15%" />
            <col width="35%" />
            <tr>
                <td class="pm_field_header" >
                    <asp:Label runat="server" EnableViewState="false" Text="Announcement Code" />:</td>
                <td class="pm_field" colspan="3">
                    <asp:TextBox ID="ESSAnnouncementCode" runat="Server" /></td>
            </tr>
            <tr>
                <td class="pm_field_header" >
                    <asp:Label runat="server" EnableViewState="false" Text="Effective Date" />:</td>
                <td class="pm_field" >
                     <uc1:WebDatePicker id="ESSAnnouncementEffectiveDate" runat="server" /></td>
                <td class="pm_field_header" >
                    <asp:Label runat="server" EnableViewState="false" Text="Expiry Date" />:</td>
                <td class="pm_field" >
                     <uc1:WebDatePicker id="ESSAnnouncementExpiryDate" runat="server" /></td>
            </tr>
            <tr>
                <td class="pm_field_header" >
                    <asp:Label ID="Label3" runat="server" EnableViewState="false" Text="Announcement Content" />:</td>
                <td class="pm_field" colspan="3">
                    <CKEditor:CKEditorControl ID="ESSAnnouncementContent" runat="server"></CKEditor:CKEditorControl></td>
            </tr>
            <tr>
                <td class="pm_field_header">
                    <asp:Label ID="Label4" runat="server" EnableViewState="false" Text="Target Companies" />:
                </td>
                <td class="pm_field" valign="top">
                    <asp:Repeater ID="ESSAnnouncementTargetCompanies" runat="server" OnItemDataBound="Companies_ItemDataBound">
                        <ItemTemplate>
                                <asp:CheckBox ID="ItemSelect" runat="server" />
                            <input type="hidden" runat="server" id="CompanyID" />
                            <%#  companyBinding.getValue(Container.DataItem,"CompanyName")%>
                            <br />
                        </ItemTemplate>
                    </asp:Repeater>
                </td>
               <%-- <td class="pm_field">
                    <asp:TextBox ID="ESSAnnouncementTargetCompanies" runat="Server" />
                </td>--%>
                <td class="pm_field_header">
                    <asp:Label runat="server" EnableViewState="false" Text="Target Ranks" />:
                </td>
                <td class="pm_field" valign="top">
                    <asp:Repeater ID="ESSAnnouncementTargetRanks" runat="server" OnItemDataBound="Ranks_ItemDataBound">
                        <ItemTemplate>
                                <asp:CheckBox ID="ItemSelect" runat="server" />
                            <input type="hidden" runat="server" id="RankID" />
                            <%#  rankBinding.getValue(Container.DataItem,"RankDesc")%>
                            <br />
                        </ItemTemplate>
                    </asp:Repeater>
                </td>
            <%--    <td class="pm_field">
                    <asp:TextBox ID="ESSAnnouncementTargetRanks" runat="Server" />
                </td>--%>
            </tr>
        </table>
        </ContentTemplate>
        </asp:UpdatePanel >
</asp:Content> 