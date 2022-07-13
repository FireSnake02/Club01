<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Login.ascx.cs" Inherits="社团.Login" %>
<div id="login1" style="text-align: center;" runat="server" >
    <div style="border-style: outset; border-width: 3px; border-radius: 20px; padding: 10px; background-color: aliceblue" runat="server">
        <h3 style="background: #0094ff">用户登录</h3>
        <br />
        用户名：
            <asp:TextBox ID="TxtUserName" runat="server" Height="30px"></asp:TextBox>
        <br />
        <br />
        密   码：
            <asp:TextBox ID="TxtPassword" runat="server" TextMode="Password" Height="30px"></asp:TextBox>
        <br />
        <br />
        验证码：<asp:TextBox ID="TextBox1" runat="server" Height="30px"></asp:TextBox>
        <asp:Label ID="Label1" runat="server" Text="****"></asp:Label>
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" Text="提交" OnClick="Button1_Click" Height="30px" Width="45px" />&emsp;&emsp;&emsp;
            <asp:Button ID="Button2" runat="server" Text="取消" Height="30px" Width="45px" OnClick="Button2_Click" />
        <br />
        <br />
        <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">用户注册</asp:LinkButton>
        </div>
</div>
<div id="userInfo" style="text-align: center;" runat="server">
    <div style="border-style: outset; border-width: 3px; border-radius: 20px; padding: 10px; background-color: aliceblue; min-width: 260px" runat="server">
        <h3 style="background: #0094ff">用户信息</h3>
        用户：<asp:Label ID="LabUserName" runat="server" Text=""></asp:Label>
        <br />
        <br />
        欢迎您来到本站！<br />
        <br />
        <br />
        <asp:LinkButton ID="LinkButton2" runat="server">个人管理中心</asp:LinkButton>
        <br />
        <br />
        <asp:LinkButton ID="LinkButton3" runat="server">退出登录</asp:LinkButton>
        </div>
</div>
<div id="enroll" runat="server" style="border-style: outset; border-width: 3px; border-radius: 20px; padding: 10px; background-color: aliceblue;margin-top:40px">
    <div runat="server">
        <h3 style="background: #0094ff;text-align:center">用户注册</h3>
        <br />
        用户名：
            <asp:TextBox ID="TextBox2" runat="server" Height="30px"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="用户名不能为空！" ControlToValidate="TextBox2" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
        <br />
        <br />
        密   码：
            <asp:TextBox ID="TextBox3" runat="server" TextMode="Password" Height="30px"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="密码不能为空！" ControlToValidate="TextBox3" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
        <br />
        <br />
        确认密码：
            <asp:TextBox ID="TextBox4" runat="server" TextMode="Password" Height="30px"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="密码不能为空！" ControlToValidate="TextBox4" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
        <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="两次密码输入不一致" ControlToCompare="TextBox3" ControlToValidate="TextBox4" ForeColor="Red" Display="Dynamic"></asp:CompareValidator>
        <br />
        <br />
        学号：
        <asp:TextBox ID="TextBox5" runat="server"  Height="30px"></asp:TextBox>
         <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="密码不能为空！" ControlToValidate="TextBox5" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
        <br />
        <br />
        &emsp;&emsp;&emsp;<asp:Button ID="Button3" runat="server" Text="提交" OnClick="Button3_Click" Height="30px" />
        &emsp;&emsp;&emsp;
            <asp:Button ID="Button4" runat="server" Text="取消" Height="30px" OnClick="Button4_Click"/>
        <br />
        <br />
</div>
</div>
