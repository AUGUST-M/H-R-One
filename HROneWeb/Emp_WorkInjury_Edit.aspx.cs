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

public partial class Emp_WorkInjury_Edit : HROneWebPage
{
    private const string FUNCTION_CODE = "PER017";
    public Binding binding;
    public DBManager db = EEmpWorkInjuryRecord.db;
    public int CurID = -1;
    public int CurEmpID = -1;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!WebUtils.CheckAccess(Response, Session, FUNCTION_CODE, WebUtils.AccessLevel.ReadWrite))
            return;
        toolBar.FunctionCode = FUNCTION_CODE;

        binding = new Binding(dbConn, db);
        binding.add(EmpWorkInjuryRecordID);
        binding.add(EmpID);
        binding.add(new TextBoxBinder(db, EmpWorkInjuryRecordAccidentDate.TextBox, EmpWorkInjuryRecordAccidentDate.ID));
        binding.add(EmpWorkInjuryRecordInjuryNature);
        binding.add(EmpWorkInjuryRecordAccidentLocation);
        binding.add(EmpWorkInjuryRecordAccidentReason);
        binding.add(new TextBoxBinder(db, EmpWorkInjuryRecordReportedDate.TextBox, EmpWorkInjuryRecordReportedDate.ID));
        binding.add(new TextBoxBinder(db, EmpWorkInjuryRecordChequeReceivedDate.TextBox, EmpWorkInjuryRecordChequeReceivedDate.ID));
        binding.add(new TextBoxBinder(db, EmpWorkInjuryRecordSettleDate.TextBox, EmpWorkInjuryRecordSettleDate.ID));
        binding.add(EmpWorkInjuryRecordRemark);
        binding.init(Request, Session);

        if (!int.TryParse(DecryptedRequest["EmpWorkInjuryRecordID"], out CurID))
            CurID = -1; 

        if (!int.TryParse(DecryptedRequest["EmpID"], out CurEmpID))
            CurEmpID = -1; 


        EmpID.Value = CurEmpID.ToString();

        //  MUST applied Label Change before translation
        if (CurID > 0)
            ActionHeader.Text = "Edit";
        else
            ActionHeader.Text = "Add";

        HROne.Common.WebUtility.WebControlsLocalization(this, this.Controls);

        if (!Page.IsPostBack)
        {
            if (CurID > 0)
                loadObject();
            else
                toolBar.DeleteButton_Visible = false;
        }
    }
    protected bool loadObject() 
    {
        EEmpWorkInjuryRecord obj = new EEmpWorkInjuryRecord();
        bool isNew = WebFormWorkers.loadKeys(db, obj, DecryptedRequest);

        DBFilter filter = new DBFilter();
        filter.add(new Match("EmpID", CurEmpID));
        filter.add(WebUtils.AddRankFilter(Session, "EmpID", true));
        if (EEmpPersonalInfo.db.count(dbConn, filter) == 0)
            if (CurEmpID <= 0)
                return false;
            else
                HROne.Common.WebUtility.RedirectURLwithEncryptedQueryString(Response, Session, "~/AccessDeny.aspx");

        if (!db.select(dbConn, obj))
            if (CurID <= 0)
                return false;
            else
                HROne.Common.WebUtility.RedirectURLwithEncryptedQueryString(Response, Session, "~/AccessDeny.aspx");

        if (obj.EmpID != CurEmpID)
            if (CurID <= 0)
                return false;
            else
                HROne.Common.WebUtility.RedirectURLwithEncryptedQueryString(Response, Session, "~/AccessDeny.aspx");

	    Hashtable values=new Hashtable();
	    db.populate(obj,values);
	    binding.toControl(values);


        return true;
    }

    protected void Save_Click(object sender, EventArgs e)
    {
        EEmpWorkInjuryRecord c = new EEmpWorkInjuryRecord();

        Hashtable values = new Hashtable();
        binding.toValues(values);

        PageErrors errors = PageErrors.getErrors(db, Page.Master);
        errors.clear();


        db.validate(errors, values);

        if (!errors.isEmpty())
            return;


        db.parse(values, c);
        //if (!AppUtils.checkDuplicate(dbConn, CurEmpID, db, c, errors, "PermitTypeID"))
        //    return;

        WebUtils.StartFunction(Session, FUNCTION_CODE, c.EmpID);
        if (CurID < 0)
        {
//            Utils.MarkCreate(Session, c);

            db.insert(dbConn, c);
            CurID = c.EmpWorkInjuryRecordID;
//            url = Utils.BuildURL(-1, CurID);
        }
        else
        {
//            Utils.Mark(Session, c);
            db.update(dbConn, c);
        }
        WebUtils.EndFunction(dbConn);


        HROne.Common.WebUtility.RedirectURLwithEncryptedQueryString(Response, Session, "Emp_WorkInjury_View.aspx?EmpWorkInjuryRecordID=" + CurID + "&EmpID=" + c.EmpID);


    }
    protected void Delete_Click(object sender, EventArgs e)
    {

        EEmpWorkInjuryRecord c = new EEmpWorkInjuryRecord();
        c.EmpWorkInjuryRecordID = CurID;
        db.select(dbConn, c);
        WebUtils.StartFunction(Session, FUNCTION_CODE, c.EmpID);
        db.delete(dbConn, c);
        WebUtils.EndFunction(dbConn);
        HROne.Common.WebUtility.RedirectURLwithEncryptedQueryString(Response, Session, "EmpTab_WorkInjury_View.aspx?EmpID=" + EmpID.Value);
    }
    
    protected void Back_Click(object sender, EventArgs e)
    {
        if (CurID > 0)
            HROne.Common.WebUtility.RedirectURLwithEncryptedQueryString(Response, Session, "Emp_WorkInjury_View.aspx?EmpWorkInjuryRecordID=" + CurID + "&EmpID=" + EmpID.Value);
        else
            HROne.Common.WebUtility.RedirectURLwithEncryptedQueryString(Response, Session, "EmpTab_WorkInjury_View.aspx?EmpID=" + EmpID.Value);

    }
}
