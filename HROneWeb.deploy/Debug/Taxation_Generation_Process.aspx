﻿<%@ page language="C#" autoeventwireup="true" inherits="Taxation_Generation_Process, HROneWeb.deploy" masterpagefile="~/MainMasterPage.master" viewStateEncryptionMode="Always" %>



<asp:Content ID="Content1" ContentPlaceHolderID="mainContentPlaceHolder" runat="server">

    <table border="0" cellpadding="0" cellspacing="0" width="100%" class="pm_section_title">
        <tr>
            <td>
                <asp:Label runat="server" Text="Generate Taxation Records" />
            </td>
        </tr>
    </table>
    <table width="100%">
        <tr>
            <td class="pm_field" align="center">
                <asp:Label ID="lblProgressMessage" runat="server" Text="Taxation records are generating..." />
            </td>
        </tr>
        <tr>
            <td class="pm_field" align="center">
                <asp:Label ID="lblProgress" runat="server" Text=""/>
            </td>
        </tr>
    </table>
</asp:Content> 