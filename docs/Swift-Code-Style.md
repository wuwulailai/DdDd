Swift-Code-Style
公司在做代码规范和组件化的跳转。 鉴于使用Objective-C的开发成员比较多， 我们架构师就整理了Objective-C的代码规范。不过作为Swift开发的老司机，也整理了一套适用与Swift的代码规范。 以后可以直接拿来用了。

注释

1
2
3
4
 // 单行注释
 /*  多行注释  */
 /// 标记注释1
 /** 标记注释2 */
建议使用VVDocument-Xode插件

文档注释

以/* ..../ 标记， 不用再没一行开头都加*号，支持markdown书写，例如：

1
2
3
4
5
6
7
8
9
10
11
12
13
14
15
16
17
18
19
20
/**
 ## Feature Support
 This class does some awesome things. It supports:
 - Feature 1
 - Feature 2
 - Feature 3
 ## Examples
 Here is an example use case indented by four spaces because that indicates a
 code block:
     let myAwesomeThing = MyAwesomeClass()
     myAwesomeThing.makeMoney()
 ## Warnings
 There are some things you should be careful of:
 1. Thing one
 2. Thing two
 3. Thing three
 */
class MyAwesomeClass {
    /* ... */
}
方法注释

用 - parameter注释来标记参数等

1
2
3
4
5
6
7
/**
 This does something with a `UIViewController`, perchance.
 - warning: Make sure that `someValue` is `true` before running this function.
 */
func myFunction() {
    /* ... */
}
命名

使用可读的驼峰命名法去给类 方法 变量 命名。 class struct protocol enum 应使用大写，变量名使用小写

1
2
3
4
5
private let maximumWidgetCount = 100
class WidgetContainer {
  var widgetButton: UIButton
  let widgetHeightPercentage = 0.85
}
对于全局函数，init方法 ，建议每个参数都使用外部变量，来保证可读性

1
2
3
4
5
6
7
func dateFromString(dateString: String) -> NSDate
func convertPointAt(column column: Int, row: Int) -> CGPoint
func timedAction(afterDelay delay: NSTimeInterval, perform action: SKAction) -> SKAction!
// would be called like this:
dateFromString("2014-03-14")
convertPointAt(column: 42, row: 13)
timedAction(afterDelay: 1.0, perform: someOtherAction)
Protocols 协议命名

建议遵守Apple's API DesignGuidelines使用名词来描述，如 ing able ible，例如

1
2
3
4
Collection
WidgerFactory
Equtable
Resizing
Emumerations 枚举命名规范

使用首字母小写的驼峰命名法给每个case命名

1
2
3
4
5
6
enum Shape {
  case rectangle
  case square
  case rightTriangle
  case equilateralTriangle
}
Class Prefixes类型前缀

官方建议不使用前缀，因为swift有命名空间的概念

但是由于在项目开发中不可避免使用开源库，大部分使用pods管理，但是有时候需要针对需要定制功能，直接修改源码，这时候是直接将源码放在工程中，而且大部分的项目都是混编项目。可能导致命名冲突，此处还建议用LJ(Lianjia)当作命名前缀

1
class LJHomeViewController: UIViewController {}
Selector选择器

建议使用可推测的上下文环境，来创建选择器，而不是点击Xcode的Fix it ，这样会产生一个全名称 选择器

1
let sel = #selector(viewDidLoad)
不推荐

1
let sel = #selector(ViewController.viewDidLoad)
Generics泛型

泛型命名应该使用大写的驼峰命名法，，如果给一个泛型起名字其实没意义，可以使用常见的T，U，V来命名

推荐

1
2
3
struct Stack{ ... }
func writeTo(inout target: Target)
func max(x: T, _ y: T) -> T
不推荐

1
2
3
struct Stack{ ... }//命名无意义
func writeTo(inout t: target)// 首字母未大写
func max(x: Thing, _ y: Thing) -> Thing//简称即可
Code Formatting 代码格式

留空白

建议使用tabs 而不是使用空格
文件结束时留一行空白
用足够的空行把代码分割为合理的逻辑块，而不是非常紧凑
不要在一行代码结尾处留空格
更不要在空行（\n）中使用缩进（\t）
声明类型时，将冒号与标识符连在一起

当声明一个变量时冒号紧跟变量，空一格再写类型

1
2
3
class SmallBatchSustainableFairtrade: Coffee { ... }
let timeToCoffee: NSTimeInterval = 2
func makeCoffee(type: CoffeeType) -> Coffee { ... }
Control Flow 控制流

建议使用Swift范的for in 循环而不是 while or c 式for循环

