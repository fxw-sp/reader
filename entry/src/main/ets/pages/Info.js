import Constants from '../common/Constant';
import router from '@ohos.router';
import { position } from '../common/ConfigPosition';
struct Info extends   {
    constructor() { }
    onPageShow() {
        const params = router.getParams(); // 获取传递过来的参数对象
        this.title = params['title']; // 获取title属性的值
        this.content = params['info']; // 获取info属性的值
        // 每页字数
        this.totalPage = params['info'].length;
    }
    build() {
            .padding(15)
            .width("100%")
            .height("100%")
            .backgroundColor(Constants.BACKGROUND)
            .onClick((event) => {
            // 对数据进行分页操作
            if (position(event) === 'left' && this.current === 0) {
                router.back();
            }
            else if (position(event) === 'left' && this.current !== 0) {
                this.current = this.current - 1; // 上一页
            }
            else {
                this.current = this.current + 1; // 下一页
            }
        });
    }
}
//# sourceMappingURL=Info.js.map