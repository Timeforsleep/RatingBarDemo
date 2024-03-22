import { RatingBar } from '../components/RatingBar';

@Entry
@Component
struct Index {
  @State message: string = 'Hello World';
  @State starNum: number = 5
  @State maxLightIndex: number = 0
  @State starHeight: number = 50
  @State starWidth: number = 50
  @State starEmptyImageUrl: ResourceStr | string = $r('app.media.empty_star')
  @State starFullImageUrl: ResourceStr | string = $r('app.media.full_star')
  @State starHalfImageUrl: ResourceStr | string = $r('app.media.half_star')

  build() {
    Row() {
      Column() {
        RatingBar({
          starEmptyImageUrl: this.starEmptyImageUrl,
          starFullImageUrl: this.starFullImageUrl,
          starHalfImageUrl: this.starHalfImageUrl,
          starNum: this.starNum,
          starHeight: this.starHeight,
          starWidth: this.starWidth,
          maxLightIndex: this.maxLightIndex
        }).width('100%')
        Button('点击设置星数为1').onClick(() => {
          this.starNum = 1
        })
        Button('点击设置星数为8').onClick(() => {
          this.starNum = 8
        })
        Button('点击设置分为3.5').onClick(() => {
          this.maxLightIndex = 3.5
        })
        Button('点击设置宽高为80').onClick(() => {
          this.starHeight = 80
          this.starWidth = 80
        })
        Button('点击设置图片')
        Button('复原').onClick(()=>{
          this.starNum = 5
          this.starHeight = 50
          this.starWidth = 50
          this.maxLightIndex = 0
        })
      }
      .width('100%')
    }
    .height('100%')
  }
}