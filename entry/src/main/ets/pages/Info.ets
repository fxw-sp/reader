import Constants from '../common/Constant'
import router from '@ohos.router'
import { position } from '../common/ConfigPosition';
@Entry
@Component
struct Info {
  @State content:string = ""
  @State title:string = ""
  @State fontSizeNum:number = 18
  @State lineHeightNum:number = 29
  @State pageList:Array<string> = []
  @State current:number = 0 // 当前页数
  @State totalPages:number = 0 // 总页数

  onPageShow(){
    const params = router.getParams(); // 获取传递过来的参数对象
    this.title = params['title']; // 获取title属性的值
    this.content = params['info']; // 获取info属性的值
    let word = params['screenWidth'] / this.fontSizeNum * this.lineHeightNum // 每页字数
    console.log("屏幕：",params['screenWidth'])
    // 总页数 = 总字数 / 每页字数
    this.totalPages = Math.ceil(params['info'].length / word)
    console.log("总页数为多少",this.totalPages,params['info'].length,word)
    for (let i = 0; i < this.totalPages; i++) {
      const start = i * word;
      const end = Math.min(start + word, this.content.length);
      const pageContent = this.content.substring(start,end);
      this.pageList.push(pageContent);
    }
    // for (let i = 0; i < this.content.length; i += word) {
    //   const pageContent = this.content.substring(i, i + word);
    //   this.pageList.push(pageContent);
    // }
  }

  build() {
    Column(){
      Text(this.pageList[this.current]).fontSize(this.fontSizeNum).lineHeight(this.lineHeightNum)
    }
    .padding(15)
    .width("100%")
    .height("100%")
    .backgroundColor(Constants.BACKGROUND)
    .onClick((event:any)=>{
      // 对数据进行分页操作
      if(position(event) === 'left' && this.current === 0){
        router.back()
      }else if(position(event) === 'left' && this.current !== 0){
        this.current = this.current - 1 // 上一页
      }else {
        if(this.current < this.totalPages - 1)
        this.current = this.current + 1 // 下一页
      }
    })
  }
}