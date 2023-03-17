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

public partial class AddTaskElement : System.Web.UI.Page 
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack == false)
        {
            gridviewInProgress();
            gridview();
        }
    }
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connection"].ConnectionString);
        
    protected void btnSave_Click(object sender, EventArgs e)
    {

        con.Open();
        if (hf.Value == "")
        {
           // con.Open();

            SqlCommand cmd = new SqlCommand("insert into tbl_TaskElement (Username,NameOfComponent,Quantity,Specification,TaskId" +
                ") values (@Username,@NameOfComponent,@Quantity,@Specification,@TaskId)", con);
            cmd.Parameters.AddWithValue("@Username", Session["UserName"].ToString());
            
            cmd.Parameters.AddWithValue("@NameOfComponent", txtNameOfComponent.Text);
            cmd.Parameters.AddWithValue("@Quantity", txtQuantity.Text);
            cmd.Parameters.AddWithValue("@Specification", txtSpecification.Text); 
            cmd.Parameters.AddWithValue("@TaskId", hfTaskId.Value); 
            cmd.ExecuteNonQuery();
                con.Close();
                gridview();
       
                
       
            
        }
        else
        {

            SqlCommand cmd = new SqlCommand("update tbl_TaskElement set Username=@Username,NameOfComponent=@NameOfComponent,Quantity=@Quantity,Specification=@Specification,Address=@Address where id=" + hf.Value, con);
            cmd.Parameters.AddWithValue("@Username", Session["UserName"].ToString());

            cmd.Parameters.AddWithValue("@NameOfComponent", txtNameOfComponent.Text);
            cmd.Parameters.AddWithValue("@Quantity", txtQuantity.Text);
            cmd.Parameters.AddWithValue("@Specification", txtSpecification.Text);
           // cmd.Parameters.AddWithValue("@TaskId", hfTaskId.Value);
            cmd.ExecuteNonQuery();
            con.Close();
            gridview();
            
            
            
        }
        txtNameOfComponent.Text = "";
    }
    private void gridview()
    {
       // con.Open();

        con.Open();
        SqlCommand cmd = new SqlCommand("select * from tbl_TaskElement ", con);
        SqlDataAdapter ada = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        ada.Fill(ds, "tbl_TaskElement");
        GridView.DataSource = ds.Tables["tbl_TaskElement"];
        GridView.DataBind();
        con.Close();

    }

    private void gridviewInProgress()
    {
        // con.Open();

        con.Open();
        //SqlCommand cmd = new SqlCommand("select U.*,P.PriceType as PriceTypeNew,(U.Price*U.MemorySize) as TotalCost from tblUploadDetails U left join tbl_PriceDetails P on U.Price=P.Price where UserName='" + Session["Email"].ToString() + "'", con);
        SqlCommand cmd = new SqlCommand("select  * from tbl_Task  where JuniorEngId=@JuniorEngId", con);
        cmd.Parameters.AddWithValue("@JuniorEngId", Session["UserId"].ToString());
        SqlDataAdapter ada = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        ada.Fill(ds, "tblUploadDetailsI");
        GridView1.DataSource = ds.Tables["tblUploadDetailsI"];
        GridView1.DataBind();
        con.Close();


    }

    protected void lnkbtnEdit_Command(object sender, CommandEventArgs e)
    {
        hf.Value = e.CommandArgument.ToString();
        con.Open();
        SqlCommand cmd = new SqlCommand("select * from tbl_TaskElement where Id=" + hf.Value.ToString(), con);

        SqlDataAdapter ada = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        ada.Fill(ds, "tbl_TaskElement");
        
        if (ds.Tables[0].Rows.Count > 0)
        {   
            
            
            txtNameOfComponent.Text = ds.Tables["tbl_TaskElement"].Rows[0]["LocationUrl"].ToString();
            txtQuantity.Text = ds.Tables["tbl_TaskElement"].Rows[0]["EndDate"].ToString();
            txtSpecification.Text = ds.Tables["tbl_TaskElement"].Rows[0]["Address"].ToString();
            
        }
        else
        {
            txtNameOfComponent.Text = "";
            
        }
    }
    protected void lnkbtnDelete_Command(object sender, CommandEventArgs e)
    {
        hf.Value = e.CommandArgument.ToString();
        con.Open();
        SqlCommand cmd = new SqlCommand("delete  from tbl_TaskElement where Id=" + hf.Value, con);
        cmd.ExecuteNonQuery();
        con.Close();
        gridview();
     
    }
    protected void btnClear_Click(object sender, EventArgs e)
    {
        txtNameOfComponent.Text = "";
        txtQuantity.Text = "";
        
        txtSpecification.Text = "";

    }
    protected void GridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView.PageIndex = e.NewPageIndex;
        gridview();
        
    }
    protected void GridView_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        
        if (e.Row.RowType.Equals(DataControlRowType.DataRow))
        {
            //foreach (TableCell cell in e.Row.Cells)
            //{
            //    if (cell.Text != "")
            //    {
            //        string lDecryptedData = cell.Text;
            //        cell.Text = lDecryptedData;
            //    }
            //}
        }
    }

    protected void lbtnEditTaskElement_Command(object sender, CommandEventArgs e)
    {
        hfTaskId.Value = e.CommandArgument.ToString();
        lblTaskId.Text = e.CommandArgument.ToString();
    }
}
