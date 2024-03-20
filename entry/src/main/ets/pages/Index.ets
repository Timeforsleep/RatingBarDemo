import { RatingBar } from '../components/RatingBar';

@Entry
@Component
struct Index {
  @State message: string = 'Hello World';

  build() {
    Row() {
      Column() {
        RatingBar({starEmptyImageUrl:$r('app.media.empty_star')}).width('100%')
      }
      .width('100%')
    }
    .height('100%').backgroundColor(Color.Black)
  }
}