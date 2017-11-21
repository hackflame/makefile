makefile使用文档

make 编译 
make install 安装
make uninstall 卸载
make clean 清除缓存

使用方法
主目录下有个config.mk 文件 需要时进行修改，具体可看注释

在src 目录 每个主文件夹，例如 APP，math,jpg 有对应的子makefile  自行修改编译路径即可，如果要支持
每个模块的递归文件编译.c 请修改 BUILD_DIR 变量，加上相对路劲即可

功能：
     支持 头文件更新 自动探测
     支持 分模块编译，每个子模块的makefile是单独并以 除主程序外(因为他需要各种依赖库)
     支持 自动探测 当前目录的子一级目录 .c 如果您的.c 在app目录的一个子目录下，那么您不需要额外修改
     支持 安装与卸载
     支持 多进程编译


目录结构:

├── bin
│   └── mp3
├── config.mk
├── inc
│   ├── jpg.h
│   ├── maths.h
│   ├── player.h
│   ├── sp.h
│   ├── test.h
│   └── usb.h
├── lib
│   ├── ext_lib
│   │   └── libtest.so
│   ├── libjpg.a
│   └── libmaths.so
├── makefile
├── requirement.txt
├── src
│   ├── app
│   │   ├── main.c
│   │   ├── makefile
│   │   ├── player
│   │   │   └── player.c
│   │   ├── sp
│   │   │   └── sp.c
│   │   └── usb
│   │       └── usb.c
│   ├── common.mk
│   ├── config.mk
│   ├── jpg
│   │   ├── jpg.c
│   │   └── makefile
│   └── math
│       ├── makefile
│       └── maths.c
├── test
│   └── test.c
└── tmp
    ├── d
    │   ├── jpg.d
    │   ├── main.d
    │   ├── maths.d
    │   ├── player.d
    │   ├── sp.d
    │   └── usb.d
    ├── lib_obj
    │   ├── jpg.o
    │   └── maths.o
    └── link_obj
        ├── main.o
        ├── player.o
        ├── sp.o
        └── usb.o

bin:为目标程序 生成目录
inc:头文件管理目录
lib:为库目录，存放自己编译的静态或动态库
	该目录下有ext_lib目录为第三方引用动态或者静态库

src:为源码管理目录
    app目录主程序目录,根据makefile的配置修改
    jpg是静态库例子
    math为动态库例子
    可随意增加,目前支持自动扫描 app,jpg,math等目录的子一层目录，二级目录暂时不支持

test:第三方测试库

tmp:临时生成的文件    

