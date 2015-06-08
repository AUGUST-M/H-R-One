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

public partial class SkillLevel : HROneWebPage
{
    private const string FUNCTION_CODE = "SYS015";
    
    protected DBManager db = ESkillLevel.db;
    protected SearchBinding sbinding;
    protected ListInfo info;
    protected DataView view;
    public Binding binding;
    public Binding ebinding;
    public ESkillLevel obj;
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
        binding.add(SkillLevelCode);
        binding.add(SkillLevelDesc);
        binding.init(Request, Session);

        sbinding = new SearchBinding(dbConn, db);
        sbinding.init(DecryptedRequest, null);

        info=ListFooter.ListInfo;

        HROne.Common.WebUtility.WebControlsLocalization(this, this.Controls);
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
        ESkillLevel c = new ESkillLevel();

        Hashtable values = new Hashtable();
        binding.toValues(values);

        PageErrors errors = PageErrors.getErrors(db, Page.Master);
        errors.clear();


        db.validate(errors, values);

        if (!errors.isEmpty())
            return;


        db.parse(values, c);
        if (!AppUtils.checkDuplicate(dbConn, db, c, errors, "SkillLevelCode"))
            return;

        WebUtils.StartFunction(Session, FUNCTION_CODE);
        db.insert(dbConn, c);
        WebUtils.EndFunction(dbConn);

        SkillLevelCode.Text = string.Empty;
        SkillLevelDesc.Text = string.Empty;

        view = loadData(info, db, Repeater);
    }

    protected void Repeater_ItemDataBound(object sender, DataListItemEventArgs e)
    {
        e.Item.FindControl("DeleteItem").Visible = IsAllowEdit;
        if (e.Item.ItemIndex == Repeater.EditItemIndex)
        {
            ebinding = new Binding(dbConn, db);
            ebinding.add((HtmlInputHidden)e.Item.FindControl("SkillLevelID"));
            ebinding.add((TextBox)e.Item.FindControl("SkillLevelCode"));
            ebinding.add((TextBox)e.Item.FindControl("SkillLevelDesc"));
            ebinding.init(Request, Session);


            ESkillLevel obj = new ESkillLevel();
            db.toObject(((DataRowView)e.Item.DataItem).Row, obj);
            Hashtable values = new Hashtable();
            db.populate(obj, values);
            ebinding.toControl(values);
        }
        else
        {
            e.Item.FindControl("Edit").Visible = IsAllowEdit;
            HtmlInputHidden h = (HtmlInputHidden)e.Item.FindControl("SkillLevelID");
            h.Value=((DataRowView)e.Item.DataItem)["SkillLevelID"].ToString();
        }
        HROne.Common.WebUtility.WebControlsLocalization(Session, e.Item.Controls);
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
            ebinding.add((HtmlInputHidden)e.Item.FindControl("SkillLevelID"));
            ebinding.add((TextBox)e.Item.FindControl("SkillLevelCode"));
            ebinding.add((TextBox)e.Item.FindControl("SkillLevelDesc"));
            ebinding.init(Request, Session);


            ESkillLevel obj = new ESkillLevel();
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
            if (!AppUtils.checkDuplicate(dbConn, db, obj, errors, "SkillLevelCode"))
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
            HtmlInputHidden h = (HtmlInputHidden)item.FindControl("SkillLevelID");
            if (c.Checked)
            {
                ESkillLevel obj = new ESkillLevel();
                obj.SkillLevelID = Int32.Parse(h.Value);
                list.Add(obj);
            }
        }
        foreach (ESkillLevel obj in list)
        {
            db.select(dbConn, obj);
            DBFilter empSkillFilter = new DBFilter();
            empSkillFilter.add(new Match("SkillLevelID", obj.SkillLevelID));
            empSkillFilter.add("empid", true);
            ArrayList empSkillList = EEmpSkill.db.select(dbConn, empSkillFilter);
            if (empSkillList.Count > 0)
            {
                errors.addError(string.Format(HROne.Translation.PageErrorMessage.ERROR_CODE_USED_BY_EMPLOYEE, new string[] { HROne.Common.WebUtility.GetLocalizedString("Skill Level Code"), obj.SkillLevelCode }));
                foreach (EEmpSkill empSkill in empSkillList)
                {
                    EEmpPersonalInfo empInfo = new EEmpPersonalInfo();
                    empInfo.EmpID = empSkill.EmpID;
                    if (EEmpPersonalInfo.db.select(dbConn, empInfo))
                        errors.addError("- " + empInfo.EmpNo + ", " + empInfo.EmpEngFullName);
                    else
                        EEmpQualification.db.delete(dbConn, empSkill);

                }
                errors.addError(HROne.Translation.PageErrorMessage.ERROR_ACTION_ABORT);
                view = loadData(info, db, Repeater);
                return;

            }
            else
            {

                WebUtils.StartFunction(Session, FUNCTION_CODE);
                db.delete(dbConn, obj);
                WebUtils.EndFunction(dbConn);
            }
        }
        view = loadData(info, db, Repeater);
    }
}