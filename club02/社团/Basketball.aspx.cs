using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace 社团
{
    public partial class Basketball : System.Web.UI.Page
    {
        BLL.NewsLogic newsLogic = new BLL.NewsLogic();
        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
            if (!IsPostBack)
            {
                Label1.Text = newsLogic.GetBasketball().Tables[0].Rows[0][0].ToString();
                Label1.DataBind();
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (Session["username"] == null)
            {
                Response.Write("<script language=javascript>alert('请登录！');history.back();</script>");
                return;
            }
            Response.Redirect("AddBasketball.aspx");
        }
    }
}