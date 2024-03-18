import display from '@ohos.display';
// 鼠标左、右点击
export const position = (event:any) => {
  let screenWidth = display.getDefaultDisplaySync().width === 0 ? event.target.area.width : display.getDefaultDisplaySync().width
  const touchX = event.screenX;
  const midPoint = screenWidth / 2

  if(Number(touchX) < Number(midPoint)){
  //   左侧
    return "left"
  }else {
  //   右侧
    return "right"
  }
}

let storage = new LocalStorage({ 'screenWidth': 0 });
@Entry(storage)
@Component
struct Config {
  @LocalStorageProp('screenWidth') storProp1:number = 1
  build() {

  }
}
