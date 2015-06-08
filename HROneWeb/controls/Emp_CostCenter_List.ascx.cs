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

public partial class Emp_CostCenter_List : HROneWebControl
{
    public int CurID = -1;
    private const string FUNCTION_CODE = "PER012";
    protected SearchBinding sbinding;
    public DBManager sdb = EEmpCostCenter.db;
    protected ListInfo info;
    protected DataView view;
    

    protected void Page_Load(object sender, EventArgs e)
    {
       
        if (!WebUtils.CheckAccess(Response, Session, FUNCTION_CODE, WebUtils.AccessLevel.Read))
            return;
        toolBar.FunctionCode = FUNCTION_CODE;
        SelectAllPanel.Visible = toolBar.DeleteButton_Visible;
        
        PreRender += new EventHandler(Emp_CostCenter_List_PreRender);


        sbinding = new SearchBinding(dbConn, sdb);
        //sbinding.initValues("CostCenterID", null, ECostCenter.VLCostCenter, HROne.Common.WebUtility.GetSessionCultureInfo(Session));
        sbinding.init(DecryptedRequest, null);


        if (!int.TryParse(DecryptedRequest["EmpID"], out CurID))
            CurID = -1;

        EmpID.Value = CurID.ToString();

        info = ListFooter.ListInfo;
        if (!IsPostBack)
        {
            ListFooter.ListOrderBy = "EmpCostCenterEffFr";
            ListFooter.ListOrder = false;
        }
    }

    void Emp_CostCenter_List_PreRender(object sender, EventArgs e)
    {
        if (view == null)
        {
            view = loadData(info, sdb, Repeater);
        }
    }

    public DataView loadData(ListInfo info, DBManager db, Repeater repeater)
    {
        DBFilter filter = new DBFilter();
        filter.add(new Match("EmpID", this.CurID));

        if (info != null && info.orderby != null && !info.orderby.Equals(""))
            filter.add(info.orderby, info.order);

        string select = "c.*";
        string from = "from [" + sdb.dbclass.tableName + "] c ";

        DataTable table = WebUtils.GetDataTableFromSelectQueryWithFilter(dbConn, select, from, filter, info);

        view = new DataView(table);
        ListFooter.Refresh();

        if (repeater != null)
        {
            repeater.DataSource = view;
            repeater.DataBind();
        }

        return view;
    }

    protected void FirstPage_Click(object sender, EventArgs e)
    {
        view = loadData(info, sdb, Repeater);

    }
    protected void PrevPage_Click(object sender, EventArgs e)
    {
        view = loadData(info, sdb, Repeater);

    }
    protected void NextPage_Click(object sender, EventArgs e)
    {
        view = loadData(info, sdb, Repeater);

    }
    protected void LastPage_Click(object sender, EventArgs e)
    {
        view = loadData(info, sdb, Repeater);

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

        view = loadData(info, sdb, Repeater);

    }
    protected void Repeater_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        DataRowView row = (DataRowView)e.Item.DataItem;
        CheckBox cb = (CheckBox)e.Item.FindControl("ItemSelect");
        WebFormUtils.LoadKeys(sdb, row, cb);
        e.Item.FindControl("ItemSelect").Visible = toolBar.DeleteButton_Visible;
    }

    protected void Delete_Click(object sender, EventArgs e)
    {
        ArrayList list = new ArrayList();
        foreach (RepeaterItem i in Repeater.Items)
        {
            CheckBox cb = (CheckBox)i.FindControl("ItemSelect");
            if (cb.Checked)
            {
                EEmpCostCenter o = new EEmpCostCenter();
                WebFormUtils.GetKeys(sdb, o, cb);
                list.Add(o);
            }

        }
        if (list.Count > 0)
        {
            WebUtils.StartFunction(Session, FUNCTION_CODE, CurID);
            foreach (EEmpCostCenter o in list)
            {
                if (sdb.select(dbConn, o))
                {
                    sdb.delete(dbConn, o);
                    DBFilter costCenterDetailFilter = new DBFilter();
                    costCenterDetailFilter.add(new Match("EmpCostCenterID", o.EmpCostCenterID));
                    ArrayList empCostCenterDetailList = EEmpCostCenterDetail.db.select(dbConn, costCenterDetailFilter);
                    foreach (EEmpCostCenterDetail empCostCenterDetail in empCostCenterDetailList)
                        EEmpCostCenterDetail.db.delete(dbConn, empCostCenterDetail);
                }
            }
            WebUtils.EndFunction(dbConn);
        }
        loadData(info, sdb, Repeater);
    }
    public void New_Click(object sender, EventArgs e)
    {
        HROne.Common.WebUtility.RedirectURLwithEncryptedQueryString(Response, Session, "Emp_CostCenter_Edit.aspx?EmpID="+ EmpID.Value);
    }
}
