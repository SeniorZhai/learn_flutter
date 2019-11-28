### 初始化
- initState()
  > 插入渲染树的时候调用，只会调用一次
  1. 初始化状态，创建一些依赖BuildContext的小部件
  2. 初始化属性
  3. 订阅流或者监听器，用于改变小部件的状态
  - mounted == true
- didChangeDependencies()
  > 初始化时 在initState()之后立即调用 当依赖`InheritedWidget rebuild`会触发此接口被调用
### 运行时
- build()
  > 调用多次 初始化后开始绘制界面，当`setState`触发时再次被调用
- didUpdateWidget()

### 移除
- deactivate()
  > 在彻底移除钱调用
- dispose()
  > 移除组件
  - mounted == false

## InheritedWidget
特殊的Widget 可以将另一个子树的父级放在Widgets树中，该子树的所有小部件可以与该InheritedWidget公开数据进行交互

