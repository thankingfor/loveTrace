window.onload=function(){
//返回顶部
   var returntop=document.getElementById('returntop');
   window.onscroll=function(){
      if(window.document.body.scrollTop<250){
        returntop.style.display='none';
      }else{
        returntop.style.display='block';
      }
   }
}