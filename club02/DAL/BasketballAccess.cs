using Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class BasketballAccess
    {
        DBbase db = new DBbase();
        public bool AddBasketball(Basketball1 basketball1)
        {
            string strSQL = "insert into [Basketball] values ('" + basketball1.Studentid + "','" + basketball1.StudentName + "','"
                + basketball1.Sex + "','" + basketball1.College + "','" + basketball1.Telephone + "','" 
                + basketball1.QQ + "','" + basketball1.Email + "')";
            return db.ExecuteNonQuery(false, strSQL);
        }
    }
}
