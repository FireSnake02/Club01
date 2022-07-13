<%@ Page Title="" Language="C#" MasterPageFile="~/Front.Master" AutoEventWireup="true" CodeBehind="AboutUs.aspx.cs" Inherits="社团.About_Us" %>
<asp:Content ID="Content1" ContentPlaceHolderID="left" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="right" runat="server">
    <style>
         .imgbox {
            width: 940px;
            padding: 0 20px;
            white-space: nowrap;
            overflow: hidden;
        }

            .imgbox img {
                width: 226px;
                height: 129px;
                padding: 2px;
            }

            .imgbox a {
                margin-right: 20px;
            }
    </style>
    <div style="display:flex;flex-direction:column;width:70%;height: 63vh">
        <div style="text-align:center;height:10%">
            <h2>关于我们</h2>
        </div>
        <div style="height:40%;width:950px;padding:15px;line-height:1.7em">
            &emsp;&emsp;&emsp;<asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
        </div>
        <div style="height: 50%;">
            <div class="imgbox" id="imgbox">
                <span>
                    <a href="#" target="_blank">
                        <img src="img/微信图片_20211117141255.jpg" /></a>
                    <a href="#" target="_blank">
                        <img src="img/微信图片_20211117141303.png" /></a>
                    <a href="#" target="_blank">
                        <img src="img/微信图片_20211117141307.png" /></a>
                    <a href="#" target="_blank">
                        <img src="img/微信图片_20211117161255.png" /></a>
                </span>
            </div>
        </div>
    </div>
    <script>
        function school() {
            //定义滚动速度
            var speed = 50;
            //获取<div id="imgbox">元素
            var imgbox = document.getElementById("imgbox");
            //复制一个<span>，用于无缝滚动
            imgbox.innerHTML += imgbox.innerHTML;
            //获取两个<span>元素
            var span = imgbox.getElementsByTagName("span");
            //启动定时器，调用滚动函数
            var timer1 = window.setInterval(marquee, speed);
            //鼠标移入时暂停滚动，移出时继续滚动
            imgbox.onmouseover = function () {
                clearInterval(timer1);
            }
            imgbox.onmouseout = function () {
                timer1 = setInterval(marquee, speed);
            };
            //滚动函数
            function marquee() {
                //当第1个<span>被完全卷出时
                if (imgbox.scrollLeft > span[0].offsetWidth) {
                    //将被卷起的内容归0
                    imgbox.scrollLeft = 0;
                } else {
                    //否则向左滚动
                    ++imgbox.scrollLeft;
                }
            }
        }
        school();
    </script>
</asp:Content>
