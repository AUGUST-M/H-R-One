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
using HROne.Lib.Entities;
using HROne.Translation;

public partial class Emp_Beneficiaries_View : HROneWebPage
{
    private const string FUNCTION_CODE = "PER021";

    public Binding binding;
    public DBManager db = EEmpBeneficiaries.db;
    public EEmpBeneficiaries obj;
    public int CurID = -1;
    public int CurEmpID = -1;
    

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!WebUtils.CheckAccess(Response, Session, FUNCTION_CODE, WebUtils.AccessLevel.Read))
            return;
        toolBar.FunctionCode = FUNCTION_CODE;

        binding = new Binding(dbConn, db);
        binding.add(EmpBeneficiariesID);
        binding.add(EmpID);
        binding.add(EmpBeneficiariesName);
        binding.add(EmpBeneficiariesShare);
        binding.add(EmpBeneficiariesHKID);
        binding.add(EmpBeneficiariesRelation);
        binding.add(EmpBeneficiariesAddress);
        binding.add(EmpBeneficiariesDistrict);
        // Start 0000139, Miranda, 2014-12-20
        binding.add(new LabelVLBinder(db, EmpBeneficiariesArea, Values.VLArea));
        // End 0000139, Miranda, 2014-12-20
        binding.add(EmpBeneficiariesCountry);
        binding.init(Request, Session);

        if (!int.TryParse(DecryptedRequest["EmpBeneficiariesID"], out CurID))
            CurID = -1; 

        if (!int.TryParse(DecryptedRequest["EmpID"], out CurEmpID))
            CurEmpID = -1; 

        EmpID.Value = CurEmpID.ToString();

        HROne.Common.WebUtility.WebControlsLocalization(this, this.Controls);

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
	    obj=new EEmpBeneficiaries();
	    bool isNew=WebFormWorkers.loadKeys(db, obj, DecryptedRequest);

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

    protected void Delete_Click(object sender, EventArgs e)
    {
        PageErrors errors = PageErrors.getErrors(db, Page.Master);
        errors.clear();

        EEmpBeneficiaries obj = new EEmpBeneficiaries();
        obj.EmpBeneficiariesID = CurID;

        if (EEmpBeneficiaries.db.select(dbConn, obj))
        {
            WebUtils.StartFunction(Session, FUNCTION_CODE, obj.EmpID);
            db.delete(dbConn, obj);
            WebUtils.EndFunction(dbConn);
        }        
        HROne.Common.WebUtility.RedirectURLwithEncryptedQueryString(Response, Session, "EmpTab_Beneficiaries_View.aspx?EmpID=" + EmpID.Value);
    }

    protected void Edit_Click(object sender, EventArgs e)
    {
        HROne.Common.WebUtility.RedirectURLwithEncryptedQueryString(Response, Session, "Emp_Beneficiaries_Edit.aspx?EmpBeneficiariesID=" + EmpBeneficiariesID.Value + "&EmpID=" + EmpID.Value);
    }

    protected void Back_Click(object sender, EventArgs e)
    {
        HROne.Common.WebUtility.RedirectURLwithEncryptedQueryString(Response, Session, "EmpTab_Beneficiaries_View.aspx?EmpID=" + EmpID.Value);
        
    }
}
