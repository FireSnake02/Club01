<%@ Page Title="" Language="C#" MasterPageFile="~/Front.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="社团.index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="right" runat="server">
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
            height: 280px;
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
    <div class="lunbo">
        <div class="content">
            <ul id="item">
                <li class="item">
                    <a href="#">
                        <img src="img/微信图片_20211117162252.png"></a>
                </li>
                <li class="item">
                    <a href="#">
                        <img src="img/微信图片_20211117162421.png"></a>
                </li>
                <li class="item">
                    <a href="#">
                        <img src="img/微信图片_20211117162425.png"></a>
                </li>
                <li class="item">
                    <a href="#">
                        <img src="img/2.jpg" width="500" height="280"></a>
                </li>
                <li class="item">
                    <a href="#">
                        <img src="img/3.jpg" width="500" height="280"></a>
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
