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

public partial class IncomeExpence : System.Web.UI.Page 
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack == false)
        {
            string lPType = Request["PType"].ToString();
            DropDownList1.Text = lPType;
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

            SqlCommand cmd = new SqlCommand("insert into tbl_IncomeExpence (PaymentType,Amount,Description,PaymentDate,UserId,UserName" +
                ") values (@PaymentType,@Amount,@Description,@PaymentDate,@UserId,@UserName)", con);
            cmd.Parameters.AddWithValue("@PaymentType", DropDownList1.Text);
            cmd.Parameters.AddWithValue("@Amount", txtAmount.Text);
            cmd.Parameters.AddWithValue("@Description", txtDescription.Text);
            cmd.Parameters.AddWithValue("@PaymentDate", txtPaymentDate.Text);
            cmd.Parameters.AddWithValue("@UserId", Session["UserId"].ToString());
            cmd.Parameters.AddWithValue("@UserName", Session["Name"].ToString());
            cmd.ExecuteNonQuery();
                con.Close();
                gridview();
       
                
       
            
        }
        else
        {
            
                SqlCommand cmd = new SqlCommand("update tbl_IncomeExpence set  PaymentType=@PaymentType,Amount=@Amount,Description=@Description,PaymentDate=@PaymentDate where id=" + hf.Value, con);
            cmd.Parameters.AddWithValue("@PaymentType", DropDownList1.Text);
            cmd.Parameters.AddWithValue("@Amount", txtAmount.Text);
            cmd.Parameters.AddWithValue("@Description", txtDescription.Text);
            cmd.Parameters.AddWithValue("@PaymentDate", txtPaymentDate.Text);
            
            cmd.ExecuteNonQuery();
                con.Close();
                gridview();
            
        }
        txtDescription.Text = "";
        txtAmount.Text = "";
        txtPaymentDate.Text = "";
    }
    private void gridview()
    {
       // con.Open();

        con.Open();
        SqlCommand cmd = new SqlCommand("select * from tbl_IncomeExpence where UserId=" + Session["UserId"].ToString() , con);
        SqlDataAdapter ada = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        ada.Fill(ds, "tbl_IncomeExpence");
        GridView.DataSource = ds.Tables["tbl_IncomeExpence"];
        GridView.DataBind();
        con.Close();

    }

    protected void lnkbtnEdit_Command(object sender, CommandEventArgs e)
    {
        hf.Value = e.CommandArgument.ToString();
        con.Open();
        SqlCommand cmd = new SqlCommand("select * from tbl_IncomeExpence where Id=" + hf.Value.ToString(), con);

        SqlDataAdapter ada = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        ada.Fill(ds, "tbl_IncomeExpence");
        
        if (ds.Tables[0].Rows.Count > 0)
        {
           // fuImage. = ds.Tables["tbl_IncomeExpence"].Rows[0]["ImagePath"].ToString();
            txtAmount.Text = ds.Tables["tbl_IncomeExpence"].Rows[0]["Amount"].ToString();
            txtDescription.Text = ds.Tables["tbl_IncomeExpence"].Rows[0]["Description"].ToString();
            txtPaymentDate.Text = ds.Tables["tbl_IncomeExpence"].Rows[0]["PaymentDate"].ToString();
            DropDownList1.Text = ds.Tables["tbl_IncomeExpence"].Rows[0]["PaymentType"].ToString();
        }
    }
    protected void lnkbtnDelete_Command(object sender, CommandEventArgs e)
    {
        hf.Value = e.CommandArgument.ToString();
        con.Open();
        SqlCommand cmd = new SqlCommand("delete  from tbl_IncomeExpence where Id=" + hf.Value, con);
        cmd.ExecuteNonQuery();
        con.Close();
        gridview();
     
    }
    protected void btnClear_Click(object sender, EventArgs e)
    {
        txtAmount.Text = "";
        txtDescription.Text = "";
        txtPaymentDate.Text = "";
    }
    protected void GridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView.PageIndex = e.NewPageIndex;
        gridview();
    }
    protected void GridView_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        
    }
}
