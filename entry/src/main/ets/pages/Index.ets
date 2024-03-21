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
          starEmptyImageUrl: $r('app.media.empty_star'),
          starFullImageUrl: $r('app.media.full_star'),
          starHalfImageUrl: $r('app.media.half_star'),
          starNum: this.starNum,
          starHeight: 50,
          starWidth: 50,
          maxLightIndex: this.maxLightIndex
        }).width('100%')
        Button('点击设置星为1').onClick(() => {
          // this.starNum = 1
          this.maxLightIndex = 3.5
        })
      }
      .width('100%')
    }
    .height('100%').backgroundColor(Color.Black)
  }
}