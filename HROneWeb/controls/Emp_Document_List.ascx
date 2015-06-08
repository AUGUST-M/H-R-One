<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Emp_Document_List.ascx.cs"
    Inherits="Emp_Document_List" %>
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
    <col width="150px" />
    <col width="200px" />
    <tr>
        <td class="pm_list_header" align="center">
                    <asp:Panel ID="SelectAllPanel" runat="server">
                    <input type="checkbox" onclick="checkAll('<%=Repeater.ClientID %>','ItemSelect',this.checked);" />
                    </asp:Panel>     
        </td>
        <td align="left" class="pm_list_header">
            <asp:LinkButton runat="server" ID="_DocumentTypeID" OnClick="ChangeOrder_Click" Text="Type"></asp:LinkButton></td>
        <td align="left" class="pm_list_header">
            <asp:LinkButton runat="server" ID="_EmpDocumentOriginalFileName" OnClick="ChangeOrder_Click" Text="File name"></asp:LinkButton></td>
        <td align="left" class="pm_list_header">
            <asp:LinkButton runat="server" ID="_EmpDocumentDesc" OnClick="ChangeOrder_Click" Text="Description"></asp:LinkButton></td>
        
    </tr>
    <asp:Repeater ID="Repeater" runat="server" OnItemDataBound="Repeater_ItemDataBound">
        <ItemTemplate>
            <tr>
                <td class="pm_list" align="center">
                    <asp:CheckBox ID="ItemSelect" runat="server" />
                </td>
                <td class="pm_list">
                    <a href="<%#HROne.Common.WebUtility.URLwithEncryptQueryString(Session, "Emp_Document_View.aspx?EmpID=" + sbinding.getValue(Container.DataItem,"EmpID") + "&EmpDocumentID=" + sbinding.getValue(Container.DataItem,"EmpDocumentID"))%>">
                        <%#sbinding.getValue(Container.DataItem, "DocumentTypeDesc")%>
                    </a>
                </td>
                <td class="pm_list">
                    <a href="<%#HROne.Common.WebUtility.URLwithEncryptQueryString(Session, "Emp_Document_Download.aspx?EmpID=" + sbinding.getValue(Container.DataItem,"EmpID") + "&EmpDocumentID=" + sbinding.getValue(Container.DataItem,"EmpDocumentID"))%>">
                        <%#sbinding.getValue(Container.DataItem, "EmpDocumentOriginalFileName")%>
                    </a>
                </td>
                <td class="pm_list">
                    <%#sbinding.getValue(Container.DataItem, "EmpDocumentDesc")%>
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