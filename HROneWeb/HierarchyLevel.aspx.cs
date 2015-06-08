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
using HROne.Translation;
using HROne.Lib.Entities;

public partial class HierarchyLevel : HROneWebPage
{
    private const string FUNCTION_CODE = "SYS002";

    protected DBManager db = EHierarchyLevel.db;
    protected SearchBinding sbinding;
    protected ListInfo info;
    protected DataView view;
    public Binding binding;
    public Binding ebinding;
    public EHierarchyLevel obj;
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


        binding = new Binding(dbConn, db);
        binding.add(HLevelCode);
        binding.add(HLevelDesc);
        binding.add(HLevelSeqNo);
        binding.init(Request, Session);

        sbinding = new SearchBinding(dbConn, db);
        sbinding.init(DecryptedRequest, null);

        info = ListFooter.ListInfo;

        HROne.Common.WebUtility.WebControlsLocalization(this, Page.Controls);
    }
    protected void Page_PreRender(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            view = loadData(info, db, Repeater);
        }
    }
    public DataView loadData(ListInfo info, DBManager db, DataList repeater)
    {
        DBFilter filter = sbinding.createFilter();

        if (info != null && info.orderby != null && !info.orderby.Equals(""))
            filter.add(info.orderby, info.order);

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
    protected void Search_Click(object sender, EventArgs e)
    {
        view = loadData(info, db, Repeater);

    }
    protected void Reset_Click(object sender, EventArgs e)
    {
        sbinding.clear();
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

        Repeater.EditItemIndex = -1;
        view = loadData(info, db, Repeater);

    }
    protected void Add_Click(object sender, EventArgs e)
    {
        Repeater.EditItemIndex = -1;
        EHierarchyLevel c = new EHierarchyLevel();

        Hashtable values = new Hashtable();
        binding.toValues(values);

        PageErrors errors = PageErrors.getErrors(db, Page.Master);
        errors.clear();


        db.validate(errors, values);

        if (!errors.isEmpty())
            return;


        db.parse(values, c);

        if (!AppUtils.checkDuplicate(dbConn, db, c, errors, "HLevelCode"))
            return;
        
        WebUtils.StartFunction(Session, FUNCTION_CODE);
        db.insert(dbConn, c);
        WebUtils.EndFunction(dbConn);
        AppUtils.repairHierarchyInformation(dbConn);
        binding.toControl(new Hashtable());
        view = loadData(info, db, Repeater);
    }

    protected void Repeater_ItemDataBound(object sender, DataListItemEventArgs e)
    {
        HROne.Common.WebUtility.WebControlsLocalization(Session, e.Item.Controls);

        e.Item.FindControl("DeleteItem").Visible = IsAllowEdit;
        if (e.Item.ItemIndex == Repeater.EditItemIndex)
        {
            ebinding = new Binding(dbConn, db);
            ebinding.add((HtmlInputHidden)e.Item.FindControl("HLevelID"));
            ebinding.add((TextBox)e.Item.FindControl("HLevelCode"));
            ebinding.add((TextBox)e.Item.FindControl("HLevelDesc"));
            ebinding.add((TextBox)e.Item.FindControl("HLevelSeqNo"));
            ebinding.init(Request, Session);


            EHierarchyLevel obj = new EHierarchyLevel();
            db.toObject(((DataRowView)e.Item.DataItem).Row, obj);
            Hashtable values = new Hashtable();
            db.populate(obj, values);
            ebinding.toControl(values);
        }
        else
        {
            HtmlInputHidden h = (HtmlInputHidden)e.Item.FindControl("HLevelID");
            h.Value=((DataRowView)e.Item.DataItem)["HLevelID"].ToString();
            e.Item.FindControl("Edit").Visible = IsAllowEdit;
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
            ebinding.add((HtmlInputHidden)e.Item.FindControl("HLevelID"));
            ebinding.add((TextBox)e.Item.FindControl("HLevelCode"));
            ebinding.add((TextBox)e.Item.FindControl("HLevelDesc"));
            ebinding.add((TextBox)e.Item.FindControl("HLevelSeqNo"));
            ebinding.init(Request, Session);


            EHierarchyLevel obj = new EHierarchyLevel();
            Hashtable values = new Hashtable();

            PageErrors errors = PageErrors.getErrors(db, Page.Master);
            errors.clear();


            ebinding.toValues(values);
            db.validate(errors, values);

            if (!errors.isEmpty())
                return;

            db.parse(values, obj);
            if (!AppUtils.checkDuplicate(dbConn, db, obj, errors, "HLevelCode"))
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
        PageErrors errors = PageErrors.getErrors(db, Page.Master);
        errors.clear();

        ArrayList list = new ArrayList();
        foreach(DataListItem item in Repeater.Items) 
        {
            CheckBox c=(CheckBox)item.FindControl("DeleteItem");
            HtmlInputHidden h = (HtmlInputHidden)item.FindControl("HLevelID");
            if (c.Checked)
            {
                EHierarchyLevel obj = new EHierarchyLevel();
                obj.HLevelID = Int32.Parse(h.Value);
                list.Add(obj);
            }
        }
        foreach (EHierarchyLevel obj in list)
        {
            EHierarchyLevel.db.select(dbConn, obj);
            DBFilter hierarchyLevelFilter = new DBFilter();
            hierarchyLevelFilter.add(new Match("HLevelID", obj.HLevelID));


            DBFilter hierarchyElementFilter = new DBFilter();
            hierarchyElementFilter.add(new IN("HElementID", "Select HElementID from " + EHierarchyElement.db.dbclass.tableName, hierarchyLevelFilter));
            IN inTerms = new IN("EmpPosID", "Select EmpPosID From " + EEmpHierarchy.db.dbclass.tableName, hierarchyElementFilter);

            DBFilter empPosFilter = new DBFilter();
            empPosFilter.add(inTerms);
            empPosFilter.add("empid", true);
            ArrayList empPosList = EEmpPositionInfo.db.select(dbConn, empPosFilter);
            if (empPosList.Count > 0)
            {
                errors.addError(string.Format(HROne.Translation.PageErrorMessage.ERROR_CODE_USED_BY_EMPLOYEE, new string[] { HROne.Common.WebUtility.GetLocalizedString("Code"), obj.HLevelCode}));
                foreach (EEmpPositionInfo empPos in empPosList)
                {
                    EEmpPersonalInfo empInfo = new EEmpPersonalInfo();
                    empInfo.EmpID = empPos.EmpID;
                    if (EEmpPersonalInfo.db.select(dbConn, empInfo))
                        errors.addError("- " + empInfo.EmpNo + ", " + empInfo.EmpEngFullName);
                    else
                        EEmpPositionInfo.db.delete(dbConn, empPos);

                }
                errors.addError(HROne.Translation.PageErrorMessage.ERROR_ACTION_ABORT);
            }
            else
            {
                EHierarchyElement.db.delete(dbConn, hierarchyElementFilter);
                EEmpHierarchy.db.delete(dbConn, hierarchyLevelFilter);
                WebUtils.StartFunction(Session, FUNCTION_CODE);
                db.delete(dbConn, obj);
                WebUtils.EndFunction(dbConn);                
            }
        }
        view = loadData(info, db, Repeater);

    }
}
