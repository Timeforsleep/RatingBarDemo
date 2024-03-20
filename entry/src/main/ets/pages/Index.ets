import { RatingBar } from '../components/RatingBar';

@Entry
@Component
struct Index {
  @State message: string = 'Hello World';

  build() {
    Row() {
      Column() {
        RatingBar({
          starEmptyImageUrl: $r('app.media.empty_star'),
          starFullImageUrl: $r('app.media.full_star'),
          starHalfImageUrl: $r('app.media.half_star'),
          starNum: 5,
          starHeight: 50,
          starWidth: 50
        }).width('100%')
      }
      .width('100%')
    }
    .height('100%').backgroundColor(Color.Black)
  }
}