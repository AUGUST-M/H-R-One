<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Payroll_HitRateProcess_Import_History.aspx.cs"    Inherits="Payroll_HitRateProcess_Import_History" MasterPageFile="~/MainMasterPage.master" %>

<%@ Register Src="~/controls/RecordListFooter.ascx" TagName="RecordListFooter" TagPrefix="footer" %>
<%@ Register Src="~/controls/DetailToolBar.ascx" TagName="DetailToolBar" TagPrefix="tb" %>

<asp:Content ID="Content1" ContentPlaceHolderID="mainContentPlaceHolder" runat="server">
        <table border="0" cellpadding="0" cellspacing="0" width="100%" class="pm_page_title">
            <tr>
                <td>
                    <asp:Label ID="ILabel1" Text="Hit Rate Import History" runat="server" />
                </td>
            </tr>
        </table>
        
            
        <table class="pm_section" width="100%">
            <tr>
<%--                <td align="left">
                    <asp:Button ID="Back" runat="Server" Text="- Back -" CssClass="button" OnClick="Back_Click" />
                    <asp:Button ID="Import" runat="Server" Text="Import" CssClass="button" OnClick="Import_Click" />
                </td>
--%>                
                <td colspan="2">
                        <tb:DetailToolBar id="toolBar" runat="server"
                         NewButton_Visible="false" 
                         EditButton_Visible="false" 
                         SaveButton_Visible="false"
                         CustomButton1_Visible="true" 
                         DeleteButton_Visible="false" 
                         OnBackButton_Click="Back_Click"
                         CustomButton1_Name="Import" 
                         OnCustomButton1_Click="Import_Click"
                          />
                </td>
                
                <td align="right">
                    <asp:Button ID="btnHelp" runat="server" CSSClass="button" Text=" Help" Visible="false" UseSubmitBehavior="false" OnClientClick="openHelp(); return false;"/>
                </td>
            </tr>
        </table>
                
        <asp:UpdatePanel ID="ListUpdatePanel" runat="server" UpdateMode="Conditional" >
        <Triggers>
        </Triggers>
        <ContentTemplate >
        <table border="0" width="100%" class="pm_list_section" cellspacing="0" cellpadding="1">
            <col width="26px" />
            <col width="150px" />
            <col width="100px" />
            <col width="600px" />
            <tr>
                <td class="pm_list_header" >
                </td>
                <td align="left" class="pm_list_header" >
                    <asp:LinkButton runat="server" ID="_HitRateProcessImportBatchDateTime" OnClick="ChangeOrder_Click" Text="Import Date" />
                </td>
                <td align="left" class="pm_list_header" >
                    <asp:LinkButton runat="server" ID="_HitRateProcessImportBatchUploadedBy" OnClick="ChangeOrder_Click" Text="Uploaded by" />
                </td>
                <td align="left" class="pm_list_header" >
                    <asp:LinkButton runat="server" ID="_HitRateProcessImportBatchRemark" OnClick="ChangeOrder_Click" Text="Remark" />
                </td>
            </tr>
            <asp:DataList ID="Repeater" runat="server" RepeatLayout="Flow" RepeatDirection="Horizontal"
                ShowFooter="false" ShowHeader="false" OnItemDataBound="Repeater_ItemDataBound">
                <ItemTemplate>
                    <tr>
                        <td class="pm_list" align="center">
                            <input type="hidden" runat="server" id="HitRateProcessImportBatchID" />
                        </td>
                        <td class="pm_list">
                            <a href="<%#HROne.Common.WebUtility.URLwithEncryptQueryString(Session, "Payroll_HitRateProcess_Import_History_View.aspx?HitRateProcessImportBatchID=" + sbinding.getValue(Container.DataItem,"HitRateProcessImportBatchID"))%>">
                                <%#sbinding.getFValue(Container.DataItem, "HitRateProcessImportBatchDateTime", "yyyy-MM-dd HH:mm:ss")%>
                            </a> 
                        </td>
                        <td class="pm_list">
                            <%#sbinding.getValue(Container.DataItem, "HitRateProcessImportBatchUploadedBy")%>
                        </td>
                        <td class="pm_list">
                            <%#sbinding.getValue(Container.DataItem, "HitRateProcessImportBatchRemark")%>
                        </td>
                    </tr>
                </ItemTemplate>
            </asp:DataList>
        </table>
        <footer:RecordListFooter id="ListFooter" runat="server"
            OnFirstPageClick="ChangePage"
            OnPrevPageClick="ChangePage"
            OnNextPageClick="ChangePage"
            OnLastPageClick="ChangePage"
          />
        </ContentTemplate> 
        </asp:UpdatePanel >
</asp:Content> 