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
    public partial class Login : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Random r = new Random();
                Label1.Text = new Random().Next(1000, 9999).ToString();
            }

            if (Application["state"] == null || Application["state"].ToString() == "0")
            {
                this.login1.Visible = true;
                this.userInfo.Visible = false;
                this.enroll.Visible = false;
                
            }
            else
            {
                this.login1.Visible = false;
                this.userInfo.Visible = true;
                this.enroll.Visible = false;
                if (Session["username"] != null)
                {
                    LabUserName.Text = Session["username"].ToString();
                }
            }
        }
        BLL.UserLogic B_userlogic = new UserLogic();
        User user = new User();
        protected void Button1_Click(object sender, EventArgs e)
        {
            user.UserName = TxtUserName.Text.Trim();
            user.Password = TxtPassword.Text.Trim();
            if (user.UserName == "" || user.Password == "")
            {
                Response.Write("<script language=javascript>alert('请输入必要信息！');history.back();</script>");
                return;
            }

            if (TextBox1.Text == "")
            {
                Response.Write("<script language=javascript>alert('请输入验证码！');history.back();</script>");
                return;
            }
            if (TextBox1.Text != Label1.Text)
            {
                Response.Write("<script language=javascript>alert('验证码不正确！');history.back();</script>");
                return;
            }
            if (TextBox1.Text == Label1.Text)
            {
                if (user.UserName != "" && user.Password != "")
                {
                    LabUserName.Text = user.UserName;
                    //当前用户存在且Lever = '管理员'时执行该语句，跳转到管理页面
                    if (B_userlogic.AdminLogin(user) > 0)
                    {
                        Application["state"] = 1;
                        login1.Visible = false;
                        userInfo.Visible = true;
                        Session["username"] = user.UserName;
                        Response.Cookies["UserName"].Value = user.UserName;
                        Response.Write("<script>alert('登陆成功')</script>");
                        //Response.Redirect("~/Admin/AdminUsers.aspx");
                    }
                    else if (B_userlogic.UserLogin(user) > 0)
                    {
                        Application["state"] = 1;
                        login1.Visible = false;
                        userInfo.Visible = true;
                        Session["username"] = user.UserName;
                        Response.Cookies["UserName"].Value = user.UserName;
                        Response.Write("<script>alert('登陆成功')</script>");
                        //Response.Redirect("~/Front/FrontNews.aspx");
                    }
                    else
                    {
                        Response.Write("<script language=javascript>alert('账号错误！');history.back();</script>");
                    }
                }
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            TxtUserName.Text = "";
            TxtPassword.Text = "";
            TextBox1.Text = "";
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            this.login1.Visible = false;
            this.userInfo.Visible = false;
            this.enroll.Visible = true;
            
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            User s = new User();
            s.Lever = "普通用户";
            s.UserName = TextBox2.Text;
            s.Password = TextBox3.Text;
            s.Studentid = Convert.ToInt32(TextBox5.Text);
            bool mes = new BLL.UserLogic().AddUser(s);
            Response.Write("<script>alert('注册成功')</script>");
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            TxtUserName.Text = "";
            TxtPassword.Text = "";
            TextBox1.Text = "";
        }
    }
}