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

public partial class CloudCostEstimationAdmin : System.Web.UI.Page 
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
        //SqlCommand cmd = new SqlCommand("select U.*,P.PriceType as PriceTypeNew,(U.Price*U.MemorySize) as TotalCost from tblUploadDetails U left join tbl_PriceDetails P on U.Price=P.Price where UserName='" + Session["Email"].ToString() + "'", con);
        SqlCommand cmd = new SqlCommand("select U.UserName,P.PriceType,U.MemorySize,U.Price,(U.Price*U.MemorySize)/1024000 as TotalCost from tblUploadDetails U left join tbl_PriceDetails P on U.Price=P.Price  group by U.UserName,P.PriceType,U.MemorySize,U.Price", con);
        SqlDataAdapter ada = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        ada.Fill(ds, "tblUploadDetails");
        GridView.DataSource = ds.Tables["tblUploadDetails"];
        GridView.DataBind();
        con.Close();

    }
    protected void GridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView.PageIndex = e.NewPageIndex;
        SqlCommand cmd = new SqlCommand("select U.UserName,P.PriceType,U.MemorySize,U.Price,(U.Price*U.MemorySize) as TotalCost from tblUploadDetails U left join tbl_PriceDetails P on U.Price=P.Price  group by U.UserName,P.PriceType,U.MemorySize,U.Price", con);

        SqlDataAdapter ada = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        ada.Fill(ds, "tblUploadDetails");
        GridView.DataSource = ds.Tables["tblUploadDetails"];
        GridView.DataBind();
        GridView.DataBind();
    }
    protected void GridView_RowDataBound(object sender, GridViewRowEventArgs e)
    {

        //AppModule o = new AppModule();
        //if (e.Row.RowType.Equals(DataControlRowType.DataRow))
        //{
        //    //BoundField field = (BoundField)((DataControlFieldCell)e.Row.Cells[0]).ContainingField;
        //    //if (field.DataField.ToString() == "Categories" || field.DataField.ToString() == "Description" || field.DataField.ToString() == "Tags")
        //    //{
        //    //foreach (TableCell cell in e.Row.Cells)
        //    //{ 
        //    TableCell cell1 = e.Row.Cells[1];
        //    if (cell1.Text != "")
        //    {
        //        string lDecryptedData = o.DecryptText(cell1.Text, "text");
        //        cell1.Text = lDecryptedData;
        //    }
        //    TableCell cell2 = e.Row.Cells[2];
        //    if (cell2.Text != "")
        //    {
        //        string lDecryptedData = o.DecryptText(cell2.Text, "text");
        //        cell2.Text = lDecryptedData;
        //    }
        //    TableCell cell3 = e.Row.Cells[3];
        //    if (cell3.Text != "")
        //    {
        //        string lDecryptedData = o.DecryptText(cell3.Text, "text");
        //        cell3.Text = lDecryptedData;
        //    }
        //    //}
        //    //}
        //}
    }
}