1
2
3
4
5
6
7
8
9
10
11
12
for _ in 0..<3 {
  print("Hello three times")
}
for (index, person) in attendeeList.enumerate() {
  print("\(person) is at position #\(index)")
}
for index in 0.stride(to: items.count, by: 2) {
  print(index)
}
for index in (0...3).reverse() {   //3，2，1，0
  print(index)
}
代码块缩进

(if/else/switch/while etc.)或者method function 的大括号留在当前行，并前保留一个空格 ，能省略的不要添加

如

1
2
3
4
5
if user.isHappy {
  // Do something
} else {
  // Do something else
}
不推荐

1
2
3
4
5
6
7
if (user.isHappy ) 多余空格
{                  换行位置不对
  // Do something
}
else {
  // Do something else
}
Early Return

当你遇到某些操作需要条件判断去执行，应该使用防御式编程 尽早返回

如

1
2
3
4
5
6
7
8
9
10
11
12
13
14
15
16
17
18
19
20
21
22
23
24
25
26
27
28
29
guard n.isNumber else {
    return
}
guard let number1 = number1, number2 = number2, number3 = number3 else { fatalError("impossible") }
// do something with numbers
// Use n here
//guard 理解为确保的意思，  如 确保n是一个数字
不推荐使用if判断
if n.isNumber {
    // Use n here
} else {
    return
}
if let number1 = number1 {
  if let number2 = number2 {
    if let number3 = number3 {
      // do something with numbers
    }
    else {
      fatalError("impossible")
    }
  }
  else {
    fatalError("impossible")
  }
}
else {
  fatalError("impossible")
}
Semicolons 分号

不要写分号，不要写分号，不要写分号 Swift不同于JavaScript ,详情参看：

generally considered unsafe---Do you recommend using semicolons after every statement in JavaScript?

更不建议把多句代码块放在一行中

自定义运算符的时候左右尽量各保留一个空格

如

