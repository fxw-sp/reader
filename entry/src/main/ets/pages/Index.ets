//项目首页：引导页面
//需要进行页面跳转，实现跳转到其他功能页

//导入路由函数所在的库
import router from '@ohos.router';

//导入封装好的常量数据模型
import Constants from '../common/Constant'
@Entry
@Component
struct Index {
  @State message: string = 'sign in'
  @State phone: string = ''
  @State pass: string = ''
  build() {
    Row() {
      Column() {
        Text("登录").margin({bottom:'20'}).fontSize(30)
        TextInput({placeholder:'请输入账号'}).onChange((value:string)=>{
          this.phone = value
        })
        TextInput({placeholder:'请输入密码'}).margin({ top: 30 })
          .type(InputType.Password).onChange((value:string)=>{
          this.pass = value
        })
        Button(this.message,{stateEffect:true})
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .margin({ top: 20 })
            //创建点击事件：实现页面跳转到功能页
          .onClick(()=>{
            if(this.phone.length > 0 && this.pass.length > 0) {
              router.pushUrl({
                url: 'pages/List',
                params: {
                  appName: 'ToBuyList 2.0',
                  phone: this.phone,
                  pass: this.pass,
                }
              }).then(() => {
                console.info('成功.')
              }).catch((err) => {
                console.error(`Failed to jump to the second page.Code is ${err.code}, message is ${err.message}`)
              })
            }
          })
      }
      .padding(30)
    }
    .height('100%')
    //调用常量数据模型，设置背景颜色
    .backgroundColor(Constants.BACKGROUND)
  }
}
