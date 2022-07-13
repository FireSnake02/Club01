using Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class BasketballLogic
    {
        DAL.BasketballAccess DALad2 = new DAL.BasketballAccess();
        public bool AddBasketball(Basketball1 basketball1)
        {
            return DALad2.AddBasketball(basketball1);
        }
    }
}
