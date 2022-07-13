using Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class NewsLogic
    {
        DAL.NewsAccess DALad1 = new DAL.NewsAccess();
        public DataSet GetIndex()
        {
            return DALad1.GetIndex();
        }
        public DataSet GetAnnouncement()
        {
            return DALad1.GetAnnouncement();
        }
        public DataSet GetInformation()
        {
            return DALad1.GetInformation();
        }
        public DataSet GetAboutUs()
        {
            return DALad1.GetAboutUs();
        }
        public DataSet GetBasketball()
        {
            return DALad1.GetBasketball();
        }
    }
}

