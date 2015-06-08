using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using HROne.DataAccess;
//using perspectivemind.validation;

using HROne.Lib.Entities;

public partial class StatutoryHoliday : HROneWebPage
{

    private const string FUNCTION_CODE = "SYS006";
    private const string TABLE_NAME = "StatutoryHoliday";
    protected DBManager db = EStatutoryHoliday.db;
    protected SearchBinding sbinding;
    protected ListInfo info;
    protected DataView view;
    public Binding binding;
    public Binding ebinding;
    public EStatutoryHoliday obj;
    public int CurID = -1;
    private bool IsAllowEdit = true;
    

    protected void Page_Load(object sender, EventArgs e)
    {
       
        if (!WebUtils.CheckAccess(Response, Session, FUNCTION_CODE, WebUtils.AccessLevel.Read))
            return;
        toolBar.FunctionCode = FUNCTION_CODE;
        if (!WebUtils.CheckPermission(Session, FUNCTION_CODE, WebUtils.AccessLevel.ReadWrite))
        {
            IsAllowEdit = false;
        }
        AddPanel.Visible = IsAllowEdit;
        HolidayImport.Visible = IsAllowEdit;

        binding = new Binding(dbConn, db);
        binding.add(new TextBoxBinder(db, StatutoryHolidayDate.TextBox, StatutoryHolidayDate.ID));
        binding.add(StatutoryHolidayDesc);
        binding.init(Request, Session);

        sbinding = new SearchBinding(dbConn, db);
        sbinding.add(new DropDownVLSearchBinder(YearSelect, "YEAR(StatutoryHolidayDate)", new WFYearList(15, 5), false));
        sbinding.init(DecryptedRequest, null);

        info = ListFooter.ListInfo;

        HROne.Common.WebUtility.WebControlsLocalization(this, this.Controls);
    }

