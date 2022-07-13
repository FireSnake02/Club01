using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model
{
    public class Basketball1
    {
        private int _b_ID;
        private int _Studentid;
        private string _StudentName;
        private string _Sex;
        private string _College;
        private string _Telephone;
        private string _QQ;
        private string _Email;


        public int B_ID { get => _b_ID; set => _b_ID = value; }
        public int Studentid { get => _Studentid; set => _Studentid = value; }
        public string StudentName { get => _StudentName; set => _StudentName = value; }
        public string Sex { get => _Sex; set => _Sex = value; }
        public string College { get => _College; set => _College = value; }
        public string Telephone { get => _Telephone; set => _Telephone = value; }
        public string QQ { get => _QQ; set => _QQ = value; }
        public string Email { get => _Email; set => _Email = value; }
    }
}
