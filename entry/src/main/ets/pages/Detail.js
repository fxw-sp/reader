import router from '@ohos.router';
import Constants from '../common/Constant';
import { position } from '../common/ConfigPosition';
struct Detail extends   {
    constructor() { }
    onPageShow() {
        const params = router.getParams(); // 获取传递过来的参数对象
        this.content = params['content']; // 获取content属性的值
    }
    build() {
            .width('100%')
            .height("100%")
            .backgroundColor(Constants.BACKGROUND)
            .onClick((event) => {
            if (position(event) === 'right') {
                router.pushUrl({
                    url: 'pages/Info',
                    params: {
                        appName: 'Info',
                        title: this.content['name'],
                        info: this.content['textCon']
                    }
                });
            }
        });
    }
}
//# sourceMappingURL=Detail.js.map