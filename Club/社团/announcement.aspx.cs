using BLL;
using Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.OleDb;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace 社团
{
    public partial class announcement : System.Web.UI.Page
    {
        BLL.NewsLogic newsLogic = new BLL.NewsLogic();
        SqlComm Sql = new SqlComm();
        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
            if (!IsPostBack)
            {
                DataList1.DataSource = newsLogic.GetAnnouncement();
                DataList1.DataBind();
                bind();
            }
        }
        protected void bind()
        {
            int curpage;
            //取得当前页的页码
            //使用PagedDataSource类实现DataList控件的分页功能
            PagedDataSource ps = new PagedDataSource();
            //获取数据集
            ps.DataSource = Sql.reDt("select * from News where Typeid=1").DefaultView; ;
            //是否可以分页
            ps.AllowPaging = true;
            //显示的数量
            ps.PageSize = 2;
            if (!int.TryParse(this.labPage.Text, out curpage))
            {
                //Response.Write("<script>alert('页码格式有误！');</script>");
                ps.CurrentPageIndex = 0;
            }
            //取得当前页的页码
            else if (curpage > ps.PageCount)
            {
                //Response.Write("<script>alert('页码超出最大页数！');</script>");
                ps.CurrentPageIndex = 0;
            }
            else
                ps.CurrentPageIndex = curpage - 1;
            this.lnkbtnUp.Enabled = true;
            this.lnkbtnNext.Enabled = true;
            this.lnkbtnBack.Enabled = true;
            this.lnkbtnOne.Enabled = true;
            if (curpage == 1)
            {
                //不显示第一页按钮
                this.lnkbtnOne.Enabled = false;
                //不显示上一页按钮
                this.lnkbtnUp.Enabled = false;
            }
            if (curpage == ps.PageCount)
            {
                //不显示下一页
                this.lnkbtnNext.Enabled = false;
                //不显示最后一页
                this.lnkbtnBack.Enabled = false;
            }
            //显示分页数量
            this.labBackPage.Text = Convert.ToString(ps.PageCount);
            //重新赋值当前页
            this.labPage.Text = (ps.CurrentPageIndex + 1).ToString();
            //绑定DataList控件
            this.DataList1.DataSource = ps;
            this.DataList1.DataKeyField = "N_id";
            this.DataList1.DataBind();
        }

        //第一页
        protected void lnkbtnOne_Click(object sender, EventArgs e)
        {
            this.labPage.Text = "1";
            this.bind();
        }
        //上一页
        protected void lnkbtnUp_Click(object sender, EventArgs e)
        {
            this.labPage.Text = Convert.ToString(Convert.ToInt32(this.labPage.Text) - 1);
            this.bind();
        }
        //下一页
        protected void lnkbtnNext_Click(object sender, EventArgs e)
        {
            this.labPage.Text = Convert.ToString(Convert.ToInt32(this.labPage.Text) + 1);
            this.bind();
        }
        //最后一页
        protected void lnkbtnBack_Click(object sender, EventArgs e)
        {
            this.labPage.Text = this.labBackPage.Text;
            this.bind();
        }
        //搜索
        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            this.labPage.Text = this.TextBox1.Text;
            this.bind();
        }

        public override void VerifyRenderingInServerForm(Control control)
        {
            // Confirms that an HtmlForm control is rendered for
        }
    }
}