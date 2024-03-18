import router from '@ohos.router'
import Constants from '../common/Constant'
import display from '@ohos.display';
let storage = new LocalStorage({ 'screenWidth': 0 });
@Entry(storage)
@Component
struct Detail {
  @State content:Object = {}
  onPageShow(){
    const params = router.getParams(); // 获取传递过来的参数对象
    this.content = params['content']; // 获取content属性的值
  }
  build() {
    Column({space:20}){
      Text(this.content['name']).fontSize('25').margin({top:'20'})
      Image(this.content['pic']).width("70%").borderRadius("10")
      Flex({ justifyContent: FlexAlign.SpaceAround }){
        Column({space:5}){
          Row({space:2}){
            Text(this.content['scores']).fontSize("20").textAlign(TextAlign.Center)
            Text("分").fontSize("10").margin({top:'10'}).fontWeight(600)
          }
          .margin({top:'5'})
          Text("1313人评论").fontSize("10").fontColor("#727272")
        }
        .backgroundColor("#fff")
        .borderRadius("10")
        .width("22%")
        .height("150px")

        Column({space:3}){
          Row({space:2}){
            Text(this.content['reader']).fontSize("20").textAlign(TextAlign.Center)
            Text("万人").fontSize("10").margin({top:'10'}).fontWeight(600)
          }
          .margin({top:'5'})
          Text("正在阅读").fontSize("10").fontColor("#727272")
        }
        .backgroundColor("#fff")
        .borderRadius("10")
        .width("22%")
        .height("150px")

        Column({space:5}){
          Row({space:2}){
            Text(this.content['ticket']).fontSize("20").textAlign(TextAlign.Center)
            Text("票").fontSize("10").margin({top:'10'}).fontWeight(600)
          }
          .margin({top:'5'})
          Text("累计必度票").fontSize("10").fontColor("#727272")
        }
        .backgroundColor("#fff")
        .borderRadius("10")
        .width("22%")
        .height("150px")
      }
      Column({space:8}){
        Text("简介").fontSize("23").textAlign(TextAlign.Start).fontWeight(600)
        Row(){
          Text(this.content['desc']).lineHeight(25)
        }
      }
      .width("100%")
      .padding({left:15,right:15})
      .alignItems(HorizontalAlign.Start)

      Column({space:10}){
        Flex({justifyContent:FlexAlign.SpaceBetween}){
          Text("热门书评").fontSize("20").textAlign(TextAlign.Start).fontWeight(600)
          Text("查看1313条书评").fontSize("14").fontColor("#0c73ff")
        }
        Row({space:8}){
          Image("image/04.jpg").width("10%").borderRadius(50)
          Text("对我来说这是一本比较有意思的小说，里面的女主外刚内柔，该爱敢恨，对于男二的欺骗力斩孽缘")
            .width("90%")
            .fontSize(14)
            .textOverflow({overflow:TextOverflow.Ellipsis}).maxLines(2).lineHeight(22)
        }
        Row({space:8}){
          Image("image/06.jpg").width("10%").borderRadius(50)
          Text("对我来说这是一本比较有意思的小说，里面的女主外刚内柔，该爱敢恨，对于男二的欺骗力斩孽缘")
            .width("90%")
            .fontSize(14)
            .textOverflow({overflow:TextOverflow.Ellipsis}).maxLines(2).lineHeight(22)
        }
        Row({space:8}){
          Image("image/08.jpg").width("10%").borderRadius(50)
          Text("对我来说这是一本比较有意思的小说，里面的女主外刚内柔，该爱敢恨，对于男二的欺骗力斩孽缘")
            .width("90%")
            .fontSize(14)
            .textOverflow({overflow:TextOverflow.Ellipsis}).maxLines(2).lineHeight(22)
        }
      }
      .width("100%")
      .padding({left:15,right:15})
      .alignItems(HorizontalAlign.Start)
    }
    .width('100%')
    .height("100%")
    .backgroundColor(Constants.BACKGROUND)
    .onClick((event:any)=>{
      console.log("屏幕宽度==",JSON.stringify(event.target))
      let screenWidth = display.getDefaultDisplaySync().width === 0 ? event.target.area.width : display.getDefaultDisplaySync().width
      const touchX = event.screenX;
      const midPoint = screenWidth / 2
      if(Number(touchX) > Number(midPoint)){
        router.pushUrl({
          url: 'pages/Info',
          params: {
            appName: 'Info',
            title: this.content['name'],
            info: this.content['textCon'],
            screenWidth: screenWidth
          }
        })
      }
    })
  }
}