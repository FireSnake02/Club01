using BLL;
using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace 社团
{
    public partial class AddBasketball : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            Basketball1 basketball1 = new Basketball1();
            basketball1.Studentid = Convert.ToInt16(TextBox1.Text);
            basketball1.StudentName = TextBox2.Text;
            basketball1.Sex = DropDownList2.Text;
            basketball1.College = DropDownList2.Text;
            basketball1.Telephone = TextBox5.Text;
            basketball1.QQ = TextBox6.Text;
            basketball1.Email = TextBox7.Text;
            bool mes = new BLL.BasketballLogic().AddBasketball(basketball1);
           Response.Write("<script>alert('申请成功')</script>");
        }
    }
}