using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
using System.IO;
using System.Drawing;


public partial class RegistrationDetails : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack == false)
        {
            
            gridview();
        }
    }
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connection"].ConnectionString);

  
    private void gridview()
    {
        // con.Open();

        con.Open();
        SqlCommand cmd = new SqlCommand("select * from tblRegister", con);
        SqlDataAdapter ada = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        ada.Fill(ds, "tblRegister");
        GvRegistrationDetails.DataSource = ds.Tables["tblRegister"];
        GvRegistrationDetails.DataBind();
        con.Close();

    }


    protected void lnkbtnDelete_Command(object sender, CommandEventArgs e)
    {
        hf.Value = e.CommandArgument.ToString();
        con.Open();
        SqlCommand cmd = new SqlCommand("delete  from tblRegister where Id=" + hf.Value, con);
        cmd.ExecuteNonQuery();

        con.Close();
        gridview();
    }
    protected void btnClear_Click(object sender, EventArgs e)
    {
        
    }
    protected void GridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GvRegistrationDetails.PageIndex = e.NewPageIndex;
        SqlCommand cmd = new SqlCommand("select * from tblRegister", con);

        SqlDataAdapter ada = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        ada.Fill(ds, "tblRegister");
        GvRegistrationDetails.DataSource = ds.Tables["tblRegister"];
        GvRegistrationDetails.DataBind();
     
    }
}
