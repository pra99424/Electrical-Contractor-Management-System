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

public partial class UserTaskElement : System.Web.UI.Page 
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack == false)
        {
            
            gridviewCompleted();
            
        }
    }
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connection"].ConnectionString);
        
    private void gridviewCompleted()
    {
        // con.Open();

        con.Open();
        //SqlCommand cmd = new SqlCommand("select U.*,P.PriceType as PriceTypeNew,(U.Price*U.MemorySize) as TotalCost from tblUploadDetails U left join tbl_PriceDetails P on U.Price=P.Price where UserName='" + Session["Email"].ToString() + "'", con);
        SqlCommand cmd = new SqlCommand("select * from tbl_TaskElement  TE left join tbl_Task T on TE.TaskId=T.Id  where T.Username=@Username", con);
        cmd.Parameters.AddWithValue("@Username", Session["UserName"].ToString());
        SqlDataAdapter ada = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        ada.Fill(ds, "tblUploadDetails");
        GridViewCompleted.DataSource = ds.Tables["tblUploadDetails"];
        GridViewCompleted.DataBind();
        con.Close();


    }

    protected void lnkbtnEdit_Command(object sender, CommandEventArgs e)
    {
        Response.Redirect("Pay.aspx");
    }
}
