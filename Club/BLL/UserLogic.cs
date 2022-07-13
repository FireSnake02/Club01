using Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace BLL
{
    public class UserLogic
    {
        DAL.UserAccess DALad = new DAL.UserAccess();
        User M_ad = new User();
        Model.User Modelad = new Model.User();

        public int AdminLogin(User Ma)
        {
            return DALad.AdminLogin(Ma.UserName, Ma.Password);
        }

        public int UserLogin(User Ma)
        {
            return DALad.UserLogin(Ma.UserName, Ma.Password);
        }
        public int CheckUser(Model.User Ma)
        {
            return DALad.CheckUser(Ma.UserName);
        }

        public bool AddUser(Model.User M_ad)
        {
            return DALad.AddUser(M_ad);
        }
        public DataSet GetUsers()
        {
            return DALad.GetUsers();
        }
        public bool AddUser1(User user)
        {
            return DALad.AddUser1(user);
        }
        public DataSet GetUsersByID(string id)
        {
            return DALad.GetUsersByID(id);
        }
        public bool UpdateUser(User user)
        {
            return DALad.UpdateUser(user);
        }
        public bool DeleteUser(string id)
        {
            return DALad.DeleteUser(id);
        }

    }
}

