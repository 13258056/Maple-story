关于github提交次数较少的原因：中途（6.24）将项目移植到类了felgo中，所以重新创建了一个仓库进行提交，导致6.24以前的提交没有了。

打开CmakeLists.txt可能出现的问题：
1.项目中qml文件下的.qml文件丢失，本地文件夹中存在，可以将“项目”更改为“文件系统”，然后将原有build目录删除，重新构建，即可正常运行

