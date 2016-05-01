# 数据采集系统
> 该系统是我毕业设计使用的系统，系统比较小，但是实现起来比较复杂，该版本是最原始的版本，配置文件中使用的约束dtd文件等都是本地的问题，所以直接download肯定运行不起来。
> 下面说一说该系统使用到的技术点

## 一、SSH框架搭建
> 该系统是数据采集系统，说白了就是问卷调查系统，它和考试系统中使用到的技术点基本上是一样的。
> 这里使用了最流行的SSH框架实现。
	
	Eclipse版本：Eclipse Java EE IDE for Web Developers,Mars Release (4.5.0)
	Hibernate版本：hibernate-distribution-3.5.6-Final
	Spring版本：spring 3.1.0
	Struts2版本：struts2 2.3.1.2
	使用的数据库：mysql 5.5
	使用的数据库连接池：c3p0-0.9.1.2
## 二、数据加密
``` java
//TODO md5加密工具
    public static synchronized String md5(String input){
        try {
            StringBuffer sb=new StringBuffer();
            String arr[]={"0","1","2","3","4","5","6","7","8","9","A","B","C","D","E","F"};
            MessageDigest messageDigest=MessageDigest.getInstance("MD5");
            byte []data=messageDigest.digest(input.getBytes());
            System.out.println(data.length);
            for(byte temp:data){
                //高四位
                sb.append(arr[(temp>>4)&0X0F]);
                //低四位
                sb.append(arr[temp&0X0F]);
            }
            return sb.toString();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "";
    }
```
## 三、使用串行化技术实现页的深度复制
``` java
//实现深度复制的方法
    //在实现深度复制之前必须修改Bean类中的相关字段，
    //比如Page类中的pageId必须加上transient修饰，还有Question类中的questionId字段也必须加上transient修饰
    private Serializable copyPage(Page oldPage) {
        oldPage.getQuestions().size();
        try {
            ByteArrayOutputStream baos=new ByteArrayOutputStream();
            ObjectOutputStream oos=new ObjectOutputStream(baos);
            oos.writeObject(oldPage);
            ByteArrayInputStream bais=new ByteArrayInputStream(baos.toByteArray());
            ObjectInputStream ois=new ObjectInputStream(bais);
            Serializable serializable=(Serializable) ois.readObject();
            return serializable;
        } catch (IOException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return null;
    }
```
## 四、二进制运算实现权限管理
这里的权限管理比较复杂，使用图进行说明比较清晰：
### 1.如何存储权限
首先说一下权限保存的问题，一个系统中最多有多少权限呢？一个大的系统中可能有成百上千个权限需要管理。怎么保存这么多的权限？首先，我们使用一个数字中的一位保存一种权限，那么如果现在有3600种权限需要保存，我们就需要一个3600位的数字来保存该权限，首先我们如果不考虑大数的话其它数据类型是没有办法保存这么长的数字的。所以我们为了能够保存这么多的权限，就引入了一个“权限组”的概念，这个权限组只是一个标识权限的容器，我们使用long类型的数字来保存63个权限，假设我们使用long类型的数字来保存权限组，那么很轻松的就能保存住几乎近天文数字个权限。
### 2.如何保存权限
> 如果有一个添加新权限的界面，该怎么添加权限呢？首先，可以给出权限名称和权限指向的url地址以及权限描述，但是不能提供权限位和权限码的编辑，权限位和权限码的计算需要系统自动计算出来。
> 保存权限的流程图如下：

![使用<<添加权限](http://images2015.cnblogs.com/blog/516671/201512/516671-20151218210552927-545553902.jpg)
### 3.如何判断用户是否有指定的权限
> 我们给给权限一个“public”的属性，我们使用该属性标识该资源是否需要有相关权限才能够访问，如果该属性为true，表示该资源是公共资源，不需要任何权限就能访问。每一个权限都唯一的标志了一个url，所谓的是否有权限实际上就是是否有权限访问该url。

![使用&运算判断权限](http://images2015.cnblogs.com/blog/516671/201512/516671-20151218212928084-2021787109.jpg)

### 4.如何计算用户的权限总和（rightSum数组）
使用|运算，公式：rightSum[right.pos]=right.pos|rightSum[right.pos];

## 五、日志管理
使用Spring可以很方便的实现日志的管理，配置方式可以参考事务的配置。

## 六、其他
该系统还是用了JFreechart框架、Spring分库和分表、Spring时钟等比较有趣的东西，但实际上最难的还是设计上，如果没有老师指导，我没有自信能够做得出来。

## 七、安装使用方法
1. 创建数据库lsn_surveypark，并且设置root密码为5a6f38
2. 启动tomcat，如果没有报错，就表示已经成功创建了所有需要的表。
3. 运行com.kdyzm.init.InitRight类初始化权限

	```
	初始化权限的时候很有可能会失败，需要先将log在spring配置文件中删掉或者注释掉，否则很有可能会初始化失败。
	```

4. 通过http://127.0.0.1:8080/LSN_ServyPark 访问服务，首先需要注册，注册成功之后首先需要修改权限的“public”属性，将所有涉及登录和注册的权限都放开，其余全部设置为非public的权限，这么做是为了防止在创建Survey的时候或者访问survey的时候报空指针异常。