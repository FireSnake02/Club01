<%@ Page Title="" Language="C#" MasterPageFile="~/Front.Master" AutoEventWireup="true" CodeBehind="AddBasketball.aspx.cs" Inherits="社团.AddBasketball" %>
<asp:Content ID="Content1" ContentPlaceHolderID="left" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="right" runat="server">
    <div style="line-height: 1.7em; padding: 20px; margin-left: 100px">
        学号：<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="学号不能为空！" ControlToValidate="TextBox1" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
        <br />
        <br />
        姓名：<asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
         <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="学号不能为空！" ControlToValidate="TextBox2" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
        <br />
        <br />
        性别：<asp:DropDownList ID="DropDownList2" runat="server" Height="30px">
            <asp:ListItem>男</asp:ListItem>
            <asp:ListItem>女</asp:ListItem>
        </asp:DropDownList>
        <br />
        <br />
        学院：<asp:DropDownList ID="DropDownList1" runat="server" Height="30px">
            <asp:ListItem>信息与控制学院</asp:ListItem>
            <asp:ListItem>能源与水利学院</asp:ListItem>
            <asp:ListItem>经济与管理学院</asp:ListItem>
        </asp:DropDownList>
        <br />
        <br />
        电话：<asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
         <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="电话不能为空！" ControlToValidate="TextBox5" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
        <br />
        <br />
        QQ：<asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
         <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="QQ不能为空！" ControlToValidate="TextBox6" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
        <br />
        <br />
        Email：<asp:TextBox ID="TextBox7" runat="server"></asp:TextBox>
         <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Email不能为空！" ControlToValidate="TextBox7" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
        <br />
        <br />
        <div style="margin-left:120px">
            <asp:Button ID="Button1" runat="server" Text="提交" OnClick="Button1_Click"/>
        </div>
    </div>
</asp:Content>