1
2
3
4
5
func <|(lhs: rhs:="" -=""> Int
func <|<(lhs: A, rhs: A) -> A
// 重构后
func <| lhs:="" rhs:="" -=""> Int
func <|< (lhs: A, rhs: A) -> A
代码分割

使用良好的代码分割让你的代码块更具有逻辑性

1
2
// MARK: -      类似@parma mark -
// MARK:        类似@parma mark
ProtocolConformance 协议保持一致性

一个类型实现一个协议时建议单独声明一个扩展，保证逻辑性分离

如

1
2
3
4
5
6
7
8
9
10
11
class MyViewcontroller: UIViewController {
  // class stuff here
}
// MARK: - UITableViewDataSource
extension MyViewcontroller: UITableViewDataSource {
  // table view data source methods
}
// MARK: - UIScrollViewDelegate
extension MyViewcontroller: UIScrollViewDelegate {
  // scroll view delegate methods
}
不推荐实现的所有协议写在一起

1
2
3
class MyViewcontroller: UIViewController, UITableViewDataSource, UIScrollViewDelegate {
  // all methods
}
无用的代码要删除

无用的代码和注释要删除 ，避免给阅读代码的人造成困惑和疑问

类型定义

尽可能的使用swift自带类型，在必须的时候才做桥接 ，String-> NSString , Set->NSSet

更多的使用let，而不是var

尽量let foo = something 而非 var  for = somthing

let-有保障 并且它的值的永远不会改变，对同事也是个 清晰的标记，对于它的用法，之后的代码可以做个强而有力的推断。更容易明白代码的含义。否则的话一旦你用了 var，还要去考虑值会不会改变，这时候你就不得不人肉去检查。

这样，无论何时你看到 var，就假设它会变，并找到原因。

常量

不建议直接命名顶级变量，建议定义在结构体或者枚举内部，用static let 声明。 可以给这些变量一个合适的命名空间

1
2
3
4
5
enum Math {
  static let e  = 2.718281828459045235360287
  static let pi = 3.141592653589793238462643
}
radius * Math.pi * 2 // circumference
Optional可选类型

尽量不要使用强制解包

对于一个可选类型var foo = Type? 不要使用强制解包

1
foo!.doSomethind()
使用可选绑定，或者  可选链操作

1
2
3
4
5
6
7
8
if let foo = foo {
    // Use unwrapped `foo` value in here
} else {
    // If appropriate, handle the case where the optional is nil
}
//或者
// Call the function if `foo` is not nil. If `foo` is nil, ignore we ever tried to make the call
foo?.callSomethingIfFooIsNotNil()
避免使用隐式可选类型

如果 foo 可能为 nil ，尽可能的用 let foo: FooType? 代替 let foo: FooType!（注意：一般情况下，?可以代替!）

Struct Initializers 结构体初始化

使用结构体初始化而不是CGGet。。。之类的创建方法

1
2
let bounds = CGRect(x: 40, y: 20, width: 120, height: 80)
let centerPoint = CGPoint(x: 96, y: 42)
Lazy Initialization

对于较大开销的初始化或者配置较多的初始化建议放在加载属性里

1
2
3
4
5
6
7
8
lazy var locationManager: CLLocationManager = self.makeLocationManager()
private func makeLocationManager() -> CLLocationManager {
  let manager = CLLocationManager()
  manager.desiredAccuracy = kCLLocationAccuracyBest
  manager.delegate = self
  manager.requestAlwaysAuthorization()
  return manager
}
Classes and Structures 结构体和类

首选struct而非class

在非必需（比如没有生命周期）的时候使用struct，因为多态可以使用protocl实现 继承可以使用组合实现

值类型容易辨别，更可以用let去推测不可变的行为

只有在必须时才使用self

忘掉Objective-C到底时使用self.pro 还是_ivar的访问方式，对于swift内部调用properties或者method省略掉self

1
2
3
4
5
6
private class History {
    var events: [Event]
    func rewrite() {
        events = []
    }
}
只有在使用闭包或者命名冲突时再加上self

1
2
3
4
5
6
7
8
9
10
extension History {
    init(events: [Event]) {
        self.events = events
    }
    var whenVictorious: () -> () {
        return {
            self.rewrite()
        }
    }
}
只有在使用闭包时self 增强了被捕获的语义，其它时候是冗余的

对于只读的属性或者下标语法，使用隐式的getter方法

建议

1
2
3
4
5
6
var myGreatProperty: Int {
    return 4
}
subscript(index: Int) -> T {
    return objects[index]
}
不建议完整的写法，比较繁琐

1
2
3
4
5
6
7
8
9
10
var myGreatProperty: Int {
    get {
        return 4
    }
}
subscript(index: Int) -> T {
    get {
        return objects[index]
    }
}
请把class默认标记为final

组合通常比继承更合适，而且不用 继承意味着考虑的更加健壮

1
2
3
4
5
6
7
// Turn any generic type into a reference type using this Box class.
final class Box{
  let value: T
  init(_ value: T) {
    self.value = value
  }
}
类型推断

能让系统推断的类型不要显示指明

如

1
2
3
4
5
6
struct Composite{
    func compose(other: Composite) -> Composite{
        return Composite(self, other)
    }
}
let num:Int = 4
重构为

1
2
3
4
5
6
struct Composite{
    func compose(other: Composite) -> Composite {
        return Composite(self, other)
    }
}
let num = 4
空的字典和空数组的类型 使用类型标记 加强语义

1
2
var names: [String] = []
var lookup: [String: Int] = [:]
函数声明

函数名要简短清晰，如果能保持在一行内，大括号也要保持在一行，如果不能换行并用Tab\b缩进

1
2
3
4
5
6
7
func reticulateSplines(spline: [Double]) -> Bool {
  // reticulate code goes here
}
func reticulateSplines(spline: [Double], adjustmentFactor: Double,
    translateConstant: Int, comment: String) -> Bool {
  // reticulate code goes here
}
闭包表达式

使用尾随闭包提高可读性，

1
2
3
4
5
6
7
8
9
10
11
UIView.animateWithDuration(1.0) {
  self.myView.alpha = 0
}
UIView.animateWithDuration(1.0,
  animations: {
    self.myView.alpha = 0
  },
  completion: { finished in
    self.myView.removeFromSuperview()
  }
)
常见的闭包语义可以使用其缩略形式

1
2
3
4
5
let value = numbers.map { $0 * 2 }.filter { $0 % 3 == 0 }.indexOf(90)
let value = numbers
   .map {$0 * 2}
   .filter {$0 > 50}
   .map {$0 + 10}
Syntactic Sugar语法糖

对于有语法糖的建议使用，提升可读性

如

1
2
3
var deviceModels: [String]
var employees: [Int: String]
var faxNumber: Int?
而不是

1
2
3
var deviceModels: Array
var employees: Dictionary
var faxNumber: Optional
内存管理

对于class类型需要注意内存管理

普通的闭包建议使用[weak self] 或者[unowned self] 对于异步的闭包建议使用 [weak self] and  guard let strongSelf = self else { return }搭配使用

weak 避免出现循环引用， strongself 避免在异步回调中 捕获列表中捕获的变量被析构

1
2
3
4
5
resource.request().onComplete { [weak self] response in
  guard let strongSelf = self else { return }
  let model = strongSelf.updateModel(response)
  strongSelf.updateUI(model)
}
对于顶级类型，函数，变量定义，明确的列出权限控制

对于全局变量 顶级函数，类型，永远应该有着详尽的权限控制说明符

1
2
3
public var whoopsGlobalState: Int
internal struct TheFez {}
private func doTheThings(things: [Thing]) {}