        var count=0;
        window.onload = function(){
            var Msg = document.getElementById("msg");
            var Btn = document.getElementById("btn");
            var Msg_c = document.getElementById("msg_c");
            var Ul = document.createElement("ul"); //定义一个有序的列表
            Msg_c.appendChild(Ul);                 //向Msg_c中添加UL节点
            Btn.onclick = function(){              /* 点击留言以后，在Msg_c中添加列表，在列表中添加内容
                                                      在每一条留言后面添加一个<span>标签 使用此标签的onclick属性
                                                    */ 
                var MsgValue = Msg.value;         
                var Li = document.createElement("li");
                Li.innerHTML = MsgValue + " <span>删除</span>";
                var arrayLi = Ul.getElementsByTagName("li")   //判断是否是第一个留言
                if(arrayLi.length>0){
                    Ul.insertBefore(Li,arrayLi[0]);
                    count++;
                }else{
                    Ul.appendChild(Li);
                    count++;
                }
                Msg.value='';
                var Span = document.getElementsByTagName("span");
                for(var i=0; i<Span.length; i++){
                    Span[i].onclick = function(){
                      Ul.removeChild(this.parentNode);
                      count--;
                    }
                }
            }
        }
        function totalMessage(){       //统计留言的数量
            alert("一共有"+count+"条留言");
        }