import { RatingBar } from '../components/RatingBar';

@Entry
@Component
struct Index {
  @State message: string = 'Hello World';
  @State starNum:number = 5

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
          LightIndex:0
        }).width('100%')
        Button('点击设置星为1').onClick(()=>{
          this.starNum = 1
        })
      }
      .width('100%')
    }
    .height('100%').backgroundColor(Color.Black)
  }
}