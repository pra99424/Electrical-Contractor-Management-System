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

public partial class AddTask : System.Web.UI.Page 
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack == false)
        {
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

            SqlCommand cmd = new SqlCommand("insert into tbl_Task (Username,Category,LocationUrl,EndDate,Address,Status" +
                ") values (@Username,@Category,@LocationUrl,@EndDate,@Address,@Status)", con);
            cmd.Parameters.AddWithValue("@Username", Session["UserName"].ToString());
            cmd.Parameters.AddWithValue("@Category", cboCategory.Text);
            cmd.Parameters.AddWithValue("@LocationUrl", txtLocationUrl.Text);
            cmd.Parameters.AddWithValue("@EndDate", txtEndDate.Text);
            cmd.Parameters.AddWithValue("@Address", txtAddress.Text); 
            cmd.Parameters.AddWithValue("@Status", "Pending"); 
            cmd.ExecuteNonQuery();
                con.Close();
                gridview();
       
                
       
            
        }
        else
        {

            SqlCommand cmd = new SqlCommand("update tbl_Task set Username=@Username,Category=@Category,LocationUrl=@LocationUrl,EndDate=@EndDate,Address=@Address where id=" + hf.Value, con);
            cmd.Parameters.AddWithValue("@Username", Session["UserName"].ToString());
            cmd.Parameters.AddWithValue("@Category", cboCategory.Text);
            cmd.Parameters.AddWithValue("@LocationUrl", txtLocationUrl.Text);
            cmd.Parameters.AddWithValue("@EndDate", txtEndDate.Text);
            cmd.Parameters.AddWithValue("@Address", txtAddress.Text);
            //cmd.Parameters.AddWithValue("@Status", "Pending");
            cmd.ExecuteNonQuery();
            con.Close();
            gridview();
            
            
            
        }
        txtLocationUrl.Text = "";
    }
    private void gridview()
    {
       // con.Open();

        con.Open();
        SqlCommand cmd = new SqlCommand("select * from tbl_Task  where Username=@Username", con);
        cmd.Parameters.AddWithValue("@Username", Session["UserName"].ToString());
        SqlDataAdapter ada = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        ada.Fill(ds, "tbl_Task");
        GridView.DataSource = ds.Tables["tbl_Task"];
        GridView.DataBind();
        con.Close();

    }


    protected void lnkbtnEdit_Command(object sender, CommandEventArgs e)
    {
        hf.Value = e.CommandArgument.ToString();
        con.Open();
        SqlCommand cmd = new SqlCommand("select * from tbl_Task where Id=" + hf.Value.ToString(), con);

        SqlDataAdapter ada = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        ada.Fill(ds, "tbl_Task");
        
        if (ds.Tables[0].Rows.Count > 0)
        {   
            //txtVirtualMachineName.Text = ds.Tables["tbl_Task"].Rows[0]["Username"].ToString();
            cboCategory.Text = ds.Tables["tbl_Task"].Rows[0]["Category"].ToString();
            txtLocationUrl.Text = ds.Tables["tbl_Task"].Rows[0]["LocationUrl"].ToString();
            txtEndDate.Text = ds.Tables["tbl_Task"].Rows[0]["EndDate"].ToString();
            txtAddress.Text = ds.Tables["tbl_Task"].Rows[0]["Address"].ToString();
            //txtAddress.Text = ds.Tables["tbl_Task"].Rows[0]["Status"].ToString();
        }
        else
        {
            txtLocationUrl.Text = "";
            
        }
    }
    protected void lnkbtnDelete_Command(object sender, CommandEventArgs e)
    {
        hf.Value = e.CommandArgument.ToString();
        con.Open();
        SqlCommand cmd = new SqlCommand("delete  from tbl_Task where Id=" + hf.Value, con);
        cmd.ExecuteNonQuery();
        con.Close();
        gridview();
     
    }
    protected void btnClear_Click(object sender, EventArgs e)
    {
        txtLocationUrl.Text = "";
        txtEndDate.Text = "";
        
        txtAddress.Text = "";

    }
    protected void GridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView.PageIndex = e.NewPageIndex;
        SqlCommand cmd = new SqlCommand("select * from tbl_Task ", con);

        SqlDataAdapter ada = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        ada.Fill(ds, "tbl_Task");
        GridView.DataSource = ds.Tables["tbl_Task"];
        GridView.DataBind();
        
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
}
