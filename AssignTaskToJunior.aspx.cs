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

public partial class AssignTaskToJunior : System.Web.UI.Page 
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack == false)
        {
            gridviewInProgress();
            loadcboJunior();
        }
    }
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connection"].ConnectionString);
        
    protected void btnSave_Click(object sender, EventArgs e)
    {

        con.Open();
        if (hfTaskId.Value == "")
        {       
       
            
        }
        else
        {

            SqlCommand cmd = new SqlCommand("update tbl_Task set JuniorEngId=@JuniorEngId  where id=" + hfTaskId.Value, con);
            cmd.Parameters.AddWithValue("@JuniorEngId", cboJuniorEng.SelectedValue.ToString());
            cmd.ExecuteNonQuery();
            con.Close();
            
            
            
            
        }
        
    }
    private void loadcboJunior()
    {
       // con.Open();

        con.Open();
        SqlCommand cmd = new SqlCommand("select * from tblRegister where Role='Junior Engineer'", con);
        SqlDataAdapter ada = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        ada.Fill(ds, "tbl_TaskElement");
        cboJuniorEng.DataSource = ds.Tables["tbl_TaskElement"];
        cboJuniorEng.DataTextField = "UserName";
        cboJuniorEng.DataValueField = "Id";
        cboJuniorEng.DataBind();
        con.Close();

    }

    private void gridviewInProgress()
    {
        // con.Open();

        con.Open();
        //SqlCommand cmd = new SqlCommand("select U.*,P.PriceType as PriceTypeNew,(U.Price*U.MemorySize) as TotalCost from tblUploadDetails U left join tbl_PriceDetails P on U.Price=P.Price where UserName='" + Session["Email"].ToString() + "'", con);
        SqlCommand cmd = new SqlCommand("select  * from tbl_Task where JuniorEngId is null", con);
        SqlDataAdapter ada = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        ada.Fill(ds, "tblUploadDetailsI");
        GridView1.DataSource = ds.Tables["tblUploadDetailsI"];
        GridView1.DataBind();
        con.Close();


    }


    protected void lbtnEditTaskElement_Command(object sender, CommandEventArgs e)
    {
        hfTaskId.Value = e.CommandArgument.ToString();
        lblTaskId.Text = e.CommandArgument.ToString();
    }
}
