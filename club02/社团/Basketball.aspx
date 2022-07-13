<%@ Page Title="" Language="C#" MasterPageFile="~/Front.Master" AutoEventWireup="true" CodeBehind="Basketball.aspx.cs" Inherits="社团.Basketball" %>

<asp:Content ID="Content1" ContentPlaceHolderID="left" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="right" runat="server">
    <style>
        * {
            margin: 0;
            padding: 0;
        }

        a {
            list-style: none;
        }

        li {
            list-style: none;
        }

        .lunbo {
            width: 100%;
        }

        .content {
            width: 500px;
            height: 320px;
            position: relative;
        }

        #item {
            width: 100%;
            height: 100%;
        }

        .item {
            position: absolute;
            opacity: 0;
            transition: all 1s;
        }

            .item.active {
                opacity: 1;
            }

        img {
            width: 100%;
        }

        #btn-left {
            width: 30px;
            height: 69px;
            font-size: 30px;
            color: white;
            background-color: rgba(0,0,0,0.4);
            line-height: 69px;
            padding-left: 5px;
            z-index: 10; /*始终显示在图片的上层*/
            position: absolute;
            left: 0;
            top: 50%;
            transform: translateY(-60%); /*使按钮向上偏移居中对齐*/
            cursor: pointer;
            opacity: 0; /*平时隐藏*/
        }

        .lunbo:hover #btn-left {
            /*鼠标滑入，显示图标*/
            opacity: 1;
        }

        #btn-right {
            width: 26px;
            height: 69px;
            font-size: 30px;
            color: white;
            background-color: rgba(0,0,0,0.4);
            line-height: 69px;
            padding-left: 5px;
            z-index: 10;
            position: absolute;
            right: 0;
            top: 50%;
            cursor: pointer;
            opacity: 0;
            transform: translateY(-60%);
        }

        .lunbo:hover #btn-right {
            opacity: 1;
        }

        #circle {
            height: 20px;
            display: flex;
            position: absolute;
            bottom: 35px;
            right: 25px;
        }

        .circle {
            width: 10px;
            height: 10px;
            border-radius: 10px;
            border: 2px solid white;
            background: rgba(0,0,0,0.4);
            cursor: pointer;
            margin: 5px;
        }

        .white {
            background-color: #FFFFFF;
        }
    </style>
    <div style="display: flex; flex-wrap: wrap; flex-direction: row; width: auto; height: 100%">
        <div class="lunbo" style="width: auto; height: auto; margin-top: 20px">
            <div class="content">
                <ul id="item">
                    <li class="item">
                        <a href="#">
                            <img src="img/篮球1.jpg" width="500" height="320"></a>
                    </li>
                    <li class="item">
                        <a href="#">
                            <img src="img/篮球2.jpg" width="500" height="320"></a>
                    </li>
                    <li class="item">
                        <a href="#">
                            <img src="img/篮球3.jpg" width="500" height="320"></a>
                    </li>
                    <li class="item">
                        <a href="#">
                            <img src="img/篮球4.jpg" width="500" height="320"></a>
                    </li>
                    <li class="item">
                        <a href="#">
                            <img src="img/篮球5.jpg" width="500" height="320"></a>
                    </li>
                </ul>
                <div id="btn-left"><</div>
                <div id="btn-right">></div>
                <ul id="circle">
                    <li class="circle"></li>
                    <li class="circle"></li>
                    <li class="circle"></li>
                    <li class="circle"></li>
                    <li class="circle"></li>
                </ul>
            </div>
        </div>

        <div style="width: 500px; height: 80%; margin: 10px; max-width: 550px; line-height: 1.7em">
            <h4>篮球社介绍</h4>
            <hr style="background-color: black; width: 500px; height: 1px" />
            &emsp;&emsp;&emsp;<asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
            <br />
            <br />
            <div style="background-color:gainsboro; padding:10px;text-align:center">
                <asp:Button ID="Button1" runat="server" Text="申请入社" OnClick="Button1_Click" />
            </div>
        </div>
    </div>
    <script>
        window.onload = function () {
            var items = document.getElementsByClassName("item");
            var circles = document.getElementsByClassName("circle");
            var leftBtn = document.getElementById("btn-left");
            var rightBtn = document.getElementById("btn-right");
            var content = document.querySelector('.content');
            var index = 0;
            var timer = null;

            //清除class
            var clearclass = function () {
                for (let i = 0; i < items.length; i++) {
                    items[i].className = "item";
                    circles[i].className = "circle";
                    circles[i].setAttribute("num", i);
                }
            }
            /*只显示一个class*/
            function move() {
                clearclass();
                items[index].className = "item active";
                circles[index].className = "circle white";
            }
            //点击右边按钮切换下一张图片
            rightBtn.onclick = function () {
                if (index < items.length - 1) {
                    index++;
                }
                else {
                    index = 0;
                }
                move();
            }
            //点击左边按钮切换上一张图片
            leftBtn.onclick = function () {
                if (index < items.length) {
                    index--;
                }
                else {
                    index = items.length - 1;
                }
                move();
            }
            //开始定时器，点击右边按钮，实现轮播
            timer = setInterval(function () {
                rightBtn.onclick();
            }, 1500)
            //点击圆点时，跳转到对应图片
            for (var i = 0; i < circles.length; i++) {
                circles[i].addEventListener("click", function () {
                    var point_index = this.getAttribute("num");
                    index = point_index;
                    move();
                })

            }
            //鼠标移入清除定时器，并开启一个三秒的定时器，使慢慢转动
            content.onmouseover = function () {
                clearInterval(timer);
                timer = setInterval(function () {
                    rightBtn.onclick();
                }, 3000)
            }
            //鼠标移出又开启定时器
            content.onmouseleave = function () {
                clearInterval(timer);
                timer = setInterval(function () {
                    rightBtn.onclick();
                }, 1500)
            }
        }
    </script>
</asp:Content>
