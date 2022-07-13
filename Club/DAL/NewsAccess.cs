using Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class NewsAccess
    {
        DBbase db = new DBbase();
        public DataSet GetIndex()
        {
            string strSQl = "select Content from [News] where Typeid='4'";
            return db.ReturnDataSet(strSQl);
        }
        public DataSet GetAnnouncement()
        {
            string strSQl = "select * from [News] where Typeid='1'";
            return db.ReturnDataSet(strSQl);
        }
        public DataSet GetInformation()
        {
            string strSQl = "select * from [News] where Typeid='2'";
            return db.ReturnDataSet(strSQl);
        }
        public DataSet GetAboutUs()
        {
            string strSQl = "select Content from [News] where Typeid='3'";
            return db.ReturnDataSet(strSQl);
        }
        public DataSet GetBasketball()
        {
            string strSQl = "select Content from [News] where Typeid='5'";
            return db.ReturnDataSet(strSQl);
        }
    }
}
