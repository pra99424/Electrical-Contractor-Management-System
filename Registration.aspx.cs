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


public partial class Registration : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack == false)
        {
            MultiView1.ActiveViewIndex = 1;
            gridview();
        }
    }
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connection"].ConnectionString);

    protected void btnSave_Click(object sender, EventArgs e)
    {
        String path = Server.MapPath(".//images");
        if (!Directory.Exists(path))
        {
            Directory.CreateDirectory(path);
        }
        String Imagefilename = fuImage.FileName;
        if (fuImage.HasFile)
        {
            fuImage.PostedFile.SaveAs
                (path + "/" + Imagefilename);
        }
        string imagefullpath = "~/images/" + Imagefilename;

       
        con.Open();
        if (hf.Value == "")
        {
         //   string lpass = Guid.NewGuid().ToString().Substring(0, 4);

            SqlCommand cmd = new SqlCommand("insert into tblRegister (Role,FirstName,MiddleName,LastName,Initial,Gender,EmailId," +
                        "Address,ImagePath,Mobileno,UserName,Password,Company) values (@Role,@FirstName,@MiddleName,@LastName,@Initial,@Gender," +
                        "@EmailId,@Address,@ImagePath,@Mobileno,@UserName,@Password,@Company)", con);
            cmd.Parameters.AddWithValue("@Role", cboRole.Text);
            cmd.Parameters.AddWithValue("@FirstName", txtName.Text);
            cmd.Parameters.AddWithValue("@MiddleName", txtMiddleName.Text);
            cmd.Parameters.AddWithValue("@LastName", txtLastName.Text);
            cmd.Parameters.AddWithValue("@Initial", cboInitial.Text);
            cmd.Parameters.AddWithValue("@Gender", rbtnMale.Checked?"Male":"Female");
            cmd.Parameters.AddWithValue("@EmailId", txtEmialId.Text);
            cmd.Parameters.AddWithValue("@Address", txtAddress.Text);
            cmd.Parameters.AddWithValue("@ImagePath", imagefullpath);
            cmd.Parameters.AddWithValue("@Mobileno", txtMobileNo.Text);
            cmd.Parameters.AddWithValue("@UserName", txtUserName.Text);
            cmd.Parameters.AddWithValue("@Password", txtPassword.Text);
            cmd.Parameters.AddWithValue("@Company", txtCompanyName.Text);


            cmd.ExecuteNonQuery();
            con.Close();
            gridview();

        }
        else
        {
            //con.Open();
            if (fuImage.HasFile)
            {
                SqlCommand cmd = new SqlCommand("update tblRegister set FirstName=@FirstName,MiddleName=@MiddleName,LastName=@LastName,Initial=@Initial" +
                    ",Gender=@Gender,EmailId=@EmailId,Address=@Address,ImagePath=@ImagePath," +
                    "Mobileno=@Mobileno,UserName=@UserName,Company=@Company " +
                    " where id=" + hf.Value, con);
                cmd.Parameters.AddWithValue("@FirstName", txtName.Text);

                cmd.Parameters.AddWithValue("@MiddleName", txtMiddleName.Text);
                cmd.Parameters.AddWithValue("@LastName", txtLastName.Text);
                cmd.Parameters.AddWithValue("@Initial", cboInitial.Text);
                cmd.Parameters.AddWithValue("@Gender", rbtnMale.Checked ? "Male" : "Female");
                cmd.Parameters.AddWithValue("@EmailId", txtEmialId.Text);
                cmd.Parameters.AddWithValue("@Address", txtAddress.Text);
                cmd.Parameters.AddWithValue("@ImagePath", imagefullpath);
                cmd.Parameters.AddWithValue("@Mobileno", txtMobileNo.Text);
                cmd.Parameters.AddWithValue("@UserName", txtUserName.Text);
                cmd.Parameters.AddWithValue("@Company", txtCompanyName.Text);

                cmd.ExecuteNonQuery();
                con.Close();
                gridview();
            }
            else
            {
                SqlCommand cmd = new SqlCommand("update tblRegister set FirstName=@FirstName,MiddleName=@MiddleName,LastName=@LastName,Initial=@Initial" +
                    ",Gender=@Gender,EmailId=@EmailId,Address=@Address," +
                    "Mobileno=@Mobileno,UserName=@UserName,Company=@Company " +
                    " where id=" + hf.Value, con);
                cmd.Parameters.AddWithValue("@FirstName", txtName.Text);
                cmd.Parameters.AddWithValue("@MiddleName", txtMiddleName.Text);
                cmd.Parameters.AddWithValue("@LastName", txtLastName.Text);
                cmd.Parameters.AddWithValue("@Initial", cboInitial.Text);
                cmd.Parameters.AddWithValue("@Gender", rbtnMale.Checked ? "Male" : "Female");
                cmd.Parameters.AddWithValue("@EmailId", txtEmialId.Text);
                cmd.Parameters.AddWithValue("@Address", txtAddress.Text);
                cmd.Parameters.AddWithValue("@Mobileno", txtMobileNo.Text);
                cmd.Parameters.AddWithValue("@UserName", txtUserName.Text);
                cmd.Parameters.AddWithValue("@Company", txtCompanyName.Text);


                cmd.ExecuteNonQuery();
                con.Close();
                gridview();
                
            }
            
        }
        txtAddress.Text = "";
        txtEmialId.Text = "";
        txtName.Text = "";
        
        txtMobileNo.Text = "";
        txtFirstName.Text = "";
        txtLastName.Text = "";
        txtCompanyName.Text = "";
        txtUserName.Text = "";
        
    }
    private void gridview()
    {
        // con.Open();

        con.Open();
        SqlCommand cmd = new SqlCommand("select * from tblRegister", con);
        SqlDataAdapter ada = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        ada.Fill(ds, "tblRegister");
        GridView.DataSource = ds.Tables["tblRegister"];
        GridView.DataBind();
        con.Close();

    }


    protected void lnkbtnEdit_Command(object sender, CommandEventArgs e)
    {
        hf.Value = e.CommandArgument.ToString();
        con.Open();
        SqlCommand cmd = new SqlCommand("select * from tblRegister where Id=" + hf.Value.ToString(), con);

        SqlDataAdapter ada = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        ada.Fill(ds, "tblRegister");
        if (ds.Tables[0].Rows.Count > 0)
        {
            // fuImage. = ds.Tables["tblRegister"].Rows[0]["ImagePath"].ToString();
            txtName.Text = ds.Tables["tblRegister"].Rows[0]["FirstName"].ToString();
            cboInitial.Text = ds.Tables["tblRegister"].Rows[0]["Initial"].ToString();
            txtEmialId.Text = ds.Tables["tblRegister"].Rows[0]["EmailId"].ToString();
            txtAddress.Text = ds.Tables["tblRegister"].Rows[0]["Address"].ToString();
            txtMobileNo.Text = ds.Tables["tblRegister"].Rows[0]["Mobileno"].ToString();
          
            txtUserName.Text = ds.Tables["tblRegister"].Rows[0]["UserName"].ToString();
            
        }
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
        GridView.PageIndex = e.NewPageIndex;
        SqlCommand cmd = new SqlCommand("select * from tblRegister", con);

        SqlDataAdapter ada = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        ada.Fill(ds, "tblRegister");
        GridView.DataSource = ds.Tables["tblRegister"];
        GridView.DataBind();
        GridView.DataBind();
    }
    protected void lbntAddNew_Click(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = 1;
    }
    protected void ltbnViewList_Click(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = 0;
    }
}
