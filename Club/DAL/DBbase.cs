using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using System.Data.SqlClient;


namespace DAL
{
   public class DBbase
    {
        //public static string strCon = System.Configuration.ConfigurationManager.AppSettings["conStr"].ToString();
        SqlConnection con = new SqlConnection("data source=DESKTOP-HHI5U9P\\SQLEXPRESS;integrated security=true; database=Club;pooling=true");
        //SqlConnection con = new SqlConnection(strCon);

        //检测连接的方法CheckConnection()，若连接是关闭的则打开SqlConnection连接
        public void CheckConnection()
        {
            if (this.con.State == ConnectionState.Closed)
            {
                this.con.Open();
            }
        }
        //执行语句返回DataSet数据集
        public DataSet ReturnDataSet(string strSQL)
        {
            CheckConnection();
            try
            {
                SqlDataAdapter sda = new SqlDataAdapter(strSQL, con);
                DataSet ds = new DataSet();
                sda.Fill(ds);
                return ds;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            finally
            {
                con.Close();
            }
        }
        //执行语句返回DataRow
        public DataRow GetDataRow(string strSQL)
        {
            CheckConnection();
            try
            {
                SqlDataAdapter sda = new SqlDataAdapter(strSQL, con);
                DataSet ds = new DataSet();
                sda.Fill(ds);
                return ds.Tables[0].Rows[0];
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            finally
            {
                con.Close();
            }
        }
        //执行存储过程或SQL语句的方法ExecuteNonQuery()，执行成功返回true，否则返回false。
        public bool ExecuteNonQuery(bool IsPro, string strSQL)
        {
            CheckConnection();
            try
            {
                SqlCommand com = new SqlCommand(strSQL, con);
                if (IsPro)
                {
                    com.CommandType = CommandType.StoredProcedure;
                }
                else
                {
                    com.CommandType = CommandType.Text;
                }
                com.CommandText = strSQL;
                com.ExecuteNonQuery();
                con.Close();
                return true;
            }
            catch
            {
                return false;
            }
        }
        //执行SQL语句的方法ExecuteNonQuery()
        public void ExecuteNonQuery(string strSQL)
        {
            CheckConnection();
            try
            {
                SqlCommand com = new SqlCommand(strSQL, con);
                com.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            finally
            {
                con.Close();
            }
        }
        //执行语句返回DataTable的方法
        public DataTable ReturnTable(string strSQL)
        {
            CheckConnection();
            try
            {
                SqlDataAdapter sda = new SqlDataAdapter(strSQL, con);
                DataSet ds = new DataSet();
                sda.Fill(ds);
                return ds.Tables[0];
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            finally
            {
                con.Close();
            }
        }
        //执行语句返回SqlDataReader对象
        public SqlDataReader ReturnDataReader(string strSQL)
        {
            CheckConnection();
            try
            {
                SqlCommand com = new SqlCommand(strSQL, con);
                SqlDataReader myReader = com.ExecuteReader();
                return myReader;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }
        //执行语句，返回该语句查询出的数据行的总数
        public int ReturnRowCount(string strSQL)
        {
            CheckConnection();
            try
            {
                SqlDataAdapter da = new SqlDataAdapter(strSQL, con);
                DataSet ds = new DataSet();
                da.Fill(ds);
                return ds.Tables[0].Rows.Count;
            }
            catch(Exception ex)
            {
                return 0;
            }
            finally
            {
                con.Close();
            }
        }
        //public int ReturnRowCount1(string strSQL)
        //{
        //    CheckConnection();
        //    try
        //    {
        //        SqlCommand cmd = new SqlCommand(strSQL, con);
        //        int count = (int)cmd.ExecuteScalar();
        //        return count;
        //    }
        //    catch (Exception ex)
        //    {
        //        return 0;
        //    }
        //    finally
        //    {
        //        con.Close();
        //    }
        //}
    }
}

