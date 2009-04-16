未实现功能:
一.论坛
..在线会员
..论坛版主
..威望值/金钱
三.博客
..推荐/顶和踩
三.社区
..拍拍
..优秀空间展示
四.首页
..企业建站
..搜索功能
..会员服务
..帮助中心
..网站地图
五.信息版块
..标签(Ajax点击添加标签的功能)
..最近浏览历史
..找朋友功能中的寻找同好的.
..将info_category表删除掉.把info_categories控制器删掉.将/infos/new页面的select改为手写式的.  

登录跳转的时机,并且,如果是跳转到登录页面,应有flash提示
论坛回帖时,未作登录要求,且在controller里直接调用logged_in_user


2) <%= image_tag("../images/#{@space.stylename}.jpg")%> 用f.stylename获取不到
6)map.resources :控制器名 控制器单复数与resource/resources保持一致.这是错的.  resource对应的控制器名必须是复数.  而resources对应的可以是复数,也可以是单数.生成的资源不一样.
7)如果从action传过变量@theme = Theme.new.来,在view里的form_for中:theme会自动作字段的验证.
9)form_for @user 当update时不验证.
10) helper path 传id  传入的参数可以是单一的,也可以是个hash
12) password验证在更新的时候报错.
13) update_attributes 不好用.到Model里验证出错.
14)在用户上传图片的时候, 默认将刚上传的这的primary字段设为true,查找出原来的那一个来.设为false.这样就能保证每次新上传的为封皮的功能.
15)消费点评小分类/admin/servecategories/show.html.erb待定
16)Entry/Ask里的标签读不出来.单个能读出来.读不出来该用户下的所有与日志相关的标签.
17)缩略图大小待定


18)在找朋友的搜索密友的功能上,根据用户名/email/id来查找用户的时候,like报错.以及 user_infos i.报错.不识别别名.
19)企业建站 因为没有这块功能暂时搁置.
20)社区下的四个版块(许愿板...发泄筒)在调用JS的时候,只有1好用.
21)Forum/index首页要显示最新帖子/最新回复/及热门帖子十条.在做显示是否有最新回复时,需要判断.没解决.





11)RJs 分页功能
has_many :跟的是表名还是模型的名字.多对多表时用_??还是不用??
<%= link_to '我的好友', :controller => 'friends', :user_id => @user%>与 
<%= link_to '我的好友', :controller => 'friends', :id => @user%>产生的路由不同,自动通过REST匹配上资源前缀






1)@space = @user.space.create(:address => "i.#{request.host}/#{@user.username}")   nil.create.得不到user_id.晕...
3) redirect_to :controller => 'admin/site', :action => 'login'
4)NoMethodError
er)reset_session: 产生的record_id问题.
8)redirect_to request.url (如何转向删除前的一个request_url)
11)自定义map.resources collection/member 所指定的action方法时要指定http访问方法.并在调用时显示指定.
12)免费预约功能.(现在暂时留着.待处理..reservations
13)vim编码乱码的话, :set fenc=utf-8 设定以后,重新保存一下
18)想要显示一条浏览次数最多的topic显示不了.在model里写了一个方法调用显示有问题.待解决 
20)循环显示产品分类这块获取不了循环里面的id显示不了样式里面的图片.
21)同样问题在明星会员处也要获取循环里面的index.(each_with_index没研究明白.)


