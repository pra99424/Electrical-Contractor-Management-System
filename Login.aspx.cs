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
public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connection"].ConnectionString);
    protected void btnLogin_Click(object sender, EventArgs e)
    {

        
        if (cboRole.Text=="Admin" && txtUserName.Text == "admin" && txtPassword.Text == "admin")
        {
            Session["Role"] = "Admin";
            Session["StaffId"] = "2";
            Response.Redirect("RegistrationDetails.aspx");
        }
        else if (cboRole.Text == "User")
        {
            SqlCommand cmd = new SqlCommand("select * from tblRegister where UserName=@UserName and Password=@Password", con);
            cmd.Parameters.AddWithValue("UserName", txtUserName.Text);
            cmd.Parameters.AddWithValue("Password", txtPassword.Text);
            SqlDataAdapter ada = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            ada.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                Session["UserName"] = dt.Rows[0]["UserName"].ToString();
                Session["Name"] = dt.Rows[0]["FirstName"].ToString();
                Session["Role"] = "User";
                Session["UserId"] = dt.Rows[0]["Id"].ToString();
                Session["Email"] = dt.Rows[0]["EmailId"].ToString();
                //Response.Redirect("IncomeExpence.aspx?PType=Income");
                Response.Redirect("AddTask.aspx");
            }
        }
        else if (cboRole.Text == "Senior Engineer")
        {
            SqlCommand cmd = new SqlCommand("select * from tblRegister where UserName=@UserName and Password=@Password", con);
            cmd.Parameters.AddWithValue("UserName", txtUserName.Text);
            cmd.Parameters.AddWithValue("Password", txtPassword.Text);
            SqlDataAdapter ada = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            ada.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                Session["UserName"] = dt.Rows[0]["UserName"].ToString();
                Session["Name"] = dt.Rows[0]["FirstName"].ToString();
                Session["Role"] = "Senior Engineer";
                Session["UserId"] = dt.Rows[0]["Id"].ToString();
                Session["Email"] = dt.Rows[0]["EmailId"].ToString();
                //Response.Redirect("IncomeExpence.aspx?PType=Income");
                Response.Redirect("TaskList_SE.aspx");
            }
        }
        else if (cboRole.Text == "Junior Engineer")
        {
            SqlCommand cmd = new SqlCommand("select * from tblRegister where UserName=@UserName and Password=@Password", con);
            cmd.Parameters.AddWithValue("UserName", txtUserName.Text);
            cmd.Parameters.AddWithValue("Password", txtPassword.Text);
            SqlDataAdapter ada = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            ada.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                Session["UserName"] = dt.Rows[0]["UserName"].ToString();
                Session["Name"] = dt.Rows[0]["FirstName"].ToString();
                Session["Role"] = "Senior Engineer";
                Session["UserId"] = dt.Rows[0]["Id"].ToString();
                Session["Email"] = dt.Rows[0]["EmailId"].ToString();
                //Response.Redirect("IncomeExpence.aspx?PType=Income");
                Response.Redirect("AddTaskElement.aspx");
            }
        }
        //else if (cboRole.Text == "Student")
        //{
        //    SqlCommand cmd = new SqlCommand("select * from tblStudent where UserName=@UserName and Password=@Password", con);
        //    cmd.Parameters.AddWithValue("UserName", txtUserName.Text);
        //    cmd.Parameters.AddWithValue("Password", txtPassword.Text);
        //    SqlDataAdapter ada = new SqlDataAdapter(cmd);
        //    DataTable dt = new DataTable();
        //    ada.Fill(dt);
        //    if (dt.Rows.Count > 0)
        //    {
        //        Session["Name"] = dt.Rows[0]["FirstName"].ToString();
        //        Session["Role"] = "Student";
        //        Session["UserId"] = dt.Rows[0]["Id"].ToString();
        //        Session["Department"] = dt.Rows[0]["Department"].ToString();
        //        Response.Redirect("TodaysClassStudent.aspx");
        //    }
        //}

    }
}
