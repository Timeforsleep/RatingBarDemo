import { RatedStarBean } from '../bean/RatedStarBean'
import { RatedStar } from './RatedStar'


@Component
export struct RatingBar {
  @State starNum: number = 0
  @State LightIndex: number = 0
  starFullImageUrl: ResourceStr | string = '' /*$r('app.media.full_star')*/
  starHalfImageUrl: ResourceStr | string = '' /*$r('app.media.half_star')*/
  starEmptyImageUrl: ResourceStr | string = '' /*$r('app.media.empty_star')*/
  starHeight: number = 50
  starWidth: number = 50
  @State maxLightIndex: number = 0
  @State starsArr: RatedStarBean[] = []

  aboutToAppear(): void {
    console.log(`gyk回调`)
    for (let index = 0; index < this.starNum; index++) {
      this.starsArr.push(new RatedStarBean(this.starEmptyImageUrl, this.starHeight, this.starWidth))
    }
  }

  build() {
    Row() {
      ForEach(this.starsArr, (item: RatedStarBean, index) => {
        RatedStar({
          ratedStarBean: item,
          index: index,
          maxLightIndex: $maxLightIndex,
          starFullImageUrl: this.starFullImageUrl,
          starHalfImageUrl: this.starHalfImageUrl,
          starEmptyImageUrl: this.starEmptyImageUrl
        })
      })
    }.width('100%').justifyContent(FlexAlign.SpaceBetween)
  }
}