    protected void Page_PreRender(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            YearSelect.SelectedValue = AppUtils.ServerDateTime().Year.ToString();
            view = loadData(info, db, Repeater);
        }

    }

    public DataView loadData(ListInfo info, DBManager db, DataList repeater)
    {
        DBFilter filter = sbinding.createFilter();

        if (info != null && info.orderby != null && !info.orderby.Equals(""))
        {
            //filter.add(info.orderby, info.order);
        }
        else
        {
            info.orderby = "StatutoryHolidayDate";
            info.order = true;
        }
        string select = "c.*";
        string from = "from " + db.dbclass.tableName + " c ";

        DataTable table = WebUtils.GetDataTableFromSelectQueryWithFilter(dbConn, select, from, filter, info);

        view = new DataView(table);
        if (repeater != null)
        {
            repeater.DataSource = view;
            repeater.DataBind();
        }

        return view;
    }
    //protected void Search_Click(object sender, EventArgs e)
    //{
    //    info = new ListInfo();
    //    view = loadData(info, db, Repeater);

    //}
    //protected void Reset_Click(object sender, EventArgs e)
    //{
    //    sbinding.clear();
    //    info = new ListInfo();
    //    view = loadData(info, db, Repeater);

    //}
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

        Repeater.EditItemIndex = -1;
        view = loadData(info, db, Repeater);

    }
    protected void Add_Click(object sender, EventArgs e)
    {
        Repeater.EditItemIndex = -1;
        EStatutoryHoliday c = new EStatutoryHoliday();

        Hashtable values = new Hashtable();
        binding.toValues(values);

        PageErrors errors = PageErrors.getErrors(db, Page.Master);
        errors.clear();


        db.validate(errors, values);

        if (!errors.isEmpty())
            return;


        db.parse(values, c);
        if (!AppUtils.checkDuplicate(dbConn, db, c, errors, "StatutoryHolidayDate"))
            return;

        WebUtils.StartFunction(Session, FUNCTION_CODE);
        db.insert(dbConn, c);
        WebUtils.EndFunction(dbConn);

        StatutoryHolidayDate.Value = string.Empty;
        StatutoryHolidayDesc.Text = string.Empty;

        view = loadData(info, db, Repeater);
    }

    protected void Repeater_ItemDataBound(object sender, DataListItemEventArgs e)
    {
        HROne.Common.WebUtility.WebControlsLocalization(Session, e.Item.Controls);

        e.Item.FindControl("DeleteItem").Visible = IsAllowEdit;
        if (e.Item.ItemIndex == Repeater.EditItemIndex)
        {
            ebinding = new Binding(dbConn, db);
            ebinding.add((HtmlInputHidden)e.Item.FindControl("StatutoryHolidayID"));
            ebinding.add(new TextBoxBinder(db, ((WebDatePicker)e.Item.FindControl("StatutoryHolidayDate")).TextBox, "StatutoryHolidayDate"));
            ebinding.add((TextBox)e.Item.FindControl("StatutoryHolidayDesc"));
            ebinding.init(Request, Session);


            EStatutoryHoliday obj = new EStatutoryHoliday();
            db.toObject(((DataRowView)e.Item.DataItem).Row, obj);
            Hashtable values = new Hashtable();
            db.populate(obj, values);
            ebinding.toControl(values);
        }
        else
        {
            e.Item.FindControl("Edit").Visible = IsAllowEdit;
            HtmlInputHidden h = (HtmlInputHidden)e.Item.FindControl("StatutoryHolidayID");
            h.Value = ((DataRowView)e.Item.DataItem)["StatutoryHolidayID"].ToString();
        }
    }

    protected void Repeater_ItemCommand(object source, DataListCommandEventArgs e)
    {
        Button b = (Button)e.CommandSource;




        if (b.ID.Equals("Edit"))
        {
            Repeater.EditItemIndex = e.Item.ItemIndex;
            view = loadData(info, db, Repeater);
            WebUtils.SetEnabledControlSection(AddPanel, false);
        }
        else if (b.ID.Equals("Cancel"))
        {
            Repeater.EditItemIndex = -1;
            view = loadData(info, db, Repeater);
            WebUtils.SetEnabledControlSection(AddPanel, true);
        }
        else if (b.ID.Equals("Save"))
        {
            ebinding = new Binding(dbConn, db);
            ebinding.add((HtmlInputHidden)e.Item.FindControl("StatutoryHolidayID"));
            ebinding.add(new TextBoxBinder(db, ((WebDatePicker)e.Item.FindControl("StatutoryHolidayDate")).TextBox, "StatutoryHolidayDate"));
            ebinding.add((TextBox)e.Item.FindControl("StatutoryHolidayDesc"));
            ebinding.init(Request, Session);


            EStatutoryHoliday obj = new EStatutoryHoliday();
            Hashtable values = new Hashtable();

            PageErrors errors = PageErrors.getErrors(db, Page.Master);
            errors.clear();


            ebinding.toValues(values);
            db.validate(errors, values);

            if (!errors.isEmpty())
            {
                return;
            }

            db.parse(values, obj);
            if (!AppUtils.checkDuplicate(dbConn, db, obj, errors, "StatutoryHolidayDate"))
                return;

            WebUtils.StartFunction(Session, FUNCTION_CODE);
            db.update(dbConn, obj);
            WebUtils.EndFunction(dbConn);

            Repeater.EditItemIndex = -1;
            view = loadData(info, db, Repeater);
            WebUtils.SetEnabledControlSection(AddPanel, true);
        }


    }

    protected void Delete_Click(object sender, EventArgs e)
    {

        ArrayList list = new ArrayList();
        foreach (DataListItem item in Repeater.Items)
        {
            CheckBox c = (CheckBox)item.FindControl("DeleteItem");
            HtmlInputHidden h = (HtmlInputHidden)item.FindControl("StatutoryHolidayID");
            if (c.Checked)
            {
                EStatutoryHoliday obj = new EStatutoryHoliday();
                obj.StatutoryHolidayID = Int32.Parse(h.Value);
                list.Add(obj);
            }
        }
        foreach (EStatutoryHoliday obj in list)
        {
            if (EStatutoryHoliday.db.select(dbConn, obj))
            {
                WebUtils.StartFunction(Session, FUNCTION_CODE);
                db.delete(dbConn, obj);
                WebUtils.EndFunction(dbConn);
            }
        }
        view = loadData(info, db, Repeater);
        //Response.Redirect(Request.Url.LocalPath);
    }
    protected void YearSelect_SelectedIndexChanged(object sender, EventArgs e)
    {
        view = loadData(info, db, Repeater);
    }
    protected void btnExport_Click(object sender, EventArgs e)
    {

        DataTable tmpDataTable = new DataTable(TABLE_NAME);
        tmpDataTable.Columns.Add("Date", typeof(DateTime));
        tmpDataTable.Columns.Add("Description", typeof(string));

        DBFilter filter = sbinding.createFilter();
        filter.add("StatutoryHolidayDate", true);

        ArrayList holidayList = EStatutoryHoliday.db.select(dbConn, filter);
        foreach (EStatutoryHoliday statHol in holidayList)
        {
            DataRow row = tmpDataTable.NewRow();
            row["Date"] = statHol.StatutoryHolidayDate;
            row["Description"] = statHol.StatutoryHolidayDesc;
            tmpDataTable.Rows.Add(row);
        }
        string exportFileName = System.IO.Path.GetTempFileName();
        System.IO.File.Delete(exportFileName);
        exportFileName += ".xls";
        HROne.Export.ExcelExport excelExport = new HROne.Export.ExcelExport(exportFileName);
        excelExport.Update(tmpDataTable);
        WebUtils.TransmitFile(Response, exportFileName, "StatutoryHoliday_" + AppUtils.ServerDateTime().ToString("yyyyMMddHHmmss") + ".xls", true);
        return;

    }
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        PageErrors errors = PageErrors.getErrors(db, Page.Master);
        errors.clear();

        if (HolidayTableFile.HasFile)
        {
            string strTmpFolder = HROne.Common.Folder.GetOrCreateSessionTempFolder(Session.SessionID).FullName; ; //Environment.GetFolderPath(Environment.SpecialFolder.InternetCache);
            string strTmpFile = System.IO.Path.Combine(strTmpFolder, AppUtils.ServerDateTime().ToString("~yyyyMMddHHmmss_") + HolidayTableFile.FileName);
            HolidayTableFile.SaveAs(strTmpFile);


            try
            {
                ArrayList pendingStatHolList = new ArrayList();
                DataTable rawDataTable = HROne.Import.ExcelImport.parse(strTmpFile, string.Empty).Tables[TABLE_NAME];

                if (rawDataTable.Columns.Contains("Date") && rawDataTable.Columns.Contains("Description"))
                {

                    foreach (DataRow row in rawDataTable.Rows)
                    {
                        EStatutoryHoliday statHol = new EStatutoryHoliday();
                        statHol.StatutoryHolidayDate = HROne.Import.Parse.toDateTimeObject(row["Date"]);

                        if (statHol.StatutoryHolidayDate.Year.ToString().Trim().Equals(YearSelect.SelectedValue.Trim()))
                        {
                            if (!row.IsNull("Description"))
                                statHol.StatutoryHolidayDesc = (string)row["Description"];
                            pendingStatHolList.Add(statHol);
                        }
                    }
                }
                else
                {
                    errors.addError(HROne.Translation.PageErrorMessage.ERROR_INVALID_FILE);
                }

                if (pendingStatHolList.Count > 0)
                {
                    WebUtils.StartFunction(Session, FUNCTION_CODE);
                    DBFilter filter = sbinding.createFilter();
                    filter.add("StatutoryHolidayDate", true);
                    ArrayList holidayList = EStatutoryHoliday.db.select(dbConn, filter);
                    foreach (EStatutoryHoliday statHol in holidayList)
                    {
                        EStatutoryHoliday updatedHol = null;
                        foreach (EStatutoryHoliday pendingStatHol in pendingStatHolList)
                        {
                            if (pendingStatHol.StatutoryHolidayDate.Equals(statHol.StatutoryHolidayDate))
                            {
                                updatedHol = pendingStatHol;
                                if (!statHol.StatutoryHolidayDesc.Equals(pendingStatHol.StatutoryHolidayDesc))
                                {
                                    statHol.StatutoryHolidayDesc = pendingStatHol.StatutoryHolidayDesc;
                                    EStatutoryHoliday.db.update(dbConn, statHol);
                                }
                                break;
                            }
                        }
                        if (updatedHol != null)
                            pendingStatHolList.Remove(updatedHol);
                        else
                            EStatutoryHoliday.db.delete(dbConn, statHol);
                    }
                    foreach (EStatutoryHoliday insertStatHol in pendingStatHolList)
                        EStatutoryHoliday.db.insert(dbConn, insertStatHol);
                    WebUtils.EndFunction(dbConn);
                }
                else
                {
                    errors.addError(HROne.Translation.PageErrorMessage.ERROR_NO_RECORD_IMPORT);
                }
            }
            catch (Exception)
            {
                errors.addError(HROne.Translation.PageErrorMessage.ERROR_INVALID_FILE);
            }
            System.IO.File.Delete(strTmpFile);
        }
        else
            errors.addError(HROne.Translation.PageErrorMessage.ERROR_INVALID_FILE);

        Repeater.EditItemIndex = -1;
        view = loadData(info, db, Repeater);
        if (errors.isEmpty())
            errors.addError(HROne.Translation.PageMessage.IMPORT_SUCCESSFUL);
    }
}
