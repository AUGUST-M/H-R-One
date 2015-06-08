﻿<%@ control language="C#" autoeventwireup="true" inherits="Emp_Request_LeaveCancel_List, HROneESS.deploy" %>

<%@ Register Src="~/controls/WebDatePicker.ascx" TagName="WebDatePicker" TagPrefix="uc1" %>
<%@ Register Src="~/controls/RecordListFooter.ascx" TagName="RecordListFooter" TagPrefix="tb" %>

<input type="hidden" id="EmpID" runat="server" name="ID" />
    <table width="100%" border="0" cellpadding="5" cellspacing="0" class="pm_list_section">
        <tr >
            <td colspan="11" class="pm_list_title">
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td colspan="2">
                            <asp:Label ID="Label1" runat="server" Text="Leave Application Cancellation" /> :
                        </td>
                    </tr>
                    <tr>
                        <td >
                            <asp:Label ID="lblHeader" runat="server" Text="Request From" /> :
                            <uc1:WebDatePicker id="RequestFromDate" runat="server" ShowDateFormatLabel="false" AutoPostBack="true" /><asp:Label runat="server" Text="To" />
                            <uc1:WebDatePicker id="RequestToDate" runat="server" ShowDateFormatLabel="false" AutoPostBack="true" />
                        </td>
                        <td>
<%--                                    <asp:Button ID="Search" runat="server" Text="Go" CssClass="button" OnClick="Search_Click" />
--%>
                        </td>
                        <td align="right">
                        <asp:DropDownList ID="EmpRequestStatus" runat="Server" OnSelectedIndexChanged="EmpRequestStatus_SelectedIndexChanged" AutoPostBack="True" >
                            <asp:ListItem Text="REQUEESTSTATUS_ALL" />
                            <asp:ListItem Value="REQUEESTSTATUS_PROCESSING" Text="REQUEESTSTATUS_PROCESSING" Selected="True" />
                            <asp:ListItem Value="REQUEESTSTATUS_END_PROCESS" Text="REQUEESTSTATUS_END_PROCESS" />
                        </asp:DropDownList>
                        </td> 
                    </tr>
                </table>
            </td>
        </tr>
        <tr >
            <td class="pm_list_header">                                                    
                <asp:LinkButton runat="server" ID="_RequestLeaveAppCancelCreateDateTime" OnClick="ChangeOrder_Click" Text="Submit Date" />
            </td>
            <td class="pm_list_header">
                <asp:LinkButton runat="server" ID="_LeaveAppDateFrom" OnClick="ChangeOrder_Click" Text="From" />
            </td>
            <td class="pm_list_header">
                <asp:LinkButton runat="server" ID="_LeaveAppDateTo" OnClick="ChangeOrder_Click" Text="To" />
            </td>
            <td class="pm_list_header" colspan="2">
                <asp:LinkButton runat="server" ID="_LeaveAppTimeFrom" OnClick="ChangeOrder_Click" Text="Time" />
            </td>
            <td class="pm_list_header">
                <asp:LinkButton runat="server" ID="_LeaveCodeID" OnClick="ChangeOrder_Click" Text="Type" />
            </td>

            <%-- Start 0000094, Ricky So, 2014-09-15 --%>
            <td class="pm_list_header" colspan="2" align="center">
                <asp:LinkButton runat="server" ID="_RequestLeaveDuration" OnClick="ChangeOrder_Click" Text="Duration" />
            </td>

            <%--
            <td class="pm_list_header" >
                <asp:LinkButton runat="server" ID="LinkButton1" OnClick="ChangeOrder_Click" Text="Days" />
            </td>
            <td class="pm_list_header">
                <asp:LinkButton runat="server" ID="_LeaveAppUnit" OnClick="ChangeOrder_Click" Text="Unit" />
            </td>
            --%>
            <%-- End 0000094, Ricky So, 2014-09-15 --%>
            <td class="pm_list_header">
                <asp:Label runat="server" Text="Status" />
            </td>
            <td class="pm_list_header">&nbsp</td>
        </tr>
        <asp:DataList ID="Repeater" runat="server" RepeatLayout="Flow" RepeatDirection="Horizontal" ShowFooter="false"
        ShowHeader="false" OnItemCommand="Repeater_ItemCommand" OnItemDataBound="Repeater_ItemDataBound">
            <ItemTemplate> 
                <tr >
                    <td class="pm_list">
                        <input type="hidden" runat="server" id="_RequestLeaveAppCancelID" />       
                        <a href="ESS_EmpRequestDetail.aspx?TargetEmpID=<%#binding.getValue(Container.DataItem,"EmpID")%>&EmpRequestRecordID=<%#binding.getValue(Container.DataItem,"RequestLeaveAppCancelID")%>&EmpRequestID=<%#binding.getValue(Container.DataItem,"EmpRequestID")%>">
                        <%#binding.getFValue(Container.DataItem, "RequestLeaveAppCancelCreateDateTime", "yyyy-MM-dd HH:mm:ss")%>                                </a>
                        
                    </td>
                    <td class="pm_list">
                        <%#binding.getFValue(Container.DataItem, "LeaveAppDateFrom", "yyyy-MM-dd")%>
                        <%#binding.getFValue(Container.DataItem, "LeaveAppDateFromAM")%>
                    <td class="pm_list">
                        <%#binding.getFValue(Container.DataItem, "LeaveAppDateTo", "yyyy-MM-dd")%>
                        <%#binding.getFValue(Container.DataItem, "LeaveAppDateToAM")%>
                    </td>
                    <td class="pm_list">
                        <%#binding.getFValue(Container.DataItem, "LeaveAppTimeFrom", "HH:mm")%>
                    </td>
                    <td class="pm_list">
                        <%#binding.getFValue(Container.DataItem, "LeaveAppTimeTo", "HH:mm")%>
                    </td>
                    <td class="pm_list">
                        <%#binding.getValue(Container.DataItem, "LeaveCodeDesc")%>
                    </td>
                    <td class="pm_list" align="center">
                        <%-- Start 0000094, Ricky So, 2014-09-09--%>
                        <asp:Label id="RequestLeaveDays" runat="server" />
                        <%--#binding.getFValue(Container.DataItem,"LeaveAppDays" , "0.00") --%>
                        <%-- End 0000094, Ricky So, 2014-09-09--%>
                    </td>
                    <td class="pm_list" align="center">
                        <%#binding.getValue(Container.DataItem, "LeaveAppUnit") %>
                    </td>
                    <td class="pm_list">
                        <%#binding.getValue(Container.DataItem, "EmpRequestStatus")%>
                        (<%#binding.getValue(Container.DataItem, "EmpRequestLastAuthorizationWorkFlowIndex")%>)
                    </td>
                    <td class="pm_list" align="Center">
                        <asp:Button ID="Cancel" runat="server" Text="Cancel" CssClass="button" />
                    </td>

                </tr>
            </ItemTemplate>
        </asp:DataList>
    </table>
    <table width="100%" cellspacing="0" cellpadding="0" class="pm_list_pagenav">
        <tr>
            <td align="right" class="pm_list_pagenav">
                <tb:RecordListFooter id="ListFooter" runat="server"
                     ShowAllRecords="true" 
                  />
            </td>
        </tr>
    </table>
