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


public partial class VirtualMachineList : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connection"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack == false)
        {
            gridview();
        }
        
    }
    private void gridview()
    {
        // con.Open();

        con.Open();
        SqlCommand cmd = new SqlCommand("select * from tbl_PriceDetails ", con);
        SqlDataAdapter ada = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        ada.Fill(ds, "tbl_PriceDetails");
        DataList1.DataSource = ds.Tables["tbl_PriceDetails"];
        DataList1.DataBind();
        con.Close();

    }

    protected void ImageButton1_Command(object sender, CommandEventArgs e)
    {
        Response.Redirect("UserFileUpload.aspx?VMName="+e.CommandArgument.ToString());
    }
}