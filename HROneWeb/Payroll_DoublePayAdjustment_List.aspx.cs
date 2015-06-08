using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using HROne.DataAccess;
//using perspectivemind.validation;
using HROne.Lib.Entities;
using HROne.CommonLib;

public partial class Payroll_DoublePayAdjustment_List : HROneWebPage
{
    protected DBManager db = EEmpPersonalInfo.db;
    protected SearchBinding binding;
    protected ListInfo info;
    protected DataView view;

    protected void Page_Load(object sender, EventArgs e)
    {

        if (!WebUtils.CheckAccess(Response, Session, "PAY021", WebUtils.AccessLevel.Read))
            return;
        if (!WebUtils.CheckPermission(Session, "PAY021", WebUtils.AccessLevel.ReadWrite))
            Import.Visible = false;

        HROne.Common.WebUtility.WebControlsLocalization(this, this.Controls);

        binding = new SearchBinding(dbConn, db);
        //binding.add(new LikeSearchBinder(EmpNo, "EmpNo"));
        //binding.add(new LikeSearchBinder(EmpName, "EmpEngSurname", "EmpEngOtherName", "EmpChiFullName"));
        //binding.add(new FieldDateRangeSearchBinder(JoinDateFrom, JoinDateTo, "EmpDateOfJoin").setUseCurDate(false));
        //binding.add(new DropDownVLSearchBinder(EmpStatus, "EmpStatus", EEmpPersonalInfo.VLEmpStatus, false));

        binding.init(DecryptedRequest, null);

        info = ListFooter.ListInfo;

    }

