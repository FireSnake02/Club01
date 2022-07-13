<%@ Page Title="" Language="C#" MasterPageFile="~/Front.Master" AutoEventWireup="true" CodeBehind="information.aspx.cs" Inherits="社团.information" %>
<asp:Content ID="Content1" ContentPlaceHolderID="left" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="right" runat="server">
    <div style="display:flex;flex-direction:column;width: auto; height: 63vh">
        <div style="width:100%;height:15%;padding:15px">
            <h4>系统公告</h4>
            <hr style="background-color: black; width: 1000px; height: 1px;margin-left:0" />
        </div>

        <div style="width:100%;height:85%;padding:20px;">
            <asp:DataList ID="DataList1" runat="server"  Width="1000px" RepeatColumns="1" GridLines="Horizontal " BorderStyle="None" CaptionAlign="Left" FooterStyle-BorderStyle="None" EditItemStyle-BorderStyle="None" AlternatingItemStyle-BorderStyle="None" HeaderStyle-BorderStyle="None" ItemStyle-BorderStyle="None" SelectedItemStyle-BorderStyle="None" SelectedItemStyle-HorizontalAlign="NotSet" SeparatorStyle-BorderStyle="None">
                <ItemTemplate>
                    <a href="NewsDetail.aspx?uid=<%# Eval("N_id") %>">
                        <div style="display: inline; float: right">
                            <h6>时间： <%# Eval("AddTime") %></h6>
                        </div>
                        <h4>标题 <%# Eval("NewsName") %></h4>
                        内容：
                        <asp:Label ID="Label2" runat="server"> <%# Eval("Content") %></asp:Label>
                    </a>
                    <hr style="background-color: black; width: 1000px; height: 1px;margin-left:0" />
                </ItemTemplate>
            </asp:DataList>
            <table style="width:450px; padding:0;border-spacing:0; text-align:center;float:left" >
                    <tr><td>&nbsp;</td></tr>
                    <tr>
                       <td style="width: 600px; text-align:center; font-size: 9pt; height: 15px;" >
                          <asp:Label ID="labCP" runat="server" Text="当前第"></asp:Label>
                             <asp:Label ID="labPage" runat="server" Text="1"></asp:Label> &nbsp;页
                          <asp:Label ID="labTP" runat="server" Text="共"></asp:Label>
                             <asp:Label ID="labBackPage" runat="server"></asp:Label> 页
                          <asp:LinkButton ID="lnkbtnOne" runat="server" Font-Underline="False" ForeColor="Red" OnClick="lnkbtnOne_Click">首页</asp:LinkButton>&nbsp;
                          <asp:LinkButton ID="lnkbtnUp" runat="server" Font-Underline="False" ForeColor="Red"  OnClick="lnkbtnUp_Click">上一页</asp:LinkButton>&nbsp;
                           <asp:TextBox ID="TextBox1" runat="server" Height="16px" Width="16px"></asp:TextBox>
                          <asp:LinkButton ID="LinkButton1" runat="server" Font-Underline="False" ForeColor="Red" OnClick="LinkButton1_Click">跳转</asp:LinkButton>&nbsp;
                          <asp:LinkButton ID="lnkbtnNext" runat="server" Font-Underline="False" ForeColor="Red" OnClick="lnkbtnNext_Click">下一页</asp:LinkButton>&nbsp;
                          <asp:LinkButton ID="lnkbtnBack" runat="server" Font-Underline="False" ForeColor="Red" OnClick="lnkbtnBack_Click">尾页</asp:LinkButton>&nbsp;&nbsp;
                       </td>
                    </tr>
            </table>
        </div>
    </div>
</asp:Content>
