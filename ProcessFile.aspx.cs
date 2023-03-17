using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
using System.IO;
using System.Drawing;
using System.Net;
using System.Net.Mail;
using System.Web.Services;

public partial class ProcessFile : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack == false)
        {
        }
    }
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString.ToString());

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        
        string lSearchWord = txtImage.Text;
        
        
        SqlCommand cmd = new SqlCommand("select * from ImageSearch  where approve=1   ", con);

            
            SqlDataAdapter ada = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            ada.Fill(ds, "File");
           
            //rptShowItems.DataSource = ds.Tables["File"];
            //rptShowItems.DataBind();           
            con.Close();

            DataTable dt = new DataTable();
            dt.Columns.Add("Id");
            dt.Columns.Add("Description");
            dt.Columns.Add("Categories");
            dt.Columns.Add("Tags");
            dt.Columns.Add("ImagePath");

            foreach (DataRow row in ds.Tables["File"].Rows)
            {   
                DataRow dr = row;
                if (row["Description"].ToString() != "")
                {
                    string lDescription = row["Description"].ToString();
                    dr["Description"]= lDescription;
                }
                if (row["Categories"].ToString() != "")
                {
                    string lCategories = row["Categories"].ToString();
                    dr["Categories"] = lCategories;
                }
                if (row["Tags"].ToString() != "")
                {
                    string lTags = row["Tags"].ToString();
                    dr["Tags"] = lTags;
                }
                if (row["Id"].ToString() != "")
                {
                    string lId = row["Id"].ToString();
                    dr["Id"] = lId;
                }
                if (row["ImagePath"].ToString() != "")
                {
                    string lImagePath = row["ImagePath"].ToString();
                    dr["ImagePath"] = lImagePath;
                }
                dt.ImportRow(dr);
            }

            DataTable dtt = new DataTable();
            dtt.Columns.Add("Id");
            dtt.Columns.Add("Description");
            dtt.Columns.Add("Categories");
            dtt.Columns.Add("Tags");
            dtt.Columns.Add("ImagePath");

             
             var drr = dt.Select("Description  LIKE  '%" + txtImage.Text + "%' or  Categories like '%" + txtImage.Text + "%' or Tags  like '%" + txtImage.Text + "%' ");
            //DataRow relation;
            //for (int i = 0; i < drr.Length; i++)
            //{
             //relation = dtt.NewRow();
             //relation.ItemArray = drr;
                
            //}
             if (drr.Length != 0)
             {
                 var dtt1 = drr.CopyToDataTable();
                 GridView1.DataSource = dtt1;
                 GridView1.DataBind();
                 //dtt.ImportRow(drr);
             }
             else
             {
                 GridView1.DataSource = dtt;
                 GridView1.DataBind();
             }

    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        txtImage.Text = "";
    }
    protected void lbtnTitle_Command(object sender, CommandEventArgs e)
    {
        con.Open();
        SqlCommand cmd = new SqlCommand("insert into falsehits (keyword) values ('" + e.CommandArgument.ToString() + "')", con);
        cmd.ExecuteNonQuery();
        con.Close();
        Response.Redirect("Content.aspx?Tag=" + e.CommandArgument.ToString());
    }


    protected void LinkButton1_Command(object sender, CommandEventArgs e)
    {
        string lFromEmail = "Cloudusasder15@gmail.com";
        string lpassword = "CloudUser1asd5#";
        foreach (GridViewRow row in gvUser.Rows)//Running all lines of grid
        {
            if (row.RowType == DataControlRowType.DataRow)
            {
                CheckBox chkRow = (row.Cells[0].FindControl("chkFriends") as CheckBox);
                Label lblEmailId = (row.Cells[3].FindControl("lblEmailId") as Label);
                if (chkRow.Checked)
                {
                    if(lblEmailId.Text!="")
                    {

                    string lran = Guid.NewGuid().ToString().Substring(0, 4);
                    con.Open();
                    string query = "Insert into tbl_OTP  (OTP,flag)Values('" + lran + "',1)";
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.ExecuteNonQuery();
                    con.Close();
                    HiddenField1.Value = e.CommandArgument.ToString();
                    //string lEmail = Session["Email"].ToString();
                    //using (MailMessage mm = new MailMessage(lFromEmail, lblEmailId.Text))
                    //{
                    //    mm.Subject = "OTP";
                    //    mm.Body = "Your OTP : " + lran;
                    //    mm.IsBodyHtml = false;
                    //    SmtpClient smtp = new SmtpClient();
                    //    smtp.Host = "smtp.gmail.com";
                    //    smtp.EnableSsl = true;
                    //    NetworkCredential NetworkCred = new NetworkCredential(lFromEmail, lpassword);
                    //    smtp.UseDefaultCredentials = true;
                    //    smtp.Credentials = NetworkCred;
                    //    smtp.Port = 587;
                    //    smtp.Send(mm);
                    //   ClientScript.RegisterStartupScript(GetType(), "alert", "alert('OTP sent yo your Email.');", true);
                    ClientScript.RegisterStartupScript(GetType(), "alert", "alert('OTP Generated Successfully!!');", true);
                    //}
                    
                    }
                }
            }
        }


        string lran1 = Guid.NewGuid().ToString().Substring(0, 4);
        con.Open();
        string query1 = "Insert into tbl_OTP  (OTP,flag)Values('" + lran1 + "',1)";
        SqlCommand cmd1  = new SqlCommand(query1, con);
        cmd1.ExecuteNonQuery();
        con.Close();
        
        HiddenField1.Value = e.CommandArgument.ToString();
        string lEmail1 = Session["Email"].ToString();
        //using (MailMessage mm = new MailMessage(lFromEmail, lEmail1))
        //{
        //    mm.Subject = "OTP";
        //    mm.Body = "Your OTP : " + lran1;
        //    mm.IsBodyHtml = false;
        //    SmtpClient smtp = new SmtpClient();
        //    smtp.Host = "smtp.gmail.com";
        //    smtp.EnableSsl = true;
        //    NetworkCredential NetworkCred = new NetworkCredential(lFromEmail, lpassword);
        //    smtp.UseDefaultCredentials = true;
        //    smtp.Credentials = NetworkCred;
        //    smtp.Port = 587;
        //    smtp.Send(mm);
        //    ClientScript.RegisterStartupScript(GetType(), "alert", "alert('OTP sent yo your Email.');", true);
        ClientScript.RegisterStartupScript(GetType(), "alert", "alert('OTP Generated Successfully!!');", true);
        //}

       //ScriptManager.RegisterStartupScript(this, GetType(), "Show Modal Popup", "showmodalpopup();", true);
    }

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        //AppModule o = new AppModule();
        //if (e.Row.RowType.Equals(DataControlRowType.DataRow))
        //{
        //    foreach (TableCell cell in e.Row.Cells)
        //    {
        //        if (cell.Text != "")
        //        {
        //            string lDecryptedData = cell.Text;
        //            cell.Text = lDecryptedData;
        //        }
        //    }
       // }
    }
    
    protected void Button1_Click(object sender, EventArgs e)
    {
        con.Open();
        SqlCommand cmd = new SqlCommand("Select U.* from tbl_FriendReq_Acpt F  left join tbl_Register U on F.UserName=U.UserName " +
                                       "where Req_UserName='" + Session["UserName"].ToString() + "' and Status=1 union Select U.* from tbl_FriendReq_Acpt F " +
                                       " left join tbl_Register U on F.Req_UserName=U.UserName  where F.UserName='" + Session["UserName"].ToString() + "' and Status=1 ", con);
        SqlDataAdapter ada = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        ada.Fill(ds, "tbl_Register");
        gvUser.DataSource = ds.Tables["tbl_Register"];
        gvUser.DataBind();
        con.Close();
    }
}

