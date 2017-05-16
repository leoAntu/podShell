

一款快速上传项目到git及建立自己的私有Pod源脚本，方便快捷。[下载podShell](https://github.com/leoAntu/podShell)

- 1.先到git上开一个repo。
    ![](https://github.com/leoAntu/leoImagesStorage/blob/master/leoImagesStorage/B60AC312-71C3-4C7B-A7BD-668D4351C0E0.png?raw=true)
    
- 2.创建文件夹，将podShell拖入到文件夹。
 通过终端进入文件夹路径。
 ![](https://github.com/leoAntu/leoImagesStorage/blob/master/leoImagesStorage/1BB6C498-C4DE-40DF-B8F5-E92BBC5D56D1.png?raw=true)
 
 - 3.运行.config.sh文件。
 依次填入对应的信息
 ![](https://github.com/leoAntu/leoImagesStorage/blob/master/leoImagesStorage/66233E78-521E-464C-A275-4F6AF20BCB29.png?raw=true)
 
最后发现podShell同级文件夹会如下图所示。
![](https://github.com/leoAntu/leoImagesStorage/blob/master/leoImagesStorage/98E63650-F698-41B5-BC75-A0B02E3D34D2.png?raw=true)

- 4.将需要上传的文件拖入到图中Demo文件夹目录即可,运行tag.sh
    输入对应的tag号
    ![](https://github.com/leoAntu/leoImagesStorage/blob/master/leoImagesStorage/C4ACFA9F-0398-4B66-98FC-7E02D672FA80.png?raw=true)
    
**此时已经将项目上传至git并打上tag值。但是还没有发布自己的Pods。**

- 5.注册Trunk

```
pod trunk register email 'name' --description='macbook air'
```
![](https://github.com/leoAntu/leoImagesStorage/blob/master/leoImagesStorage/87A7C773-625D-4228-8253-E7462704AB6C.png?raw=true)

此时，你的邮箱会收到一封邮件。复制链接打开即可。(一般只需注册一次即可，后期发布其他项目都不需)
![](https://github.com/leoAntu/leoImagesStorage/blob/master/leoImagesStorage/F0DA55C8-274A-4A3E-A34C-08E884C9484D.png?raw=true)

- 6.发布到pod trunk

```
pod trunk push leoTestDemo.podspec
```

![](https://github.com/leoAntu/leoImagesStorage/blob/master/leoImagesStorage/D93F3646-04DE-49D8-91F7-94C9C53E4480.png?raw=true)
如上图所示发布成功

- 7.更新pod库

发布成功。通过pod search指令可能不是立即找到我们发布的项目，可通过下面两条指令操作。

```
pod setup
```

删除本地索引

```
rm -f ~/Library/Caches/CocoaPods/search_index.json
```