    protected void Page_PreRender(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            //EmpStatus.SelectedValue = "A";
            EmployeeSearchControl1.EmpStatusValue = "A";
            view = loadData(info, db, Repeater);
        }
    }

    public DataView loadData(ListInfo info, DBManager db, Repeater repeater)
    {
        DBFilter filter = binding.createFilter();

        //if (info != null && info.orderby != null && !info.orderby.Equals(""))
        //    filter.add(info.orderby, info.order);
        filter.add(WebUtils.AddRankFilter(Session, "e.EmpID", true));

        // only staffs with commission calculation is configured through latest Recurring Payment
        DBFilter m_rpFilter = new DBFilter();
        OR m_or = new OR();
        m_or.add(new NullTerm("EmpRPEffTo"));
        m_or.add(new Match("EmpRPEffTo", ">=", Utility.LastDateOfMonth(AppUtils.ServerDateTime())));

        //m_rpFilter.add(new NullTerm("NOT EmpRPFPS"));
        m_rpFilter.add(new Match("EmpRPEffFr", "<=", Utility.LastDateOfMonth(AppUtils.ServerDateTime())));
        m_rpFilter.add(new Match("EmpRPFPS", ">", 0));
        m_rpFilter.add(new Match("EmpRPFPS", "<", 100));
        //m_rpFilter.add(new NullTerm("NOT EmpRPBasicSalary"));
        m_rpFilter.add(new Match("EmpRPBasicSalary", ">", 0));
        m_rpFilter.add(AppUtils.GetPayemntCodeDBTermByPaymentType(dbConn, "tmpRP.PayCodeID", "BASICSAL"));        

        filter.add(new IN("EmpID", "SELECT tmpRP.EmpID FROM EmpRecurringPayment tmpRP", m_rpFilter));

        string select = "e.* ";
        string from = "from [" + db.dbclass.tableName + "] e ";

        //DataTable table = filter.loadData(info, select, from);

        DBFilter empInfoFilter = EmployeeSearchControl1.GetEmpInfoFilter(AppUtils.ServerDateTime(), AppUtils.ServerDateTime());
        empInfoFilter.add(new MatchField("e.EmpID", "ee.EmpID"));
        filter.add(new Exists(EEmpPersonalInfo.db.dbclass.tableName + " ee", empInfoFilter));

        DataTable table = filter.loadData(dbConn, null, select, from);
        table = EmployeeSearchControl1.FilterEncryptedEmpInfoField(table, info);
        view = new DataView(table);

        ListFooter.Refresh();
        if (repeater != null)
        {
            repeater.DataSource = view;
            repeater.DataBind();
        }

        return view;
    }
    protected void Search_Click(object sender, EventArgs e)
    {
        info.page = 0;
        view = loadData(info, db, Repeater);

    }
    protected void Reset_Click(object sender, EventArgs e)
    {
        binding.clear();
        EmployeeSearchControl1.Reset();
        EmployeeSearchControl1.EmpStatusValue = "A";

        info.page = 0;
        view = loadData(info, db, Repeater);

    }
    protected void FirstPage_Click(object sender, EventArgs e)
    {
        view = loadData(info, db, Repeater);
    }

    protected void PrevPage_Click(object sender, EventArgs e)
    {
        view = loadData(info, db, Repeater);
    }

    protected void NextPage_Click(object sender, EventArgs e)
    {
        view = loadData(info, db, Repeater);
    }

    protected void LastPage_Click(object sender, EventArgs e)
    {
        view = loadData(info, db, Repeater);
    }

    protected void ChangeOrder_Click(object sender, EventArgs e)
    {
        LinkButton l = (LinkButton)sender;
        String id = l.ID.Substring(1);
        if (info.orderby == null)
            info.order = true;
        else if (info.orderby.Equals(id))
            info.order = !info.order;
        else
            info.order = true;
        info.orderby = id;

        view = loadData(info, db, Repeater);

    }
    protected void Repeater_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        DataRowView row = (DataRowView)e.Item.DataItem;
        CheckBox cb = (CheckBox)e.Item.FindControl("ItemSelect");
        WebFormUtils.LoadKeys(db, row, cb);
    }


    protected void Import_Click(object sender, EventArgs e)
    {
        HROne.Common.WebUtility.RedirectURLwithEncryptedQueryString(Response, Session, "~/Payroll_DoublePayAdjustment_Import.aspx");
    }

    protected void ImportHistory_Click(object sender, EventArgs e)
    {
        HROne.Common.WebUtility.RedirectURLwithEncryptedQueryString(Response, Session, "~/Payroll_DoublePayAdjustment_Import_History.aspx");
    }

    protected void btnExport_Click(object sender, EventArgs e)
    {
        HROne.Common.WebUtility.RedirectURLwithEncryptedQueryString(Response, Session, "~/SelectEmployee_List.aspx?Process=DoublePayAdjustment");
        //DBFilter filter = binding.createFilter();

        //filter.add(WebUtils.AddRankFilter(Session, EEmpPersonalInfo.db.dbclass.tableName + ".EmpID", true));
        ////string select = "e.* ";
        ////string from = "from [" + db.dbclass.tableName + "] e ";


        //DBFilter empInfoFilter = EmployeeSearchControl1.GetEmpInfoFilter(AppUtils.ServerDateTime(), AppUtils.ServerDateTime());
        //empInfoFilter.add(new MatchField(EEmpPersonalInfo.db.dbclass.tableName + ".EmpID", "ee.EmpID"));
        //filter.add(new Exists(EEmpPersonalInfo.db.dbclass.tableName + " ee", empInfoFilter));

        ////DataTable table = filter.loadData(dbConn, null, select, from);
        //ArrayList empList = EEmpPersonalInfo.db.select(dbConn, filter);


        //if (empList.Count > 0)
        //{
        //    string exportFileName = System.IO.Path.GetTempFileName();
        //    System.IO.File.Delete(exportFileName);
        //    exportFileName += ".xls";
        //    //System.IO.File.Copy(Server.MapPath("~/template/HistoryList_Template.xls"), exportFileName, true);
        //    HROne.Export.ExcelExport export = new HROne.Export.ExcelExport(exportFileName);
        //    DataSet dataSet = new DataSet();// export.GetDataSet();
        //    dataSet.Tables.Add(HROne.Import.ImportClaimsAndDeductionsProcess.ExportTemplate(empList, true));



        //    export.Update(dataSet);
        //    WebUtils.TransmitFile(Response, exportFileName, "ClaimsAndDeductionsTemplate_" + AppUtils.ServerDateTime().ToString("yyyyMMddHHmmss") + ".xls", true);
        //    return;
        //}
        //else
        //{
        //    PageErrors errors = PageErrors.getErrors(db, Page.Master);
        //    errors.addError("Employee not selected");
        //}
    }

    protected void btnGenerateCND_Click(object sender, EventArgs e)
    {
        HROne.Common.WebUtility.RedirectURLwithEncryptedQueryString(Response, Session, "~/Payroll_DoublePayAdjustment_Generate_CND.aspx");
    }
}
