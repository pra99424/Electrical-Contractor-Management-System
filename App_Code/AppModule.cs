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
using System.Security.Cryptography;
using System.Text;

/// <summary>
/// Summary description for AppModule
/// </summary>
public class AppModule
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connection"].ConnectionString.ToString());
     SqlCommand cmd = new SqlCommand();
    SqlDataAdapter ada = new SqlDataAdapter();
    DataSet ds = new DataSet();
    SqlDataReader rdr;
	public AppModule()
	{
	

	}
    public void conn()
    {
        con.Open();
    }

    public void discon()
    {
        con.Close();
    }
    public void insert(string ins)
    {
        cmd.CommandText = ins;
        cmd.Connection = con;
        cmd.ExecuteNonQuery();
    }

    public void update(string up)
    {
        cmd.CommandText = up;
        cmd.Connection = con;
        cmd.ExecuteNonQuery();
    }
    public void delete(string del)
    {
        cmd.CommandText = del;
        cmd.Connection = con;
        cmd.ExecuteNonQuery();

    }
    public DataSet dataadapter(string data)
    {
        cmd.CommandText = data;
        cmd.Connection = con;
        ada.SelectCommand = cmd;
        ada.Fill(ds, "sample");

        return (ds);
    }
    public DataSet dataadapter1(string data1)
    {
        cmd.CommandText = data1;
        cmd.Connection = con;
        ada.SelectCommand = cmd;
        ada.Fill(ds, "sample1");

        return (ds);

    }

    public DataSet dataadapter2(string data2)
    {
        cmd.CommandText = data2;
        cmd.Connection = con;
        ada.SelectCommand = cmd;
        ada.Fill(ds, "sample2");

        return (ds);
    }
    public DataSet dataadapter3(string data3)
    {
        cmd.CommandText = data3;
        cmd.Connection = con;
        ada.SelectCommand = cmd;
        ada.Fill(ds, "sample3");

        return (ds);
    }
    public DataSet dataadapter4(string data4)
    {
        cmd.CommandText = data4;
        cmd.Connection = con;
        ada.SelectCommand = cmd;
        ada.Fill(ds, "sample4");

        return (ds);
    }
    public SqlDataReader reader(string read)
    {

        cmd.CommandText = read;
        cmd.Connection = con;
        rdr = cmd.ExecuteReader();
        return (rdr);
    }
    public DateTime ReturnDate(string GetDate)
    {
        DateTime date = Convert.ToDateTime(GetDate);
        return (date);
    }

    public Int64 ReturnInteger(string val)
    {
        if (val != "")
        {
            return Convert.ToInt64(val);
        }
        else
        {
            return 0;
        }
    }
    public string GetPercent(string val)
    {
        if (val != "")
        {
            decimal lcval = (Convert.ToDecimal(val))* 100;
            string llval = Math.Round(lcval).ToString("######,#");
            return llval + "%";
        }
        else
        {
            return val;
        }
    }
    public string GetWithoutPercent(string val)
    {
        if (val != "")
        {
            string lsval = val.Replace("%", " ");
            decimal lcval = (Convert.ToDecimal(lsval)) / 100;
            //string lval = (Math.tode(lsval)) / 100;
            //return lval.ToString("######,##") ;
            return lcval.ToString();
        }
        else
        {
            return val;
        }
    }
    public string GetDateFormate(string date)
    {
        if (date != "")
        {
            DateTime ldate = Convert.ToDateTime(date);
            return ldate.ToString("MM/dd/yyyy");
        }
        else
        {
            return date;
        }
    }
    //public string GetCurencyFormate(string europe)
    //{
    //    if (europe != "")
    //    {
    //        long leurope = Convert.ToInt64(europe);
    //        return leurope.ToString("## ### ###,##");
    //    }
    //    else
    //    {
    //        return europe;
    //    }
    //}

    public object ReturnInteger()
    {
        throw new Exception("The method or operation is not implemented.");
    }

    public string EncryptText(string input, string password)
    {
        // Get the bytes of the string
        byte[] bytesToBeEncrypted = Encoding.UTF8.GetBytes(input);
        byte[] passwordBytes = Encoding.UTF8.GetBytes(password);

        // Hash the password with SHA256
        passwordBytes = SHA256.Create().ComputeHash(passwordBytes);

        byte[] bytesEncrypted = AES_Encrypt(bytesToBeEncrypted, passwordBytes);

        string result = Convert.ToBase64String(bytesEncrypted);

        return result;
    }
    public string DecryptText(string input, string password)
    {
        // Get the bytes of the string
        byte[] bytesToBeDecrypted = Convert.FromBase64String(input);
        byte[] passwordBytes = Encoding.UTF8.GetBytes(password);
        passwordBytes = SHA256.Create().ComputeHash(passwordBytes);

        byte[] bytesDecrypted = AES_Decrypt(bytesToBeDecrypted, passwordBytes);

        string result = Encoding.UTF8.GetString(bytesDecrypted);

        return result;
    }
    public byte[] AES_Encrypt(byte[] bytesToBeEncrypted, byte[] passwordBytes)
    {
        byte[] encryptedBytes = null;

        // Set your salt here, change it to meet your flavor:
        // The salt bytes must be at least 8 bytes.
        byte[] saltBytes = new byte[] { 1, 2, 3, 4, 5, 6, 7, 8 };

        using (MemoryStream ms = new MemoryStream())
        {
            using (RijndaelManaged AES = new RijndaelManaged())
            {
                AES.KeySize = 256;
                AES.BlockSize = 128;

                var key = new Rfc2898DeriveBytes(passwordBytes, saltBytes, 1000);
                AES.Key = key.GetBytes(AES.KeySize / 8);
                AES.IV = key.GetBytes(AES.BlockSize / 8);

                AES.Mode = CipherMode.CBC;

                using (var cs = new CryptoStream(ms, AES.CreateEncryptor(), CryptoStreamMode.Write))
                {
                    cs.Write(bytesToBeEncrypted, 0, bytesToBeEncrypted.Length);
                    cs.Close();
                }
                encryptedBytes = ms.ToArray();
            }
        }

        return encryptedBytes;
    }
    public byte[] AES_Decrypt(byte[] bytesToBeDecrypted, byte[] passwordBytes)
    {
        byte[] decryptedBytes = null;

        // Set your salt here, change it to meet your flavor:
        // The salt bytes must be at least 8 bytes.
        byte[] saltBytes = new byte[] { 1, 2, 3, 4, 5, 6, 7, 8 };

        using (MemoryStream ms = new MemoryStream())
        {
            using (RijndaelManaged AES = new RijndaelManaged())
            {
                AES.KeySize = 256;
                AES.BlockSize = 128;

                var key = new Rfc2898DeriveBytes(passwordBytes, saltBytes, 1000);
                AES.Key = key.GetBytes(AES.KeySize / 8);
                AES.IV = key.GetBytes(AES.BlockSize / 8);

                AES.Mode = CipherMode.CBC;

                using (var cs = new CryptoStream(ms, AES.CreateDecryptor(), CryptoStreamMode.Write))
                {
                    cs.Write(bytesToBeDecrypted, 0, bytesToBeDecrypted.Length);
                    cs.Close();
                }
                decryptedBytes = ms.ToArray();
            }
        }

        return decryptedBytes;
    }
}


