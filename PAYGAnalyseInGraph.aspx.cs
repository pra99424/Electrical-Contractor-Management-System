using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Data.SqlClient;
using System.Web.UI.DataVisualization.Charting; 


public partial class PAYGAnalyseInGraph : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connection"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            loadchart();
            //loadchart2();
        }
        catch (SystemException ex)
        {
            throw ex;
        }
    }
    private void loadchart()
    {
        try
        {
            int lGood = 0;
            int lBad = 0;

            con.Open();
            SqlCommand cmd1 = new SqlCommand("select PaymentType as GoodBad,sum(Amount) as total from tbl_IncomeExpence group by  PaymentType ", con);//where  itemid=" + Request["id"].ToString(), con);
            
            //SqlCommand cmd1 = new SqlCommand(" select 'Power PMU' as GoodBad,sum(PowerValue)as total from tbl_PMUValue Union All  select 'Current PMU' as GoodBad,sum(CurrentValue)as total from tbl_PMUValue Union All select 'Voltage PMU' as GoodBad,sum(VoltageValue)as total from tbl_PMUValue ", con);//where  itemid=" + Request["id"].ToString(), con);
            SqlDataAdapter ada1 = new SqlDataAdapter(cmd1);
            DataTable dt2 = new DataTable();
            ada1.Fill(dt2);
            con.Close();
            DataSet ds = new DataSet();




            string[] x = new string[dt2.Rows.Count];
            int[] y = new int[dt2.Rows.Count];
            for (int i = 0; i < dt2.Rows.Count; i++)
            {
                x[i] = dt2.Rows[i][0].ToString();

                y[i] = Convert.ToInt32(dt2.Rows[i][1]);
            }
            Chart2.Series[0].Points.DataBindXY(x, y);
            Chart1.Series[0].Points.DataBindXY(x, y);

        }
        catch (SystemException ex)
        {
            throw ex;
        }
    }

    private void loadchart2()
    {
        try
        {
            int lGood = 0;
            int lBad = 0;

            con.Open();
            SqlCommand cmd1 = new SqlCommand(" select 'Power PMU' as GoodBad,sum(PowerValue)as total from tbl_PMUAttackedValue Union All  select 'Current PMU' as GoodBad,sum(CurrentValue)as total from tbl_PMUAttackedValue Union All select 'Voltage PMU' as GoodBad,sum(VoltageValue)as total from tbl_PMUAttackedValue ", con);//where  itemid=" + Request["id"].ToString(), con);
            SqlDataAdapter ada1 = new SqlDataAdapter(cmd1);
            DataTable dt2 = new DataTable();
            ada1.Fill(dt2);
            con.Close();
            DataSet ds = new DataSet();




            string[] x = new string[dt2.Rows.Count];
            int[] y = new int[dt2.Rows.Count];
            for (int i = 0; i < dt2.Rows.Count; i++)
            {
                x[i] = dt2.Rows[i][0].ToString();

                y[i] = Convert.ToInt32(dt2.Rows[i][1]);
            }
            
            //Chart1.Series[0].Points.DataBindXY(x, y);

        }
        catch (SystemException ex)
        {
            throw ex;
        }
    }

}
