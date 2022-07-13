using Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace DAL
{
    public class UserAccess
    {
        DBbase db = new DBbase();

        public int AdminLogin(string UserName, string Password)
        {
            string strSQL = "select * from [User] where UserName='" + UserName + "' and Password='" + Password + "' and Lever='管理员'";
            return db.ReturnRowCount(strSQL);
        }

        public int UserLogin(string UserName, string PassWord)
        {
            string strSQL = "select * from [User] where UserName='" + UserName + "' and Password='" + PassWord + "' and Lever='普通用户'";
            return db.ReturnRowCount(strSQL);
        }
        public int CheckUser(string UserName)
        {
            string strSQL = "select * from [User] where UserName='" + UserName + "'";
            return db.ReturnRowCount(strSQL);
        }
        public bool AddUser(Model.User del_ad)
        {
            string strSQL = "insert into [User](UserName,Password,Studentid,Lever) values('" + del_ad.UserName + "','" + del_ad.Password + "','" + del_ad.Studentid + "','" + del_ad.Lever + "')";
            return db.ExecuteNonQuery(false, strSQL);
        }
        public DataSet GetUsers()
        {
            string strSQl = "select * from [User]";
            return db.ReturnDataSet(strSQl);
        }
        public bool AddUser1(User user)
        {
            string strSQL = "insert into [User] values ('" + user.UserName + "','" + user.Password + "','"
                + user.Studentid + "','" + user.Lever + "')";
            return db.ExecuteNonQuery(false, strSQL);
        }
        public DataSet GetUsersByID(string id)
        {
            string strSQL = "select * from [User] where U_id=" + id;
            return db.ReturnDataSet(strSQL);
        }
        public bool UpdateUser(User user)
        {
            string strSQL = "update [User] set UserName='" + user.UserName + "',Password='" + user.Password + "',Studentid='" +
                user.Studentid + "',Lever='" + user.Lever + "' where U_id=" + user.U_ID;
            return db.ExecuteNonQuery(false, strSQL);
        }
        public bool DeleteUser(string id)
        {
            string strSQL = "delete from[user] where U_id=" + id;
            return db.ExecuteNonQuery(false, strSQL);
        }

    }
}
