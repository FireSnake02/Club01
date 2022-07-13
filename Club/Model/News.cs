using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model
{
    public class News
    {
        private int _n_ID;
        private string _NewsName;
        private string _Content;
        private int _Typeid;
        private string _TypeName;
        private DateTime _AddTime;

        public int N_ID { get => _n_ID; set => _n_ID = value; }
        public string NewsName { get => _NewsName; set => _NewsName = value; }
        public string Content { get => _Content; set => _Content = value; }
        public int Typeid { get => _Typeid; set => _Typeid = value; }
        public string TypeName { get => _TypeName; set => _TypeName = value; }
        public DateTime AddTime { get => _AddTime; set => _AddTime = value; }
    }
}
