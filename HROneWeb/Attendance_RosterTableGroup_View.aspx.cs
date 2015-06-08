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
using HROne.Translation;

public partial class Attendance_RosterTableGroup_View : HROneWebPage
{
    private const string FUNCTION_CODE = "ATT014";
    
    public Binding binding;
    public DBManager db = ERosterTableGroup.db;
    public ERosterTableGroup obj;

    public int CurID = -1;

    

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!WebUtils.CheckAccess(Response, Session, FUNCTION_CODE, WebUtils.AccessLevel.Read))
            return;
        toolBar.FunctionCode = FUNCTION_CODE;

        

        binding = new Binding(dbConn, db);
        binding.add(RosterTableGroupID);
        binding.add(RosterTableGroupCode);
        binding.add(RosterTableGroupDesc);
        binding.add(new BlankZeroLabelVLBinder(db, RosterClientID, ERosterClient.VLRosterClient));
        binding.add(new BlankZeroLabelVLBinder(db, RosterClientSiteID, ERosterClientSite.VLRosterClientSite));


        binding.init(Request, Session);

        HROne.Common.WebUtility.WebControlsLocalization(this, this.Controls);

        if (!int.TryParse(DecryptedRequest["RosterTableGroupID"], out CurID))
            CurID = -1;

    }
    protected void Page_PreRender(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {


            if (CurID > 0)
            {
                loadObject();

            }
            else
                toolBar.DeleteButton_Visible = false;
        }
    }

    protected bool loadObject() 
    {
	    obj=new ERosterTableGroup();
	    bool isNew=WebFormWorkers.loadKeys(db, obj, DecryptedRequest);
	    if(!db.select(dbConn, obj))
		    return false;

        
        Hashtable values = new Hashtable();
	    db.populate(obj,values);
	    binding.toControl(values);


        return true;
    }

    protected void Delete_ClickTop(object sender, EventArgs e)
    {
        PageErrors errors = PageErrors.getErrors(db, Page.Master);
        errors.clear();

        ERosterTableGroup o = new ERosterTableGroup();
        o.RosterTableGroupID = CurID;

        if (ERosterTableGroup.db.select(dbConn, o))
        {
            DBFilter empPosFilter = new DBFilter();
            empPosFilter.add(new Match("RosterTableGroupID", o.RosterTableGroupID));
            empPosFilter.add("EmpID", true);
            ArrayList empPosList = EEmpPositionInfo.db.select(dbConn, empPosFilter);
            if (empPosList.Count > 0)
            {
                errors.addError(string.Format(HROne.Translation.PageErrorMessage.ERROR_CODE_USED_BY_EMPLOYEE, new string[] { HROne.Common.WebUtility.GetLocalizedString("Roster Table Group"), o.RosterTableGroupCode }));
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
                return;
            }
            else
            {
                WebUtils.StartFunction(Session, FUNCTION_CODE);
                db.delete(dbConn, o);
                WebUtils.EndFunction(dbConn);
            }
        }
        HROne.Common.WebUtility.RedirectURLwithEncryptedQueryString(Response, Session, "Attendance_RosterTableGroup_List.aspx");
    }
    protected void Edit_Click(object sender, EventArgs e)
    {
        HROne.Common.WebUtility.RedirectURLwithEncryptedQueryString(Response, Session, "Attendance_RosterTableGroup_Edit.aspx?RosterTableGroupID=" + CurID);
    }

    protected void Back_Click(object sender, EventArgs e)
    {
        HROne.Common.WebUtility.RedirectURLwithEncryptedQueryString(Response, Session, "Attendance_RosterTableGroup_List.aspx");
    }
}
