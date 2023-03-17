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

public partial class BalanceAmount : System.Web.UI.Page 
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack == false)
        {
            //string lPType = Request["PType"].ToString();
            //DropDownList1.Text = lPType;
            gridview();
            loadBalanceAmount();
        }
    }
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connection"].ConnectionString);
        
    //protected void btnSave_Click(object sender, EventArgs e)
    //{


    //    con.Open();
    //    if (hf.Value == "")
    //    {
    //       // con.Open();

    //        SqlCommand cmd = new SqlCommand("insert into tbl_IncomeExpence (PaymentType,Amount,Description,PaymentDate,UserId,UserName" +
    //            ") values (@PaymentType,@Amount,@Description,@PaymentDate,@UserId,@UserName)", con);
    //        cmd.Parameters.AddWithValue("@PaymentType", DropDownList1.Text);
    //        cmd.Parameters.AddWithValue("@Amount", txtAmount.Text);
    //        cmd.Parameters.AddWithValue("@Description", txtDescription.Text);
    //        cmd.Parameters.AddWithValue("@PaymentDate", txtPaymentDate.Text);
    //        cmd.Parameters.AddWithValue("@UserId", Session["UserId"].ToString());
    //        cmd.Parameters.AddWithValue("@UserName", Session["Name"].ToString());
    //        cmd.ExecuteNonQuery();
    //            con.Close();
    //            gridview();
       
                
       
            
    //    }
    //    else
    //    {
            
    //            SqlCommand cmd = new SqlCommand("update tbl_IncomeExpence set  PaymentType=@PaymentType,Amount=@Amount,Description=@Description,PaymentDate=@PaymentDate where id=" + hf.Value, con);
    //        cmd.Parameters.AddWithValue("@PaymentType", DropDownList1.Text);
    //        cmd.Parameters.AddWithValue("@Amount", txtAmount.Text);
    //        cmd.Parameters.AddWithValue("@Description", txtDescription.Text);
    //        cmd.Parameters.AddWithValue("@PaymentDate", txtPaymentDate.Text);
            
    //        cmd.ExecuteNonQuery();
    //            con.Close();
    //            gridview();
            
    //    }
    //    txtDescription.Text = "";
    //    txtAmount.Text = "";
    //    txtPaymentDate.Text = "";
    //}
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
    private void loadBalanceAmount()
    {
        // con.Open();

        con.Open();
        SqlCommand cmd = new SqlCommand("select sum(TotalIncome) as BalanceAmount from (select sum(Amount) as TotalIncome from tbl_IncomeExpence where PaymentType='Income' and  UserId=" + Session["UserId"].ToString() + " union all select -sum(Amount) as TotalIncome from tbl_IncomeExpence where PaymentType='Expence' and UserId=" + Session["UserId"].ToString() + ")a", con);
        SqlDataAdapter ada = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        ada.Fill(ds, "BalanceAmount");
        con.Close();
        if (ds.Tables["BalanceAmount"].Rows.Count > 0)
        {
            lblBalanceAmount.Text = ds.Tables["BalanceAmount"].Rows[0][0].ToString();
        }
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
