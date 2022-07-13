using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model
{
    public class User
    {
        private int _u_ID;
        private string _UserName;
        private string _Password;
        private int _Studentid;
        private string _Lever;

        public int U_ID { get => _u_ID; set => _u_ID = value; }
        public string UserName { get => _UserName; set => _UserName = value; }
        public string Password { get => _Password; set => _Password = value; }
        public int Studentid { get => _Studentid; set => _Studentid = value; }
        public string Lever { get => _Lever; set => _Lever = value; }
    }
}
